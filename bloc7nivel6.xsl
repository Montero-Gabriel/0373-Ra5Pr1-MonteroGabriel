<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- 1. Plantilla principal -->
    <xsl:template match="/">
        <html>
            <body>

                <h1>Biblioteca</h1>

                <!-- 4. Secció de llibres -->
                <h2>Llibres</h2>
                <ul>
                    <!-- 2. Aplicar plantilles a tots els llibres -->
                    <xsl:apply-templates select="biblioteca/llibre"/>
                </ul>

                <!-- 4. Secció de revistes -->
                <h2>Revistes</h2>
                <ul>
                    <!-- 3. Aplicar plantilles a revistes -->
                    <xsl:apply-templates select="biblioteca/revista"/>
                </ul>

            </body>
        </html>
    </xsl:template>

    <!-- 1. Plantilla per a llibre: genera <li> amb el títol -->
    <xsl:template match="llibre">
        <li>
            <xsl:value-of select="titol"/>
        </li>
    </xsl:template>

    <!-- 3. Plantilla específica per a revista -->
    <xsl:template match="revista">
        <li>
            <xsl:value-of select="@codi"/>
            <xsl:text> - </xsl:text>
            <xsl:value-of select="titol"/>
        </li>
    </xsl:template>

</xsl:stylesheet>
