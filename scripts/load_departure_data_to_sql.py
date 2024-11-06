import pandas as pd
import sqlite3

# Load the cleaned CSV data
alaska_combined_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/processed/alaska_airlines_hnl_departures_processed.csv')

# Connect to SQLite database (or create it if it doesn’t exist)
conn = sqlite3.connect('departure_data_hnl.db')

# Load the DataFrame into a SQL table named 'flight departure data'
alaska_combined_data.to_sql('alaska_airlines_departure_data_hnl', conn, if_exists='replace', index=False)

print("Data loaded into SQL table 'alaska_airlines_departure_data_hnl' successfully.")