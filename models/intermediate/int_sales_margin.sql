WITH nanana AS (
  SELECT *

  from {{ ref("stg_raw__product")}}
  join {{ ref("stg_raw__sales")}}
  USING (products_id)
)
, nenene AS (
  SELECT orders_id
    ,date_date
    ,revenue
    ,quantity
    ,ROUND(revenue - (quantity*purchase_price),2) AS margin
    ,ROUND((purchase_price * quantity),2) AS purchase_cost
  FROM nanana
  ORDER BY orders_id DESC

)

SELECT *
 ,{{ margin_percent( "revenue" , "purchase_cost" ) }} AS margin_percent
FROM nenene
ORDER BY orders_id DESC 