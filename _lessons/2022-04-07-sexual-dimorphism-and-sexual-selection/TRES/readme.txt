This TRES_LP_NESTBOX_1977.2014readme.txt file was generated on 2021-03-03 by Jonathan Diamond


GENERAL INFORMATION

1. Title of Dataset: TRES_LP_NESTBOX_1977.2014

2. Author Information
	A. Principal Investigator Contact Information
		Name: Jonathan Diamond
		Institution: Department of Biology, McGill
		Address: 1205 Dr Penfield Ave, Montreal, Quebec H3A 1B1
		Email: Jonathan.diamond@mail.mcgill.ca

	B. Associate or Co-investigator Contact Information
		Name: David Bradley
		Institution: Birds Canada
		Address: P.O. Box 160, 115 Front Road, Port Rowan, ON, N0E 1M0
		Email: dbradley@birdscanada.org

	C. Associate or Co-investigator Contact Information
		Name: Joseph Burant
		Institution: CIEE, Living Data Project. Department of Biology, McGill
		Address: 1205 Dr Penfield Ave, Montreal, Quebec H3A 1B1
		Email: jburant@uoguelph.ca

3. Date of data collection (single date, range, approximate date): 1977 - 2014

4. Geographic location of data collection : Long Point Bird Observatory, Ontario, Canada. (42.582890, -80.398603)

5. Information about funding sources that supported the collection of the data: 
Birds Canada is the main funding source of the collection.

SHARING/ACCESS INFORMATION

1. Licenses/restrictions placed on the data: CC by 4.0

2. Links to publications that cite or use the data: None

3. Links to other publicly accessible locations of the data: None

4. Links/relationships to ancillary data sets: None

5. Was data derived from another source?  No


6. Recommended citation for this dataset: 
Diamond, Jonathan. Bradley, David. Burant, Joseph(2021): Tree Swallow Nest Box Productivity Dataset from Long-Point, Ontario, Canada (1977-2014).figshare. 10.6084/m9.figshare.14156801


DATA & FILE OVERVIEW

1. File List: 
Dataset: 
Tres.banding.csv - contains all the banding information collected at long point.
Tres.egg.csv - contains all the egg data, including weight, hatch date, etc..
Tres.nest.checks.csv - contains all observed data in the nests by field volunteers. Includes number of eggs per date, number of nestlings per date, and relevant comments. 
tres.nest.csv - contains information about the nests, such as first egg date, clutch sizes, etc.. 
Tres.nestlings.csv - contains all data on the actual nestlings at the various nest boxes. Includes information such as day 1 weights, day 1 primary length, day 12 weights, etc. 

Metadata: 
Tree Swallow Manual 2014.docx - volunteer manuals, with instructions and information on data collection and various important codes.
Tree Swallow Manual 2012.docx - volunteer manuals, with instructions and information on data collection and various important codes. This manual includes certain codes that have changed since and are important for some of the older data. 
TRES codes.csv - includes a table of all codes used for nest checks and observations by volunteers. Each code is associated to the year in which they were used. 
TRES egg codes.docx - includes important codes used through various years that are related to different measures, indices, and studies. 

Templates:
Each category has an empty .csv file to help encourage consistent data entry in the future.
templates_readme.txt - contains the instructions and informations helpful for using the templates provided.
TRES_pivot_long_nestcheck_V1.R - an R script used to guide the pivoting process of the nest check data at the end of the field season. 


2. Relationship between files, if important: 
All data is related to the TRES nest box productivity project. 
All data files in dataset are connected via primary keys "nest_box"

3. Additional related data collected that was not included in the current data package: 

4. Are there multiple versions of the dataset? No
	A. If yes, name of file(s) that was updated: 
		i. Why was the file updated? 
		ii. When was the file updated? 


METHODOLOGICAL INFORMATION

1. Description of methods used for collection/generation of data: 
The protocol for data collection is detailed in the metadata folder in this database, under the "Tree Swallow Manual 2014" and "Tree Swallow Manual 2012"  files. 

2. Methods for processing the data: 
Raw data was collected and compiled into FileMaker Pro and Excel files for many years. Most recently, the field manager and research assistants marked down field observations and recordings into excel. 

3. Instrument- or software-specific information needed to interpret the data: 
All data files are .csv, and can be read into R (version R 4.0.3) directly. Useful R packages for the associated r scripts and reading these files are: Tidyverse(version 1.3.0), Janitor(version 2.1.0), Lubridate(version 1.7.9.2). 


5. Environmental/experimental conditions: None

6. Describe any quality-assurance procedures performed on the data: Each field season the data is verified and checked over by the manager/research assistant in charge. This is done before adding it to the database. 


DATA-SPECIFIC INFORMATION FOR: Tres.banding.csv

1. Number of variables: 24 

2. Number of cases/rows: 1857

