<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <body>

                <!-- 1. Llibres disponibles -->
                <h2>Llibres disponibles</h2>
                <ul>
                    <xsl:for-each select="biblioteca/llibre[@estat='disponible']">
                        <li>
                            <xsl:value-of select="titol"/>
                        </li>
                    </xsl:for-each>
                </ul>

                <!-- 2. Llibres amb preu > 12 -->
                <h2>Llibres amb preu superior a 12</h2>
                <ul>
                    <xsl:for-each select="biblioteca/llibre[preu > 12]">
                        <li>
                            <xsl:value-of select="titol"/>
                            <xsl:text> - </xsl:text>
                            <xsl:value-of select="preu"/>
                        </li>
                    </xsl:for-each>
                </ul>

                <!-- 3. Llibre antic si any < 1980 -->
                <h2>Llibres amb indicació d'antiguitat</h2>
                <ul>
                    <xsl:for-each select="biblioteca/llibre">
                        <li>
                            <xsl:value-of select="titol"/>
                            <xsl:text> (</xsl:text>
                            <xsl:value-of select="any"/>
                            <xsl:text>)</xsl:text>

                            <xsl:if test="any &lt; 1980">
                                <xsl:text> - Llibre antic</xsl:text>
                            </xsl:if>
                        </li>
                    </xsl:for-each>
                </ul>

                <!-- 4. Estat: En préstec o Disponible -->
                <h2>Estat dels llibres</h2>
                <ul>
                    <xsl:for-each select="biblioteca/llibre">
                        <li>
                            <xsl:value-of select="titol"/>
                            <xsl:text> - </xsl:text>

                            <xsl:choose>
                                <xsl:when test="@estat='prestec'">
                                    <xsl:text>En préstec</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>Disponible</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </li>
                    </xsl:for-each>
                </ul>

                <!-- 5. Gènere fantasia o distopia -->
                <h2>Llibres de fantasia o distopia</h2>
                <ul>
                    <xsl:for-each select="biblioteca/llibre[genere='fantasia' or genere='distopia']">
                        <li>
                            <xsl:value-of select="titol"/>
                            <xsl:text> - </xsl:text>
                            <xsl:value-of select="genere"/>
                        </li>
                    </xsl:for-each>
                </ul>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
