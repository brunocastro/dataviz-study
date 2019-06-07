# importing pandas dataframing 
import pandas as pd 
import datetime

# parse gross data of csv on a specific columns
meteorList = pd.read_csv("gross_data.csv", usecols = ['name','recclass','mass','fall','year','reclat','reclong'])

# Sort Meteor List with Mass
meteorList.sort_values(by='mass', ascending=False, inplace=True)

# for row in meteorList:
#     memory = row['year'].strftime("%m/%y")
#     print(memory)

# printing first 10 rows 
print(meteorList[:10]['mass'])