--	Write a query to get the sum of impressions by day.
SELECT SUM(impressions) AS "Total Impressions", date
FROM marketing_performance
GROUP BY date
ORDER BY date;


--	Write a query to get the top three revenue-generating states in order of best to worst. How much revenue did the third best state generate?
SELECT revenue, state
FROM website_revenue
ORDER BY state desc
LIMIT 3; 

--	Write a query that shows total cost, impressions, clicks, and revenue of each campaign. Make sure to include the campaign name in the output.
SELECT c.name, SUM(m.cost) AS "Total Cost",SUM(m.impressions) AS "Total Impressions",SUM(m.clicks) AS "Total Clicks"
FROM campaign c LEFT JOIN marketing_performance m ON c.id = m.campaign_id  
    LEFT JOIN website_revenue w ON m.campaign_id = w.campaign_id
GROUP BY c.name 

--	Write a query to get the number of conversions of Campaign5 by state. Which state generated the most conversions for this campaign?
SELECT COUNT(m.conversions) AS "Total Conversions",w.state
FROM campaign c LEFT JOIN marketing_performance m ON c.id = m.campaign_id
    LEFT JOIN website_revenue w ON m.campaign_id = w.campaign_id
WHERE c.name = "Campaign5"
GROUP BY w.state
ORDER BY COUNT(conversions) desc;


--	In your opinion, which campaign was the most efficient, and why?
