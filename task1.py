import pandas as pd

try:
    data = pd.read_csv("data.csv")
    if len(data) == 0:
        print("There are no entries")
    else:
        print("Average age:", data['Age'].mean())
except:
    print("There is no file, nor 'Age' column does not exist or have the same datatype")
