XHTML Guide
===========

This transformation emits a standards-compliant XHTML 1.0 Strict document. The `xsl:output` block in `ex2.xsl` sets the serialization method to `xml`, specifies the XHTML DOCTYPE, and enables indentation so the resulting file can be opened directly in any browser.

Core XHTML concepts
-------------------

Root declaration
```xml
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  ...
</html>
```
Alternative: declare `<!DOCTYPE html>` and rely on modern browsers for HTML5 parsing when strict serialization is not required.

Styling
```xml
<style type="text/css">
  body { font-family: "Trebuchet MS", Arial, sans-serif; background: #f4f5fb; }
</style>
```
Alternative: move the CSS into a linked file with `<link rel="stylesheet" href="schedule.css"/>` so the transformation focuses purely on markup.

Page layout
```xml
<body>
  <div class="page">...</div>
</body>
```
Alternative: wrap the content in semantic containers such as `<main>` or `<section class="page">...</section>` to emphasize meaning over classes.

Tables
```xml
<table>
  <tr><th>ID</th><th>Chair Type</th><th>Capacity</th></tr>
  <tr><td>1</td><td>mesh fabric</td><td>140</td></tr>
</table>
```
Alternative: if you have fewer columns, use a definition list (`<dl>`) to pair labels with values instead of repeating `<th>`/`<td>` rows.

Document walkthrough
-------------------

The root element is `<html>` in the XHTML namespace `http://www.w3.org/1999/xhtml`. The `<head>` section contains the `<title>` and an embedded `<style>` block that defines the color palette, typography, and the layout helpers such as `.page`, `.movie-card`, `.metadata`, and table styling.

Content layout
--------------

Within `<body>` the template renders a `<div class="page">` that centers the content and adds top padding. There is a heading and a metadata paragraph, then the template iterates over every `<movie>` entry using `xsl:for-each`. Each iteration outputs this card-like structure:

```xml
<div class="movie-card">
  <h2>Movie Title</h2>
  <p class="metadata">Director • Year • Genre</p>
  <div>
    <span class="section-title">Actors</span>
    <ul>...each actor as `<li>`...</ul>
  </div>
  ...optional synopsis block...
  ...two tables for halls and schedules...
</div>
```

Tables
------

Halls and schedules are rendered as XHTML tables because the report benefits from fixed columns. The halls table uses `<th>` cells for ID, chair type, and capacity, and a `<xsl:for-each>` loop produces one `<tr>` per hall. The schedule table likewise lists date and hour columns. Every table cell (`<td>`) is styled through the shared CSS so the output stays consistent with the rest of the page.

Conditional blocks
------------------

`xsl:if test="synopsis"` wraps the synopsis section so it only appears when the source XML provides that element. The rest of the XHTML structure remains the same regardless of whether optional data is present.
