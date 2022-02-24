import hashlib
papercsv = open('paper.csv', 'w')
venuecsv = open('venue.csv', 'w')
citationscsv = open('citation.csv', 'w')
authorcsv = open('author.csv', 'w')
writtenbycsv = open('writtenby.csv', 'w')

papercsv.write("paper_id|||title|||abstract|||year\n")
venuecsv.write("v_name|||paper_id\n")
citationscsv.write("paper_id_1|||citationspaper_id_2\n")
authorcsv.write("auth_id|||first|||last\n")
writtenbycsv.write("auth_id|||paper_id|||rank\n")

# mandatory
# title, author, year, paperId
# optional
# abstract, citations, venue

with open('source.txt') as f:
    title, author, paperId, year = "", "", "", ""
    abstract, venue, citations = "" , "", ""

    
    for line in f:
        if line[:2] == '#*':
            title = line[2:].rstrip()
        elif line[:2] == '#t':
            year = line[2:].rstrip()
        elif line[:6] == '#index':
            paperId = line[6:].rstrip()
        elif line[:2] == '#!':
            abstract = line[2:].rstrip()
        
        elif line[:2] == '#c':
            venue = line[2:].rstrip()
        elif line[:2] == '#@':
            author = line[2:].rstrip()
            names = author.split(',')
            auth_ids = tuple( hashlib.sha512(name.encode()) for name in names)
            first = ()

        elif line[:2] == '#%':
            if citations:
                citations += ',{}'.format(line[2:].rstrip())
            else:
                citations = line[2:].rstrip()
        if line == '\n':
            paper = paperId+'|||'+title+'|||'+abstract+'|||'+year
            papercsv.write(paper+'\n')
            
            # if venue if not null
            if venue:
                venuecsv.write(venue+'|||'+paperId+'\n')
            if citations:
                citationscsv.write(paperId+'|||'+citations+'\n')
            
            # reseting optional fields or the ones with multiple values
            abstract, venue, citations = "", "", ""

papercsv.close()
venuecsv.close()
citationscsv.close()
authorcsv.close()
writtenbycsv.close()