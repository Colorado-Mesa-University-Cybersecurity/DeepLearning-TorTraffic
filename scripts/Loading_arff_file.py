# Importing Relevant Libraries
from scipy.io.arff import loadarff
import numpy as np
import pandas as pd
print('relevant libraries uploaded')

# Choose your own filepath for arff file
filepath = '../CICDataSet-TOR/CSV/Scenario-A/TimeBasedFeatures-15s-TOR-NonTOR.arff'
raw_data = loadarff(filepath)

# Converting arff file into pandas dataframe
df_data = pd.DataFrame(raw_data[0])

# Now, you can perform pandas methods if it is easy enough for you
print(df_data['class1'].value_counts())
column_name = list(df_data.columns)
print(column_name)
