SELECT 
  a.date_date
  ,ROUND(SUM(a.orders_id),2) AS nb_transaction
  ,ROUND(SUM(a.revenue) ,2)AS revenue
  ,ROUND(SAFE_DIVIDE(SUM(a.revenue),2), COUNT(a.orders_id)) AS avg_basket
  ,ROUND(SUM(a.operational_margin),2) AS operational_margin
  ,ROUND(SUM(a.purchase_cost),2) AS total_pruchase_cost
  ,ROUND(SUM(a.shipping_fee),2) AS total_shipping_fee
  ,ROUND(SUM(a.logcost),2) AS total_logcoost
  ,ROUND(SUM(a.products_id*b.quantity),2) AS total_product_sold

FROM {{ ref("int_orders_operational")}} AS a
JOIN {{ ref("int_orders_margin")}} AS b
USING(orders_id)
