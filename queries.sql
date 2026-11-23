USE bookshop;

-- Q1：查询库存为 0 的书名和库存。
-- 预期结果：球状闪电、白夜行
SELECT title, stock
FROM books
WHERE stock = 0;

-- Q2：按价格降序取前三本，同价时按 id 升序。
-- 预期结果：白夜行、解忧杂货店、球状闪电
SELECT id, title, price
FROM books
ORDER BY price DESC, id ASC
LIMIT 3;

-- Q3：查询价格在 20 到 40 之间的书（含边界）。
-- 预期结果：三体、球状闪电、活着、许三观卖血记、白夜行、解忧杂货店、彷徨
SELECT id, title, price
FROM books
WHERE price BETWEEN 20 AND 40
ORDER BY id;

-- Q4：JOIN 查每本书的书名、作者名和价格。
-- 预期结果：与 seed.sql 一致
SELECT b.title, a.name AS author, b.price
FROM books as b
JOIN authors AS a ON b.author_id = a.id
ORDER BY b.id;

-- Q5：先 SELECT 确认，再把《三体》库存减 1；不减成负数。
-- 预期结果：三体库存 12 -> 11
SELECT id, title, stock
FROM books
WHERE id = 1;

UPDATE books
SET stock = stock - 1
WHERE id = 1 AND stock > 0;

-- Q6：插入一条唯一标记的临时书，确认后按条件删除它，不删除其他书。
INSERT INTO books (title, author_id, price, stock)
SELECT '临时测试-20261122-2235', id, 1.00, 1
FROM authors
WHERE name = '刘慈欣';
SELECT id, title, author_id, price, stock
FROM books
WHERE title = '临时测试-20261122-2235';
DELETE FROM books
WHERE title = '临时测试-20261122-2235';

SELECT id, title FROM books
WHERE title = '临时测试-20261122-2235';