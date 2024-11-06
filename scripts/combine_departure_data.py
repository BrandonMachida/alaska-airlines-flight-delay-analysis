import pandas as pd

# Load each Alaska Airlines CSV file into separate DataFrames (2023)
alaska_january_2023_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202301_cleaned.csv')
alaska_february_2023_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202302_cleaned.csv')
alaska_march_2023_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202303_cleaned.csv')
alaska_april_2023_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202304_cleaned.csv')
alaska_may_2023_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202305_cleaned.csv')
alaska_june_2023_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202306_cleaned.csv')
alaska_july_2023_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202307_cleaned.csv')
alaska_august_2023_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202308_cleaned.csv')
alaska_september_2023_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202309_cleaned.csv')
alaska_october_2023_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202310_cleaned.csv')
alaska_november_2023_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202311_cleaned.csv')
alaska_december_2023_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202312_cleaned.csv')


# Load each Alaska Airlines CSV file into separate DataFrames (2024)
alaska_january_2024_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202401_cleaned.csv')
alaska_february_2024_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202402_cleaned.csv')
alaska_march_2024_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202403_cleaned.csv')
alaska_april_2024_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202404_cleaned.csv')
alaska_may_2024_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202405_cleaned.csv')
alaska_june_2024_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202406_cleaned.csv')
alaska_july_2024_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202407_cleaned.csv')
alaska_august_2024_data = pd.read_csv('/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/cleaned/alaska_airlines_hnl_departures_data_202408_cleaned.csv')

# Concatenate the DataFrames for each airline
alaska_combined_data = pd.concat([
    alaska_january_2023_data,
    alaska_february_2023_data,
    alaska_march_2023_data,
    alaska_april_2023_data,
    alaska_may_2023_data,
    alaska_june_2023_data,
    alaska_july_2023_data,
    alaska_august_2023_data,
    alaska_september_2023_data,
    alaska_october_2023_data,
    alaska_november_2023_data,
    alaska_december_2023_data,
    alaska_january_2024_data,
    alaska_february_2024_data,
    alaska_march_2024_data,
    alaska_april_2024_data,
    alaska_may_2024_data,
    alaska_june_2024_data,
    alaska_july_2024_data,
    alaska_august_2024_data
], ignore_index=True)

# Define output path
alaska_output_path = '/Users/brandon.machida/Desktop/Alaska-Airlines/alaska_airlines_flight_delay_analysis/data/processed/alaska_airlines_hnl_departures_processed.csv'


# Save combined file in output path
alaska_combined_data.to_csv(alaska_output_path, index=False)