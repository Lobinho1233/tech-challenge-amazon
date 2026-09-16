-- Existem produtos com alto engajamento, mas baixa avaliação?

SELECT product_id,
        AVG(rating) AS media_avaliacao,
        ROUND(AVG(rating_count), 2) AS media_qtde_avaliacoes
FROM amazon_products
GROUP BY product_id