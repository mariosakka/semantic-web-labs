# Lab 2 — XML & Related Technologies

This directory collects all the deliverables for Laboratory 2. Each exercise lives in its own subfolder so you can run the recommended XSL/TXPath steps independently.

## Exercise layout
- `ex1/`: the movie dataset (`movies.xml`) plus schema (`ex1.xsd`). The schema enforces title/director/year/genre constraints, limits halls to 1‑3 entries, and now captures the weekday for every schedule, which makes it easier to build the tabular view later.
- `ex2-4/ex2.xsl`: the main stylesheet that transforms the movie list into a simple XHTML schedule.
- `ex2-4/ex3.xsl`: sorts the same dataset by title and renders only an unordered list of the movie titles.
- `ex2-4/ex4.xsl`: focuses on **Interstellar**, showing a timetable that maps each showtime to the day-of-week and the hall(s) playing that slot (no dates shown).
- `ex5/`: `README.md` and `queries.txt` explain the XPath and XQuery expressions you can run against `Lab_2/dvd.xml`, which is the source DVD catalogue provided by the lab instructions.

## Recommended commands
1. Run `xsltproc -o ex2-4/ex2/movies.html ex2-4/ex2.xsl ex1/movies.xml` to produce the main schedule page; open `ex2-4/ex2/movies.html` in a browser to verify the layout.
2. Run `xsltproc -o ex2-4/ex3/movies-sorted.html ex2-4/ex3.xsl ex1/movies.xml` to view the alphabetically sorted listing.
3. Run `xsltproc -o ex2-4/ex4/interstellar-schedule.html ex2-4/ex4.xsl ex1/movies.xml` to generate the Interstellar timetable.
4. Use `xidel -s dvd.xml --xquery <expression>` (see `ex5/queries.txt`) or the online evaluator at `https://videlibri.sourceforge.net/cgi-bin/xidelcgi` to run the XPath/XQuery tasks.

Installations: the instructions reference a browser plugin, but the same commands will work once `xsltproc` and `xidel` are available on your machine.
