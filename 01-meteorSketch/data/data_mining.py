# importing pandas dataframing 
import pandas as pd 

# parse gross data of csv on a specific columns
meteorList = pd.read_csv("gross_data.csv", usecols = ['name','mass','fall','year','reclat','reclong'])

# remove mass NaN
meteorList.dropna(subset=['mass','reclat','reclong'], inplace=True)

# Sort Meteor List with Mass
meteorList.sort_values(by='mass', ascending=False, inplace=True)

# Setup float format and revert Nunbers notation on mass
pd.options.display.float_format = '{:.4f}'.format
meteorList["mass"] = meteorList["mass"].astype(float)

clearData = meteorList.loc[(meteorList["fall"]=="Found")]

# #Savind the mining results
clearData.to_csv('MeteorStrikes.csv')

# #plot comand-line feed back
print ('All done! See the sample:')

# printing first 20 rows 
print (clearData[:20])
