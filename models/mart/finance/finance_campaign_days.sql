WITH nanana AS(
  SELECT *
  FROM {{ ref("int_campaigns_day")}}
  JOIN {{ ref("finance_days")}}
  USING (date_date)
)

SELECT
date_date
,ROUND((operational_margin - ads_cost),1) AS ads_margin
,avg_basket
,operational_margin
,ads_cost
,ads_impression
,ads_clicks
,total_product_sold AS quantity
,revenue
,total_purchase_cost AS purchase_cost
,margin
,total_shipping_fee AS shipping_fee
,total_logcost AS logcost
,ship_cost
FROM nanana
ORDER BY date_date DESC