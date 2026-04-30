<xsl:template match="/">
    <html>
        <body>

            <!-- Exercici 1 -->
            <h2>Llista de títols</h2>
            <ul>
                <xsl:for-each select="biblioteca/llibre">
                    <li><xsl:value-of select="titol"/></li>
                </xsl:for-each>
            </ul>

            <!-- Exercici 2 -->
            <h2>Títol - Autor</h2>
            <ul>
                <xsl:for-each select="biblioteca/llibre">
                    <li>
                        <xsl:value-of select="titol"/>
                        <xsl:text> - </xsl:text>
                        <xsl:value-of select="autor"/>
                    </li>
                </xsl:for-each>
            </ul>

            <!-- Exercici 3 -->
            <h2>Taula 3 columnes</h2>
            <table border="1">
                <tr><th>Títol</th><th>Autor</th><th>Any</th></tr>
                <xsl:for-each select="biblioteca/llibre">
                    <tr>
                        <td><xsl:value-of select="titol"/></td>
                        <td><xsl:value-of select="autor"/></td>
                        <td><xsl:value-of select="any"/></td>
                    </tr>
                </xsl:for-each>
            </table>

            <!-- Exercici 4 -->
            <h2>Taula 4 columnes</h2>
            <table border="1">
                <tr><th>Títol</th><th>Autor</th><th>Any</th><th>Preu</th></tr>
                <xsl:for-each select="biblioteca/llibre">
                    <tr>
                        <td><xsl:value-of select="titol"/></td>
                        <td><xsl:value-of select="autor"/></td>
                        <td><xsl:value-of select="any"/></td>
                        <td><xsl:value-of select="preu"/></td>
                    </tr>
                </xsl:for-each>
            </table>

        </body>
    </html>
</xsl:template>
