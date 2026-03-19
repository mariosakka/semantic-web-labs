CVS DTD Guide
=============

This note explains how `cvs.dtd` defines the résumé collection in `Lab_1/cvs.xml`. It highlights the root, the element and attribute declarations, and the ways you could model similar structures differently.

Core DTD concepts
-----------------

Root declaration  
```xml
<!DOCTYPE cvs SYSTEM "./cvs.dtd">
```
Alternative: declare a public identifier (`PUBLIC "...ID..."`) if the DTD is shared across multiple repositories instead of referencing it by relative path.

Element definition  
```xml
<!ELEMENT candidate (name, currentJobTitle, experiences, educationEntries, skills)>
```
Alternative: make some sections optional with `?` (e.g., `educationEntries?`) when candidates may not always include them.

Parsed character data  
```xml
<!ELEMENT company (#PCDATA)>
```
`#PCDATA` means the element only contains text.  
Alternative: wrap text inside another element (e.g., `<companyName>`) and declare it with its own `<!ELEMENT ... (#PCDATA)>` if you need to add attributes or metadata later.

Cardinality  
```xml
<!ELEMENT skills (skill+)>
```
`+` specifies “one or more” occurrences.  
Alternative: use `*` for zero-or-more when a section may be empty (e.g., `skills*`), or `?` for optional singletons.

Attributes  
```xml
<!ATTLIST experience id CDATA #REQUIRED>
```
Attributes attach scalar data (`id`) to the `<experience>` element without adding child markup.  
Alternative: move the identifier into a child element (`<id>`) when you want it to be part of the XPath hierarchy or to carry richer structure.

Schema walkthrough
------------------

1. `cvs` root  
```xml
<!ELEMENT cvs (candidate+)>
```
`<cvs>` wraps one or more `<candidate>` records. The validator uses this declaration as its starting point because the instance file’s `<!DOCTYPE cvs SYSTEM "./cvs.dtd">` points at the DTD that defines it.

2. `candidate` record  
```xml
<!ELEMENT candidate (name, currentJobTitle, experiences, educationEntries, skills)>
```
Each candidate must supply a name, a current job title, an `<experiences>` list, `<educationEntries>`, and `<skills>`. Those child elements are defined individually below so the structure stays explicit.

3. Experiences section  
```xml
<!ELEMENT experiences (experience+)>
<!ELEMENT experience (jobTitle, company, period, location, description)>
<!ATTLIST experience id CDATA #REQUIRED>
```
Every `<experience>` must include a job title, employer, period, location, and description, and it must carry a unique `id` attribute. The instance file already uses `id="exp1"`, `id="exp2"`, etc., for distinguishing entries.

4. Period range  
```xml
<!ELEMENT period (start, end)>
<!ELEMENT start (#PCDATA)>
<!ELEMENT end (#PCDATA)>
```
`<period>` bundles the start and end dates. Each date is text-only (`#PCDATA`) so you keep the lexical value simple enough for sorting or formatting later.

5. Education entries  
```xml
<!ELEMENT educationEntries (education+)>
<!ELEMENT education (title, school, location, period)>
<!ATTLIST education id CDATA #REQUIRED>
```
Similar to experiences, education blocks include a `title`, `school`, `location`, and `period`, and each has a required `id` attribute for referencing the item in tooling or transforms.

6. Skills list  
```xml
<!ELEMENT skills (skill+)>
<!ELEMENT skill (#PCDATA)>
```
`<skills>` stores repeated `<skill>` elements, each carrying a single skill name as text. The DTD ensures at least one `<skill>` appears per candidate by using `+`.

Summary
-------

The DTD enforces a consistent, hierarchical résumé structure: candidates collect experiences, education, and skills in fixed order, every experience/education item has an `id`, and leaf nodes contain text via `#PCDATA`. The core concepts (elements, cardinality symbols, character data, and attribute lists) all appear early in the file so the validator can map them back to the annotated XML instances.
