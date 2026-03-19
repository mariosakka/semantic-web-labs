Movie Schema Explained
======================

This note walks through `ex1.xsd` in the order it is written. Each snippet shows the tags, types, and attributes the schema defines and explains what they constrain.

Core XSD concepts
-----------------

Before diving into the specific elements, here is what the most-used tags do along with a quick example and an alternate code view:

* `<xs:simpleType>` declares a reusable scalar and constrains it:

```xml
<xs:simpleType name="rating">
  <xs:restriction base="xs:integer">
    <xs:enumeration value="1"/>
    <xs:enumeration value="5"/>
  </xs:restriction>
</xs:simpleType>
```

  Alternate representation:

  ```xml
  <xs:element name="rating">
    <xs:simpleType>
      <xs:restriction base="xs:integer">
        <xs:enumeration value="1"/>
        <xs:enumeration value="5"/>
      </xs:restriction>
    </xs:simpleType>
  </xs:element>
  ```

* `<xs:restriction base="...">` narrows primitives like `xs:string` or `xs:integer`:

```xml
<xs:restriction base="xs:decimal">
  <xs:minInclusive value="0"/>
</xs:restriction>
```

  Alternate representation:

  ```xml
  <xs:simpleType>
    <xs:list itemType="xs:string"/>
  </xs:simpleType>
  ```

* `<xs:enumeration value="..."/>` inside a restriction defines literal choices:

```xml
<xs:restriction base="xs:string">
  <xs:enumeration value="ACTION"/>
  <xs:enumeration value="DRAMA"/>
</xs:restriction>
```

  Alternate representation:

  ```xml
  <xs:restriction base="xs:string">
    <xs:whiteSpace value="collapse"/>
    <xs:length value="5"/>
    <xs:enumeration value="ACTION"/>
  </xs:restriction>
  ```

* `<xs:complexType>` wraps nested child elements:

```xml
<xs:complexType name="person">
  <xs:sequence>
    <xs:element name="firstName" type="xs:string"/>
    <xs:element name="lastName" type="xs:string"/>
  </xs:sequence>
</xs:complexType>
```

  Alternate representation:

  ```xml
  <xs:complexType name="person">
    <xs:all>
      <xs:element name="firstName" type="xs:string"/>
      <xs:element name="lastName" type="xs:string"/>
    </xs:all>
  </xs:complexType>
  ```

* `<xs:sequence>` enforces element order:

```xml
<xs:sequence>
  <xs:element name="firstName" type="xs:string"/>
  <xs:element name="lastName" type="xs:string"/>
</xs:sequence>
```

  Alternate representation:

  ```xml
  <xs:choice>
    <xs:element name="email" type="xs:string"/>
    <xs:element name="phone" type="xs:string"/>
  </xs:choice>
  ```

* `<xs:element>` declares an XML element and can reference a named complex type:

```xml
<xs:element name="director" type="person"/>
```

  Alternate representation:

  ```xml
  <xs:element ref="person"/>
  ```

* `<xs:attribute>` defines scalar metadata attached to an element:

```xml
<xs:attribute name="id" type="xs:integer" use="required"/>
```

  Alternate representation:

  ```xml
  <xs:element name="hall">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="id" type="xs:integer"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  ```

The rest of this file references those tags in context so you can see how the concepts are applied.

Schema walkthrough
------------------
1. `chairTypeEnum` simple type
------------------------------

```xml
<xs:simpleType name="chairTypeEnum">
  <xs:restriction base="xs:string">
    <xs:enumeration value="mesh fabric"/>
    <xs:enumeration value="leather arm chair"/>
  </xs:restriction>
</xs:simpleType>
```

This defines a string-based type that accepts only the two listed chair descriptions. Any element using `chairTypeEnum` must match one of those exact values.

2. `genreEnum` simple type
--------------------------

```xml
<xs:simpleType name="genreEnum">
  <xs:restriction base="xs:string">
    <xs:enumeration value="action"/>
    <xs:enumeration value="romance"/>
    <xs:enumeration value="drama"/>
  </xs:restriction>
</xs:simpleType>
```

Similarly, this restricts genre values to the three listed strings. Tagged elements cannot use other genre names.

3. `movies` root element
------------------------

```xml
<xs:element name="movies">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="movie" minOccurs="1" maxOccurs="unbounded">
        ...
      </xs:element>
    </xs:sequence>
  </xs:complexType>
</xs:element>
```

`movies` is the document root and wraps a sequence of `<movie>` entries. The sequence forces at least one `<movie>` (because `minOccurs="1"`) and allows any number afterward (`maxOccurs="unbounded"`).

4. `<movie>` definition
-----------------------

```xml
<xs:element name="movie">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="title" type="xs:string"/>
      <xs:element name="director" type="xs:string"/>
      <xs:element name="actors">...</xs:element>
      <xs:element name="year" type="xs:integer"/>
      <xs:element name="synopsis" type="xs:string" minOccurs="0"/>
      <xs:element name="halls">...</xs:element>
      <xs:element name="schedules">...</xs:element>
      <xs:element name="genre" type="genreType"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>
```

Each `<movie>` collects the specified children in that order. `title` and `director` are plain strings. `year` must be an integer. `synopsis` appears only if present (`minOccurs="0"`), while everything else is required. `genre` must match the earlier `genreType`.

5. `<actors>` block
--------------------

```xml
<xs:element name="actors">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="actor" minOccurs="1" maxOccurs="unbounded">
        <xs:complexType>
          <xs:sequence>
            <xs:element name="name" type="xs:string"/>
          </xs:sequence>
        </xs:complexType>
      </xs:element>
    </xs:sequence>
  </xs:complexType>
</xs:element>
```

`actors` holds one or more `<actor>` entries. Each `<actor>` requires a `<name>` string. The `minOccurs="1"` on `<actor>` enforces at least one cast member per movie.

6. `<halls>` block
------------------

```xml
<xs:element name="halls">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="hall" minOccurs="1" maxOccurs="3">
        <xs:complexType>
          <xs:sequence>
            <xs:element name="chairType" type="chairTypeType"/>
            <xs:element name="capacity" type="xs:positiveInteger"/>
          </xs:sequence>
          <xs:attribute name="id" type="xs:integer" use="required"/>
        </xs:complexType>
      </xs:element>
    </xs:sequence>
  </xs:complexType>
</xs:element>
```

`halls` must describe between one and three `<hall>` entries. Each hall includes a `chairType` chosen from the earlier `chairTypeType`, a numeric `capacity` greater than zero, and a required `id` attribute that uniquely identifies the hall within the movie.

7. `<schedules>` block
----------------------

```xml
<xs:element name="schedules">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="schedule" minOccurs="1" maxOccurs="unbounded">
        <xs:complexType>
          <xs:sequence>
            <xs:element name="date" type="xs:date"/>
            <xs:element name="hours" type="xs:string"/>
            <xs:element name="day" type="xs:string" minOccurs="0"/>
          </xs:sequence>
        </xs:complexType>
      </xs:element>
    </xs:sequence>
  </xs:complexType>
</xs:element>
```

Each `<schedule>` requires a `date` (ISO date), `hours` (free-form string), and optionally a `day` label. The `minOccurs="1"` ensures there is at least one schedule per movie, and `maxOccurs="unbounded"` allows as many showings as needed.

Summary
-------

Taken together, the schema locks the entire document structure: it controls the allowed element names, the number of actors/halls/schedules, the casting of simple types, and the presence of the `hall` id attribute. Following the order above keeps the XML predictable and valid.
