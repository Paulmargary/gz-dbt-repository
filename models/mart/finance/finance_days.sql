
SELECT 
  date_date
  ,COUNT(orders_id) AS nb_transaction
  ,ROUND(SUM(revenue) ,2)AS revenue
  ,ROUND(SAFE_DIVIDE(SUM(revenue), COUNT(orders_id)),2) AS avg_basket
  ,ROUND(SUM(operational_margin),2) AS operational_margin
  ,ROUND(SUM(purchase_cost),2) AS total_purchase_cost
  ,ROUND(SUM(shipping_fee),2) AS total_shipping_fee
  ,ROUND(SUM(logcost),2) AS total_logcost
  ,ROUND(SUM(quantity),2) AS total_product_sold
  ,ROUND(SUM(margin)) AS margin
  ,ROUND(sum(ship_cost)) AS ship_cost

FROM {{ ref("int_orders_operational")}} 
GROUP BY date_date
ORDER BY date_date DESC