-- Quais categorias e produtos apresentam maior relevância?
SELECT
    product_id,
    MAX(category) AS category,
    MAX(rating_count) AS total_avaliacoes,
    ROUND(AVG(rating), 2) AS media_avaliacao
FROM amazon_products
GROUP BY product_id
ORDER BY total_avaliacoes DESC
LIMIT 10;