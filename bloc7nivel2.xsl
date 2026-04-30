<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <body>

                <!-- 1. Títol del primer llibre -->
                <h2>Títol del primer llibre:</h2>
                <p>
                    <xsl:value-of select="biblioteca/llibre[1]/titol"/>
                </p>

                <!-- 2. Títol i autor del primer llibre -->
                <h2>Títol i autor del primer llibre:</h2>
                <p>
                    <strong>Títol:</strong>
                    <xsl:value-of select="biblioteca/llibre[1]/titol"/>
                    <br/>
                    <strong>Autor:</strong>
                    <xsl:value-of select="biblioteca/llibre[1]/autor"/>
                </p>

                <!-- 3. Codi de la revista -->
                <h2>Codi de la revista:</h2>
                <p>
                    <xsl:value-of select="biblioteca/revista/@codi"/>
                </p>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
