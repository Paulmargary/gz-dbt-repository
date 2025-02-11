WITH nanana AS (
  SELECT *

  from {{ ref("stg_raw__product")}}
  joi {{ ref("stg_raw__sales")}}
  USING (products_id)
)

SELECT 
products_id
,revenue
,quantity
,ROUND(revenue - (quantity*purchase_price),2) AS margin
,ROUND((purchase_price * quantity),2) AS purchase_cost
FROM nanana
