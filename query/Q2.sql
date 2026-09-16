-- Quais produtos possuem maior engajamento dos consumidores?

-- Existem 22 produtos com mais de uma linha.
--WITH tb_products AS (
--SELECT product_id,
--        COUNT(*) AS qtde
--FROM amazon_products
--GROUP BY product_id
--)
--SELECT *
--FROM tb_products
--WHERE qtde > 1

-- Já que pode conter mais de uma 
--linha referente a um produto
-- Com isso, pego a média agrupado por linhas
SELECT product_id AS id_produto,
        AVG(rating_count) AS media_avaliacao
FROM amazon_products
GROUP BY product_id
ORDER BY media_avaliacao DESC
LIMIT 10



