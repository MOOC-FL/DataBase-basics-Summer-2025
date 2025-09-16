#### Seperate Result Lines
- Sometimes a scoreboard may have multiple identical rows. For example, this is the case in the following query:
```SQL
SELECT Price FROM Products;
```
- Since the price of two products is 4, the content of the two result rows is 4:
- However, if we only want different rows of results, we can add the word DISTINCT:
```SQL
SELECT DISTINCT price FROM Products;
```


