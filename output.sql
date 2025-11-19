SELECT
    c.customer_id,
    c.name AS customer_name,
    c.email,
    p.product_id,
    p.name AS product_name,
    p.category,
    oi.quantity,
    p.price,
    oi.quantity * p.price AS line_total,
    o.order_id,
    o.order_date,
    o.total_amount AS order_total,
    pay.payment_method,
    pay.payment_status
FROM orders AS o
JOIN customers AS c
    ON o.customer_id = c.customer_id
JOIN order_items AS oi
    ON o.order_id = oi.order_id
JOIN products AS p
    ON oi.product_id = p.product_id
JOIN payments AS pay
    ON o.order_id = pay.order_id;
