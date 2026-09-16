
-- Quais categorias apresentam maior ou menor satisfação?
SELECT 
        category,
        ROUND(AVG(rating), 2) AS media_avaliacao,
        rating_count
FROM amazon_products
GROUP BY category
ORDER BY media_avaliacao DESC
LIMIT 10