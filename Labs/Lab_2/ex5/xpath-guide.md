XPath Guide
===========

`ex5/queries.txt` lists XPath and XQuery expressions that run against `dvd.xml`. XPath navigates and filters XML nodes, while XQuery adds iteration and return clauses for richer output.

Core XPath/XQuery concepts
--------------------------

Node selection  
```xpath
/dvds/dvd
```
Alternative:

```xpath
doc("dvd.xml")//dvd
```
The first expression selects every `<dvd>` child of the `<dvds>` root, while the second loads the file explicitly and finds `<dvd>` nodes anywhere within it.

Predicates and filters  
```xpath
/dvds/dvd[director='Cameron']
```
Alternative:

```xpath
/dvds/dvd[director = 'Cameron' and price < 20]
```
Predicates inside `[...]` let you narrow the node set; you can chain multiple conditions when needed.

Aggregation  
```xpath
count(/dvds/dvd[director='Cameron'])
```
Alternative:

```xpath
sum(/dvds/dvd[director='Cameron']/price)
```
`count()` returns the number of nodes, while `sum()` lets you total numeric child values.

XQuery iteration  
```xquery
for $dvd in /dvds/dvd
order by xs:decimal($dvd/price)
return $dvd/title
```
Alternative:

```xquery
for $dvd in /dvds/dvd
where $dvd/genre = 'Action'
return concat($dvd/title, ' (', $dvd/year, ')')
```
XQuery adds `for`, `order by`, and `return` so you can sort and format the extracted nodes.

Query explanations
------------------

1.1 Titles of all DVDs sorted by Price
---------------------------------------

This is an XQuery expression. `for $dvd in /dvds/dvd` loops over each `<dvd>` element. `order by xs:decimal($dvd/price)` sorts them numerically by price, and `return $dvd/title` emits the `<title>` node for every DVD in sorted order.

1.2 DVDs directed by Cameron
----------------------------

This XPath expression `/dvds/dvd[director='Cameron']` selects `<dvd>` nodes whose `<director>` child equals the literal string `Cameron`. The result set includes the entire `<dvd>` element, so you can inspect title and year.

1.3 Number of DVDs directed by Cameron
--------------------------------------

`count(/dvds/dvd[director='Cameron'])` returns the number of `<dvd>` nodes whose `<director>` is `Cameron`. `count(...)` is an XPath function that returns the size of a node set as an integer.

1.4 Number of DVDs directed by each author
------------------------------------------

This XQuery expression uses `distinct-values(/dvds/dvd/director)` to iterate over each unique director name, then counts how many `<dvd>` entries match that name with `count(/dvds/dvd[director=$name])`. The `concat(...)` call formats each line as `Name: Count`.
