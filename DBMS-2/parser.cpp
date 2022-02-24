#include <iostream>
#include <fstream>
#include <string>
#include <string.h>
#include <map>
using namespace std;

int main()
{
    string s;
    ifstream Myfile("source.txt");
    ofstream paper;
    ofstream author;
    ofstream venue;
    ofstream written_by;

    paper.open("paper.csv");
    author.open("author.csv");
    venue.open("venue.csv");
    written_by.open("written_by.csv");

    paper << "paper_id#title#abstract#year\n";
    author << "auth_id#first#last\n";
    venue << "v_name#paper_id\n";
    written_by << "auth_id#paper_id#rank\n";

    getline(Myfile, s);

    string p_row;
    string paper_id;
    string title;
    string abstract;
    string year;

    string v_row;
    string v_name;

    string a_row;
    string authors;
    map<string, int> mp;
    int a_id = 1;

    int i = 0;
    int p_id = 0;
    while (getline(Myfile, s))
    {
        if (s.substr(0, 2) == "#*")
            title = s.substr(2, s.length() - 2);
        if (s.substr(0, 2) == "#t")
            year = s.substr(2, s.length() - 2);
        if (s.substr(0, 6) == "#index")
            paper_id = s.substr(6, s.length() - 6);
        if (s.substr(0, 2) == "#!")
            abstract = s.substr(2, s.length() - 2);

        if (s.substr(0, 2) == "#c")
            v_name = s.substr(2, s.length() - 2);

        if (s.substr(0, 2) == "#@")
        {
            int rank = 1;
            authors = s.substr(2, s.length() - 2);
            string author = "";
            for (auto x : authors)
            {
                if (x == ',')
                {
                    // cout << author << endl;
                    // if (mp.find(author)->second == 0)
                    if (mp[author] == 0)
                    {
                        // mp.insert({author, a_id});
                        mp[author] = a_id;
                        written_by << a_id << '#';
                        // if (paper_id != "")
                        // {
                        written_by << p_id;
                        // }
                        written_by << '#' << rank << "\n";
                        rank++;
                        a_id++;
                    }
                    author = "";
                }
                else
                {
                    author = author + x;
                }
            }
            // cout << author << endl;
            // mp.insert({author,a_id});
            // if (mp.find(author)->second == 0)
            if (mp[author] == 0)
            {
                // mp.insert({author, a_id});
                mp[author] = a_id;
                written_by << a_id << '#';
                // if (paper_id != "")
                // {
                written_by << p_id;
                // }
                written_by << '#' << rank << "\n";
                rank++;
                a_id++;
            }
        }

        p_row = '#' + title + '#' + abstract + '#';
        v_row = v_name + '#';
        // a_row = ;

        if (s == "\0")
        {
            p_id++;
            paper << stoi(paper_id);
            paper << p_row;
            paper << stoi(year) << "\n";

            venue << v_row;
            if (paper_id != "")
            {
                venue << stoi(paper_id);
            }
            venue << "\n";

            p_row = "";
            // paper_id = "";
            title = "";
            abstract = "";
            year = "";

            v_row = "";
            v_name = "";
        }
        i++;
    }

    for (auto itr = mp.begin(); itr != mp.end(); itr++)
    {

        author << itr->second << '#'; //<< itr->second << '\n';

        string name = "";
        for (auto x : itr->first)
        {
            if (x == ' ')
            {
                // cout << name << endl;
                author << name << '#';
                name = itr->first.substr(itr->first.find(x) + 1, itr->first.length() - itr->first.find(x) - 1);
                break;
            }
            else
            {
                name = name + x;
            }
        }
        // cout << w << endl;
        author << name << '\n';
    }
}