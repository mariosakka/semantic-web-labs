<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Titanic Schedule</title>
            </head>
            <body>
                <h1>Titanic Schedule</h1>

                <table border="1">
                    <tr>
                        <th> </th>
                        <th>Monday</th>
                        <th>Tuesday</th>
                        <th>Wednesday</th>
                        <th>Thursday</th>
                        <th>Friday</th>
                    </tr>

                    <tr>
                        <td>Hour / Hall</td>

                        <td>
                            <xsl:for-each select="dvds/dvd[title='Titanic']/schedule[day='Monday']">
                                <xsl:value-of select="hour"/>
                                <br/>
                                <xsl:value-of select="hall"/>
                            </xsl:for-each>
                        </td>

                        <td>
                            <xsl:for-each select="dvds/dvd[title='Titanic']/schedule[day='Tuesday']">
                                <xsl:value-of select="hour"/>
                                <br/>
                                <xsl:value-of select="hall"/>
                            </xsl:for-each>
                        </td>

                        <td>
                            <xsl:for-each select="dvds/dvd[title='Titanic']/schedule[day='Wednesday']">
                                <xsl:value-of select="hour"/>
                                <br/>
                                <xsl:value-of select="hall"/>
                            </xsl:for-each>
                        </td>

                        <td>
                            <xsl:for-each select="dvds/dvd[title='Titanic']/schedule[day='Thursday']">
                                <xsl:value-of select="hour"/>
                                <br/>
                                <xsl:value-of select="hall"/>
                            </xsl:for-each>
                        </td>

                        <td>
                            <xsl:for-each select="dvds/dvd[title='Titanic']/schedule[day='Friday']">
                                <xsl:value-of select="hour"/>
                                <br/>
                                <xsl:value-of select="hall"/>
                            </xsl:for-each>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>