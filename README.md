# IDS706_Week-6_Introduction_to_Databases
## Connect to database
I connected to the database using DBeaver

## Perform basic analysis
Determine the total number of rows in the dataset:
```sql
SELECT COUNT(*)
FROM university_rankings;
```
There are 2,200 rows.

Determine the date range of the data:
```sql
SELECT DISTINCT year
FROM university_rankings
ORDER BY year;
```
The data cover the years 2012-2015.

Calculate the maximum, minimum, and average of different columns:
```sql
SELECT 
	MAX(quality_of_education),
	MIN(quality_of_education),
	AVG(quality_of_education),
	MAX(alumni_employment),
	MIN(alumni_employment),
	AVG(alumni_employment),
	MAX(quality_of_faculty),
	MIN(quality_of_faculty),
	AVG(quality_of_faculty),
	MAX(influence),
	MIN(influence),
	AVG(influence),
    MAX(CASE WHEN year >= 2014 THEN broad_impact END),
    MIN(CASE WHEN year >= 2014 THEN broad_impact END),
    AVG(CASE WHEN year >= 2014 THEN broad_impact END),
    MAX(score),
	MIN(score),
	AVG(score)
FROM university_rankings
```
Here, I calculate the maximum, minimum, and average of all quantitative variables for which the units are somewhat arbitrary.

Calculate the maximum, minimum, average, and sum totals of different columns:
```sql
SELECT 
	MAX(publications),
	MIN(publications),
	AVG(publications),
  SUM(publications),
  MAX(citations),
	MIN(citations),
	AVG(citations),
  SUM(citations),
  MAX(patents),
	MIN(patents),
	AVG(patents),
  SUM(patents)
FROM university_rankings
```
Here, I calculate the maximum, minimum, average, and sum totals of all quantitative variables for which the units correspond to real works. 

Calculate the top 10 universities over the timespan of the data
```sql
SELECT institution, AVG(score) AS avg_score
FROM university_rankings
GROUP BY institution
ORDER BY avg_score DESC
LIMIT 10;
```

## CRUD operations
1. The ranking committee has decided to publish new results for a new university in 2014. Insert this university into the database.
Institution: Duke Tech
Country: USA
World Rank: 350
Score: 60.5
```sql
INSERT INTO university_rankings (institution, country, year, world_rank, score)
VALUES ('Duke Tech', 'USA', 2014, 350, 60.5);
```
This command inserts an entry into the university_rankings table, for which the specified information is set for the specified columns.

2. A policy consultant has reached out to you with the following question. How many universities from Japan show up in the global top 200 in 2013?
```sql
SELECT COUNT(*)
FROM university_rankings
WHERE country = 'Japan' AND year = 2013 AND world_rank <= 200;
```
There were 6 Japanese universities were in the global top 200 in 2013.

3. The score for University of Oxford in 2014 was miscalculated. Increase its score by +1.2 points. Update the row to reflect this update.
```sql
UPDATE university_rankings
SET score = score + 1.2
WHERE institution = 'University of Oxford' AND year = 2014;
```
This command increases the University of Oxford's 2014 score by 1.2 points.

4. After reviewing, the ranking committee decided that universities with a score below 45 in 2015 should not have been included in the published dataset. Clean up the records to reflect this.
```sql
DELETE FROM university_rankings
WHERE year = 2015 AND score < 45;
```
This command deletes any entries for which the year is 2015 and the score is less than 45 points.
