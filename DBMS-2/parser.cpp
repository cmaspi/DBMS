#include <iostream>
#include <fstream>
#include <string>
#include <string.h>
using namespace std;

int main()
{
    string s;
    ifstream Myfile("source.txt");
    ofstream papers;
    ofstream authors;
    papers.open("research_paper.csv");
    authors.open("authors.csv");
    papers << "paper_id#title#abstract#year\n";
    authors << "author_id#name";
    getline(Myfile,s);
    string row;
    string paper_id;
    string title;
    string abstract;
    string year;
    int i=0;
    while(getline(Myfile, s))
    {
        if(s.substr(0,2) == "#*")
            title = s.substr(2,s.length()-2);
        if(s.substr(0,2) == "#t")
            year = s.substr(2,s.length()-2);
        if(s.substr(0,6) == "#index")
            paper_id = s.substr(6,s.length()-6);
        if(s.substr(0,2) == "#!")
            abstract = s.substr(2,s.length()-2);
        row = paper_id+'#'+title+'#'+abstract+'#'+year;
        if(s=="\0")
        {
            papers << row << "\n";
            row="";
            title="";
            year="";
            abstract="";
            paper_id="";
        }
        i++;
    }


}