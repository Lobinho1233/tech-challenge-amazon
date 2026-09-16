--Existem produtos com boa avaliação, mas pouca visibilidade?

WITH tb_produtos AS (
SELECT product_id,
        AVG(rating) AS media_avaliacao,
        ROUND(AVG(rating_count), 2) AS media_engajamento
FROM amazon_products
GROUP BY product_id
)
SELECT *
FROM tb_produtos
WHERE media_engajamento < (SELECT AVG(media_engajamento) FROM tb_produtos)
AND media_avaliacao >= 4.5
ORDER BY media_engajamento DESC, media_avaliacao ASC