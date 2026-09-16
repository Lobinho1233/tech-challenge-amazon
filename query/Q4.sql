
-- Quais categorias apresentam maior ou menor satisfação?

--maior
SELECT 
        category,
        ROUND(AVG(rating), 2) AS media_avaliacao,
        rating_count
FROM amazon_products
GROUP BY category
ORDER BY media_avaliacao DESC
LIMIT 10;

--menor
SELECT 
        category,
        ROUND(AVG(rating), 2) AS media_avaliacao,
        rating_count
FROM amazon_products
GROUP BY category
ORDER BY media_avaliacao ASC
LIMIT 10;