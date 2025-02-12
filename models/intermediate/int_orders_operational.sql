WITH nanana AS(
  SELECT *
  from {{ ref("stg_raw__ship")}}
  join {{ ref("int_orders_margin")}}
  USING (orders_id)
)


SELECT orders_id
    ,date_date
    ,ROUND(SUM(margin),2) as margin
    ,ROUND(SUM(shipping_fee),2) as shipping_fee
    ,ROUND(SUM(logcost),2) as logcost
    ,ROUND(SUM(ship_cost),2) as ship_cost
    ,ROUND(SUM(margin) +SUM(shipping_fee) -SUM(logcost)- SUM(ship_cost),2) AS operational_margin
    ,ROUND(SUM(revenue),2) as revenue
    ,ROUND(SUM(quantity),2) as quantity
    ,ROUND(SUM(purchase_cost),2) as purchase_cost
FROM nanana
GROUP BY orders_id, date_date
ORDER BY orders_id, date_date

