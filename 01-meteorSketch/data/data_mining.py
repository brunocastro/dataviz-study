# importing csv module 
import csv 
  
# csv file name 
filename = "gross_data.csv"
  
# initializing the titles and rows list 
fields = [] 
rows = [] 
  
# reading csv file 
with open(filename, 'r') as csvfile:
    csvreader = csv.reader(csvfile) 
    fields = csvreader.next() 
    for row in csvreader: 
        rows.append(row) 
    # get total number of rows 
    print("Total no. of rows: %d"%(csvreader.line_num)) 
  
# printing the field names 
print('Field names are:' + ', '.join(field for field in fields)) 

for row in rows:
    float(row[4])

# Sort list by mass
def takeMass(elem):
    return elem[4]

rows.sort(key=takeMass, reverse=True)


#  printing first 5 rows 
print('\nFirst 5 rows are:\n') 
for row in rows[:10]: 
    # parsing each column of a row 
    for col in row: 
        print("%10s"%col), 
    print('\n') 