3. Variable List: 
band_or_recapture: b = band, r = recapture
band_number: band number, separated with a "." after the first 4 digits.
age:  1 = hatch year, 5= after hatch year, 6 = after second year
age_code: HY= hatch year, AHY= after hatch year, ASY =  after second year
sex: M= male , F= female
how: CP= cloacal protuberance , BP= brood patch 
colour: BLU = blue, BRN = brown, INT = intermediate 
wing_chord: measured in mm
wing_flat:measured in mm
tail:measured in mm
p_9: length of 9th primary - measured in mm  
weight: measured in grams (g)
date: recorded as yyyy-mm-dd
time_capture: 24 hour clock; hh:mm
time_release: 24 hour clock; hh:mm
nest_box: nest box labeled by site and box number with no spaces
bander: 3 letter initials of the bander
comments: 
logger: logger id
date_20: recorded as yyyy-mm-dd
weight_after_logger: measured in grams (g)
year: 
site: refer to manual for site codes
bp: brood path; Y= yes, N= no 


4. Missing data codes: 
Codes are found in the file titled TRES_codes


DATA-SPECIFIC INFORMATION FOR: Tres.egg.csv

1. Number of variables: 23 

2. Number of cases/rows: 79757

3. Variable List: 
year: 
nest_box: nest box labeled by site and box number with no spaces
clutch_number: 
band_number: band number, separated with a "." after the first 4 digits.
egg_number:
egg_weight: measured in grams (g)
egg_weight_day: recorded as yyyy-mm-dd
day_1_weight:   measured in grams (g)    
day_12_weight:  measured in grams (g)
day_12_primary: measured in mm  
day_16_primary: measured in mm  
comments:        
egg_length: measured in mm      
egg_width: measured in mm
site: refer to manual for site codes
unique_id: site, year, box number (some were left in the old box number formats; where S = SL, P=PT, M=MC) with no spaces. Equivalent to nest_code in other files.           
age:  1 = hatch year, 5= after hatch year, 6 = after second year
age_code: HY= hatch year, AHY= after hatch year, ASY =  after second year      
sex: 4 = male, 5= female        
clutch_size:     
nb_sequence: label missing or unknown - refer to manuals. 
code: reference metadata file "TRES_egg_codes" for code meanings      
no_of_new_eggs:     


DATA-SPECIFIC INFORMATION FOR: Tres.nest.csv

1. Number of variables: 25 

2. Number of cases/rows: 16970

3. Variable List: 
site:refer to manual for site codes                
year:      
site_section:refer to manual for site section codes          
female: band number, separated with a "." after the first 4 digits.
male: band number, separated with a "." after the first 4 digits.
nest_box:nest box labeled by site and box number with no spaces        
first_egg_date:  recorded as yyyy-mm-dd    
clutch_size:
number_fledged:      
nest_code:site, year, box number (some were left in the old box number formats; where S = SL, P=PT, M=MC) with no spaces. Equivalent to unique_id in other files.         
hatch_date: exclusive to 2011 data. Collected as the day number(dd) +12 + clutch size.    
2011-01-01: calculated as "first_egg_date" - "2011-01-01" + "hatch_date". (Previous header was 40544)
comments:          
brood_size:    
proportion_fledge: number_fledged/clutch_size           
geolocator_band_number: band number, separated with a "." after the first 4 digits.
tagged: 1= yes tagged with a geolocator    
clutch_number:       
age:  1 = hatch year, 5= after hatch year, 6 = after second year
age_code: HY= hatch year, AHY= after hatch year, ASY =  after second year      
band_number: band number, separated with a "." after the first 4 digits.
no_of_young_fledged:  
number_hatch:         
sex:  4 = male, 5= female             
code: reference "TRES_egg_codes" - for years 1977-2012 codes may be inconsistent or unknown          
    
DATA-SPECIFIC INFORMATION FOR: Tres.nest.check.csv

1. Number of variables: 5 

2. Number of cases/rows: 111108

3. Variable List: 
date: date of box check, recorded as yyyy-mm-dd         
nest_box: nest box labeled by site and box number with no spaces   
count: observation noted by field volunteer - codes referenced from TRES_codes file     
comments: 
band_number: band number, separated with a "." after the first 4 digits.

4. Missing data codes: 
Codes are found in the file titled TRES_codes


DATA-SPECIFIC INFORMATION FOR: Tres.nestling.csv

1. Number of variables: 25 

2. Number of cases/rows: 32536

3. Variable List:
 
nest_box: nest box labeled by site and box number with no spaces     
band_number:  band number, separated with a "." after the first 4 digits       
day_1_date: recorded as yyyy-mm-dd          
age:  1 = hatch year, 5= after hatch year, 6 = after second year
age_code: HY= hatch year, AHY= after hatch year, ASY =  after second year   
time_nestling_found    
bander:  3 letter initials of the bander          
comments:              
year:   
clutch_number:   
day_1_weight: measured in grams (g)  
day_12_weight: measured in grams (g) 
day_12_primary: measured in mm  
day_16_primary: measured in mm    
marking: See "Tres codes" - tells you which hatchling it is.          
condition:   
mean_hatch_date: (see manual 2012) recorded as yyyy-mm-dd     
day_15_primary: measured in mm            
site: refer to manuals for site codes             
clutch_no:     
original_egg_number: refer to manual
hours_since_hatch:
est_hatch_date:
nest_code: site, year, box number (some were left in the old box number formats; where S = SL, P=PT, M=MC) with no spaces. Equivalent to unique_id in other files.   
mark: same as marking column - depended on the year. Only use marking column moving forward. 
dp: unknown label 

















