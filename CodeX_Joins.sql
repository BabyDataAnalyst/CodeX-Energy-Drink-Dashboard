CREATE SCHEMA codex_survey;
use codex_survey;
select * from dim_cities;
select * from dim_repondents limit 10;
select * from fact_survey_responses limit 10;

-- dim_respondents joins with fact_survey_responses ON dim_respondents.Respondent_ID = fact_survey_responses.Respondent_ID
-- dim_respondents joins with dim_cities ON dim_respondents.City_ID = dim_cities.City_ID

SELECT 
    r.Respondent_ID,
    r.Name,
    r.Age,
    r.Gender,
    c.City,
    c.Tier,
    f.Consume_frequency,
    f.Consume_time,
    f.Consume_reason,
    f.Heard_before,
    f.Brand_perception,
    f.General_perception,
    f.Tried_before,
    f.Taste_experience,
    f.Reasons_preventing_trying,
    f.Current_brands,
    f.Reasons_for_choosing_brands,
    f.Improvements_desired,
    f.Ingredients_expected,
    f.Health_concerns,
    f.Interest_in_natural_or_organic,
    f.Marketing_channels,
    f.Packaging_preference,
    f.Limited_edition_packaging,
    f.Price_range,
    f.Purchase_location,
    f.Typical_consumption_situations
FROM 
    dim_repondents r
JOIN 
    fact_survey_responses f ON r.Respondent_ID = f.Respondent_ID
JOIN 
    dim_cities c ON r.City_ID = c.City_ID
WHERE 
    NOT (f.Tried_before = 'Yes' AND f.Heard_before = 'No');
