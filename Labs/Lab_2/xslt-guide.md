XSLT Guide
==========

Exercises `ex2`–`ex4` work by running XSLT stylesheets (`ex2.xsl`, `ex3.xsl`, `ex4.xsl`) against the movie data.

Core XSLT concepts
------------------

Stylesheet wrapper
```xml
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  ...
</xsl:stylesheet>
```
Alternative:

```xml
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  ...
</xsl:transform>
```

Output declaration
```xml
<xsl:output method="xml" indent="yes"
  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
```
Alternative:

```xml
<xsl:output method="html" indent="no"/>
```

Entry point
```xml
<xsl:template match="/">
  ...
</xsl:template>
```
Alternative:

```xml
<xsl:template name="main">
  ...
</xsl:template>
<xsl:call-template name="main"/>
```

Iteration and sorting
```xml
<xsl:for-each select="movies/movie">
  <xsl:sort select="title"/>
  ...
</xsl:for-each>
```
Alternative:

```xml
<xsl:apply-templates select="movies/movie">
  <xsl:sort select="title"/>
</xsl:apply-templates>
<xsl:template match="movie">...</xsl:template>
```

Conditionals
```xml
<xsl:if test="synopsis">
  ...
</xsl:if>
```
Alternative:

```xml
<xsl:choose>
  <xsl:when test="synopsis">...</xsl:when>
  <xsl:otherwise>...</xsl:otherwise>
</xsl:choose>
```

Variables
```xml
<xsl:variable name="titanic" select="movies/movie[title='Titanic']"/>
```
Alternative:

```xml
<xsl:param name="movieTitle" select="'Titanic'"/>
<xsl:variable name="movie" select="movies/movie[title=$movieTitle]"/>
```

Value injection
```xml
<xsl:value-of select="title"/>
```
Alternative:

```xml
<xsl:text>Title: </xsl:text>
<xsl:value-of select="title"/>
```

Transformation structure
------------------------

`<xsl:output>` tells the processor how to serialize the result. For all exercises it sets `method="xml"`, chooses this XHTML doctype, and enables `indent="yes"` so the file looks readable.

Templates
---------

Every file defines `<xsl:template match="/">` as the entry point. The slash means “start at the root of the input document” and build the XHTML tree from there:

```xml
<xsl:template match="/">
  <html xmlns="http://www.w3.org/1999/xhtml">...</html>
</xsl:template>
```

Iteration
---------

`<xsl:for-each select="movies/movie">` loops over each `<movie>` element. Inside the loop you can place any XHTML structure and call `<xsl:value-of select="title"/>` to inject data. `ex3.xsl` adds `<xsl:sort select="title"/>` inside the loop to reorder the movies alphabetically before rendering them.

Conditional logic
-----------------

`<xsl:if>` checks whether a node exists before emitting markup. For example, `ex2.xsl` only renders the synopsis block when `<synopsis>` is present:

```xml
<xsl:if test="synopsis">
  <div>...</div>
</xsl:if>
```

Variables and XPath
-------------------

`ex4.xsl` stores the Titanic node in a variable with `<xsl:variable name="titanic" select="movies/movie[title='Titanic']"/>` so it can reuse that subset twice (once for the column headers and once for the halls). XPath expressions inside `select` filters and navigates the XML tree.

Output values
-------------

`<xsl:value-of select="..."/>` extracts text content from the current node. It is used everywhere to read titles, years, directors, chair types, capacities, dates, hours, and genre from `movies.xml`.
