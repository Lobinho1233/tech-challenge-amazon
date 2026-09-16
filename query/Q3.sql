-- Existe relação entre descontos e avaliações?

WITH produtos AS (
    SELECT
        product_id,
        MAX(discount_percentage) AS desconto,
        AVG(rating) AS media_rating
    FROM amazon_products
    GROUP BY product_id
)
SELECT
    CASE
        WHEN desconto < 0.25 THEN 'Até 25%'
        WHEN desconto < 0.50 THEN '25% a 50%'
        WHEN desconto < 0.75 THEN '50% a 75%'
        ELSE 'Acima de 75%'
    END AS faixa_desconto,
    ROUND(AVG(media_rating), 2) AS media_avaliacao,
    COUNT(*) AS qtd_produtos
FROM produtos
GROUP BY faixa_desconto
ORDER BY faixa_desconto;
