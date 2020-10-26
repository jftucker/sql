INSERT INTO orders (customer_id, order_date, status)
VALUES (1, '2019-01-02', 1);

INSERT INTO order_items
VALUES
  (currval('orders_seq'), 1, 1, 2.95),
  (currval('orders_seq'), 2, 1, 2.95)