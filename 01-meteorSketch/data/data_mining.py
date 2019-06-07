# importing pandas dataframing 
import pandas as pd 

# parse gross data of csv on a specific columns
meteorList = pd.read_csv("gross_data.csv", usecols = ['name','recclass','mass','fall','year','reclat','reclong'])

# Sort Meteor List with Mass
meteorList.sort_values(by='mass', ascending=False, inplace=True)

# printing first 10 rows 
print(meteorList[:20])