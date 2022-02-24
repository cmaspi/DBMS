import hashlib
papercsv = open('paper.csv', 'w')
venuecsv = open('venue.csv', 'w')
citationscsv = open('citations.csv', 'w')
authorcsv = open('author.csv', 'w')
writtenbycsv = open('written_by.csv', 'w')

papercsv.write("paper_id#title#abstract#year\n")
venuecsv.write("v_name#paper_id\n")
citationscsv.write("paper_id_1#citationspaper_id_2\n")
authorcsv.write("auth_id#first#last\n")
writtenbycsv.write("auth_id#paper_id#rank\n")

# mandatory
# title, author, year, paperId
# optional
# abstract, citations, venue

with open('source.txt') as f:
    title, author, paperId, year = "", "", "", ""
    abstract, venue, citations = "" , "", ""
    names , auth_ids , first , last = "", "" , "" , ""
    
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
            names = [name.strip() for name in names]
            auth_ids = tuple( hashlib.sha256(name.encode()).hexdigest()[:30] for name in names)
            first = tuple( name.split(' ')[0] for name in names)
            last = tuple( " ".join(name.split(' ')[1:]) for name in names)

        elif line[:2] == '#%':
            citationscsv.write(paperId+'#'+line[2:].rstrip()+'\n')
        if line == '\n':
            paper = paperId+'#'+title+'#'+abstract+'#'+year
            papercsv.write(paper+'\n')
            
            # if venue if not null
            if venue:
                venuecsv.write(venue+'#'+paperId+'\n')
            
            for i in range(names.__len__()):
                authorcsv.write(auth_ids[i]+'#'+first[i]+'#'+last[i]+'\n')
                writtenbycsv.write(auth_ids[i]+'#'+paperId+'#'+str(i+1)+'\n')
            # reseting optional fields or the ones with multiple values
            abstract, venue, citations = "", "", ""

papercsv.close()
venuecsv.close()
citationscsv.close()
authorcsv.close()
writtenbycsv.close()