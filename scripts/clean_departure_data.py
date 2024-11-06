import pandas as pd
from pathlib import Path

# Define file paths for raw and cleaned directories
raw_data_folder = Path('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/raw')
cleaned_data_folder = Path('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned')

# List of file names to be processed
file_names = [
    'alaska_airlines_hnl_departures_data_202301_raw.csv',
    'alaska_airlines_hnl_departures_data_202302_raw.csv',
    'alaska_airlines_hnl_departures_data_202303_raw.csv',
    'alaska_airlines_hnl_departures_data_202304_raw.csv',
    'alaska_airlines_hnl_departures_data_202305_raw.csv',
    'alaska_airlines_hnl_departures_data_202306_raw.csv',
    'alaska_airlines_hnl_departures_data_202307_raw.csv',
    'alaska_airlines_hnl_departures_data_202308_raw.csv',
    'alaska_airlines_hnl_departures_data_202309_raw.csv',
    'alaska_airlines_hnl_departures_data_202310_raw.csv',
    'alaska_airlines_hnl_departures_data_202311_raw.csv',
    'alaska_airlines_hnl_departures_data_202312_raw.csv',
    'alaska_airlines_hnl_departures_data_202401_raw.csv',
    'alaska_airlines_hnl_departures_data_202402_raw.csv',
    'alaska_airlines_hnl_departures_data_202403_raw.csv',
    'alaska_airlines_hnl_departures_data_202404_raw.csv',
    'alaska_airlines_hnl_departures_data_202405_raw.csv',
    'alaska_airlines_hnl_departures_data_202406_raw.csv',
    'alaska_airlines_hnl_departures_data_202407_raw.csv',
    'alaska_airlines_hnl_departures_data_202408_raw.csv'
]

# Function to clean one of the files
def clean_data(file_path, output_path):

    # Load data and skip metadeta rows
    data = pd.read_csv(file_path, skiprows=7)
    # Remove metadata in last row
    data = data.iloc[:-1]


    # Standardize and reformat column names
    data.columns = [
        'carrier_code', 'date', 'flight_number', 'tail_number', 'destination_airport',
        'scheduled_departure_time', 'actual_departure_time', 'scheduled_elapsed_time',
        'actual_elapsed_time', 'departure_delay', 'wheels_off_time', 'taxi_out_time',
        'delay_carrier', 'delay_weather', 'delay_national_aviation_system',
        'delay_security', 'delay_late_aircraft_arrival'
    ]

    # Convert date column to datetime
    data['date'] = pd.to_datetime(data['date'], format='%m/%d/%Y')

    # Convert time columns and isolate time values
    time_columns = ['scheduled_departure_time', 'actual_departure_time', 'wheels_off_time']

    for col in time_columns: 
        # Replace 24:00 with 00:00
        data[col] = data[col].replace("24:00", "00:00")
        # Convert strings to time objects
        data[col] = pd.to_datetime(data[col], format='%H:%M').dt.time

    # Fill in missing values with 0 for numerical columns only and standardize data type
    numerical_columns = [
        'flight_number', 'scheduled_elapsed_time', 'actual_elapsed_time',
        'departure_delay', 'taxi_out_time', 'delay_carrier', 'delay_weather',
        'delay_national_aviation_system', 'delay_security', 'delay_late_aircraft_arrival'
    ]
    data[numerical_columns] = data[numerical_columns].fillna(0).astype(int)

    # Save cleaned data into new file
    data.to_csv(output_path, index=False)
    print(f"Saved cleaned data to {output_path}")

# Loop through each file and perform cleaning function
for file_name in file_names: 
    input_path = raw_data_folder/file_name
    output_path = cleaned_data_folder/file_name.replace('raw', 'cleaned')
    clean_data(input_path, output_path)

