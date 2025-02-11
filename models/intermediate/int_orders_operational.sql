WITH nanana AS(
  SELECT *
  from {{ ref("stg_raw__ship")}}
  join {{ ref("int_sales_margin")}}
  USING (orders_id)
)


SELECT orders_id
    ,date_date
    ,ROUND(SUM(revenue))
    ,ROUND(SUM(margin),2) as margin
    ,ROUND(SUM(shipping_fee),2) as shipping_fee
    ,ROUND(SUM(logcost),2) as logcost
    ,ROUND(SUM(ship_cost),2) as ship_cost
    ,ROUND(SUM(margin) +SUM(shipping_fee) -SUM(logcost)- SUM(ship_cost),2) AS operational_margin
FROM nanana
GROUP BY orders_id, date_date
ORDER BY orders_id, date_date

