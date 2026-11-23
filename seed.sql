USE bookshop;

INSERT INTO authors (name, bio) VALUES
('刘慈欣', '科幻作家'), ('余华', '当代作家'),
('东野圭吾', '推理作家'), ('鲁迅', '文学家');

INSERT INTO books (title, author_id, price, stock, published_at) VALUES
('三体', (SELECT id FROM authors WHERE name='刘慈欣' LIMIT 1), 23.00, 12, '2008-01-01'),
('球状闪电', (SELECT id FROM authors WHERE name='刘慈欣' LIMIT 1), 32.00, 0, '2004-01-01'),
('活着', (SELECT id FROM authors WHERE name='余华' LIMIT 1), 20.00, 5, '1993-01-01'),
('许三观卖血记', (SELECT id FROM authors WHERE name='余华' LIMIT 1), 28.00, 8, '1995-01-01'),
('白夜行', (SELECT id FROM authors WHERE name='东野圭吾' LIMIT 1), 39.50, 0, '1999-08-01'),
('解忧杂货店', (SELECT id FROM authors WHERE name='东野圭吾' LIMIT 1), 35.00, 7, '2012-03-01'),
('呐喊', (SELECT id FROM authors WHERE name='鲁迅' LIMIT 1), 18.00, 10, '1923-08-01'),
('彷徨', (SELECT id FROM authors WHERE name='鲁迅' LIMIT 1), 22.00, 6, '1926-08-01');
