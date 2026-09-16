-- Quais categorias e produtos apresentam maior relevância?


SELECT product_id,
        MAX(category) AS categoria,
        MAX(product_name) AS product_name,
        AVG(rating_count) AS media_engajamento,
        ROUND(AVG(rating), 2) AS media_avaliacao,
        ROUND(AVG(actual_price), 2) AS preco
FROM amazon_products
GROUP BY product_id
ORDER BY media_engajamento DESC
LIMIT 10