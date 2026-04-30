<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <body>

                <!-- 1. Ordena els llibres per any de publicació -->
                <h2>Llibres ordenats per any de publicació</h2>
                <ul>
                    <xsl:for-each select="biblioteca/llibre">
                        <xsl:sort select="any" data-type="number" order="ascending"/>
                        <li>
                            <xsl:value-of select="any"/>
                            <xsl:text> - </xsl:text>
                            <xsl:value-of select="titol"/>
                        </li>
                    </xsl:for-each>
                </ul>

                <!-- 2. Ordena els llibres per títol alfabèticament -->
                <h2>Llibres ordenats per títol (A-Z)</h2>
                <ul>
                    <xsl:for-each select="biblioteca/llibre">
                        <xsl:sort select="titol" data-type="text" order="ascending"/>
                        <li>
                            <xsl:value-of select="titol"/>
                        </li>
                    </xsl:for-each>
                </ul>

                <!-- 3. Ordena els llibres per preu de més car a més barat -->
                <h2>Llibres ordenats per preu (de més car a més barat)</h2>
                <ul>
                    <xsl:for-each select="biblioteca/llibre">
                        <xsl:sort select="preu" data-type="number" order="descending"/>
                        <li>
                            <xsl:value-of select="titol"/>
                            <xsl:text> - </xsl:text>
                            <xsl:value-of select="preu"/>
                        </li>
                    </xsl:for-each>
                </ul>

                <!-- 4. Taula HTML amb els llibres ordenats per any -->
                <h2>Taula de llibres ordenats per any</h2>
                <table border="1">
                    <tr>
                        <th>Any</th>
                        <th>Títol</th>
                        <th>Autor</th>
                        <th>Preu</th>
                    </tr>
                    <xsl:for-each select="biblioteca/llibre">
                        <xsl:sort select="any" data-type="number" order="ascending"/>
                        <tr>
                            <td><xsl:value-of select="any"/></td>
                            <td><xsl:value-of select="titol"/></td>
                            <td><xsl:value-of select="autor"/></td>
                            <td><xsl:value-of select="preu"/></td>
                        </tr>
                    </xsl:for-each>
                </table>

                <!-- 5. Només llibres disponibles ordenats per títol -->
                <h2>Llibres disponibles ordenats per títol</h2>
                <ul>
                    <xsl:for-each select="biblioteca/llibre[@estat='disponible']">
                        <xsl:sort select="titol" data-type="text" order="ascending"/>
                        <li>
                            <xsl:value-of select="titol"/>
                            <xsl:text> - Disponible</xsl:text>
                        </li>
                    </xsl:for-each>
                </ul>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
