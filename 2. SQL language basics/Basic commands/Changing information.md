#### Changing information
- The command `UPDATE` changes the rows in the table that match the desired condition. For example, the following command changes the price of product 2 to 6:
```sql
UPDATE Products SET price = 6 WHERE id =2;
```
You can change multiple columns by combining changes with commas. For example, the following command changes the name of product 2 to pineapple and the price to 6:
```sql
UPDATE Products SET name = 'ananas',price = 6 WHERE id = 2;
```
If the command does not have a condition, the change affects all rows. For example, the following command changes the price of each product to 1:
```
UPDATE Products SET price = 1;
```

