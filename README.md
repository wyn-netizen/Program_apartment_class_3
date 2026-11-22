# Program_apartment_class_3
## 环境
- MySQL版本:`8.4.13`
- 连接方式:主机 `127.0.0.1`，端口 `3306`，用户名 `root`
- 运行顺序:
1. `sql/schema.sql` —— 建库 `bookshop`，建 `authors`、`books` 两张表
2. `sql/seed.sql` —— 插入 4 位作者、8 本书
3. `sql/queries.sql` —— 依次执行 Q1–Q6
## 对主键和外键的理解
- 主键:authors 和 books 两张表都用 id 当主键。我的理解是，主键相当于每行的身份证，它不能重复也不能空，所以任何一行都能被唯一找到（唯一找到是什么鬼算了懂我意思就行）。我让它 AUTO_INCREMENT，是因为插入时不用手动编号，也就不会出现编号重复的情况。如果不设主键，两本书都叫《呐喊》时就无法区分，UPDATE 或 DELETE 可能改错行。
- 外键:books.author_id 是外键，它存的值必须是 authors.id 里已经存在的一个。它保证两件事：一是不能插入一个不存在的作者,二是不能删掉还有书的作者。这也是建表必须先建 authors 再建 books 的原因，即先父后子。
