<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <!-- 1. Transformació XML → XML    -->

    <xsl:template match="/biblioteca">
        <novaBiblioteca>
            <xsl:apply-templates select="llibre"/>
        </novaBiblioteca>
    </xsl:template>

    <xsl:template match="llibre">
        <obra estat="{@estat}">
            <nom><xsl:value-of select="titol"/></nom>
            <escriptor><xsl:value-of select="autor"/></escriptor>
            <any><xsl:value-of select="any"/></any>
            <preu><xsl:value-of select="preu"/></preu>
        </obra>
    </xsl:template>


    <!-- 2. Sortida en text pla        -->

    <xsl:template match="/biblioteca" mode="text">
        <xsl:for-each select="llibre">
            <xsl:value-of select="titol"/>
            <xsl:text> - </xsl:text>
            <xsl:value-of select="autor"/>
            <xsl:text> - </xsl:text>
            <xsl:value-of select="any"/>
            <xsl:text>&#10;</xsl:text> <!-- Salt de línia -->
        </xsl:for-each>
    </xsl:template>


    <!-- 3. HTML amb classes CSS       -->

    <xsl:template match="/biblioteca" mode="html">
        <html>
            <head>
                <style>
                    .disponible { color: green; }
                    .prestec { color: red; }
                </style>
            </head>
            <body>

                <h1>Biblioteca</h1>

                <ul>
                    <xsl:apply-templates select="llibre" mode="html"/>
                </ul>

                <!-- 4. Nombre total de llibres -->
                <h3>Total de llibres: 
                    <xsl:value-of select="count(llibre)"/>
                </h3>

                <!-- 5. Preu mitjà (si suportat) -->
                <h3>Preu mitjà:
                    <xsl:value-of select="format-number(sum(llibre/preu) div count(llibre), '0.00')"/>
                </h3>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="llibre" mode="html">
        <li class="{@estat}">
            <xsl:value-of select="titol"/>
            <xsl:text> - </xsl:text>
            <xsl:value-of select="autor"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="any"/>
            <xsl:text>)</xsl:text>
        </li>
    </xsl:template>

</xsl:stylesheet>
