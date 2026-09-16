-- Quais categorias e produtos apresentam maior relevância?


WITH tb_category AS (
SELECT
    category,
    MAX(rating_count) AS total_avaliacoes,
    ROUND(AVG(rating), 2) AS media_avaliacao
FROM amazon_products
GROUP BY category
ORDER BY total_avaliacoes DESC
LIMIT 10
)
SELECT *
FROM tb_category
WHERE media_avaliacao > 4