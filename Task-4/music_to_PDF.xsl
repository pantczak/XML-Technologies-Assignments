<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/XSL/Format" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" version="2.0" encoding="UTF-8"/>

    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" language="PL">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4" page-width="210mm" page-height="297mm"
                                       reference-orientation="90" font-family="sans-serif">
                    <fo:region-body margin-left="0.8cm" margin-right="0.8cm" margin-bottom="1.5cm" margin-top="1.5cm" font-family="sans-serif"/>
                    <fo:region-after extent="1.5cm"/>
                    <fo:region-start extent="1.0cm"/>
                    <fo:region-end extent="1.0cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4">
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block font-size="10pt" text-align="right">
                        Strona
                        <fo:page-number/>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block margin-bottom="2px" font-size="15pt" text-align="center" font-weight="bold">Wszystkie
                        albumy
                    </fo:block>
                    <fo:table background-color="azure" text-align="center" display-align="center" table-layout="fixed"
                              border-width="2mm" border-style="solid" font-size="13pt">
                        <xsl:call-template name="thead"/>
                        <fo:table-body>
                            <xsl:for-each select="Płytoteka/Album">
                                <xsl:call-template name="tbody"/>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>
                    <fo:block space-before="50pt"/>
                    <fo:table background-color="lightgray" text-align="center" display-align="center"
                              table-layout="fixed"
                              border-width="2mm" border-style="solid" border-color="red" font-size="13pt">
                        <xsl:call-template name="theadsong"/>
                        <fo:table-body>
                            <xsl:for-each select="Płytoteka/Album">
                                <xsl:call-template name="tbodysong"/>
                            </xsl:for-each>
                        </fo:table-body>
                    </fo:table>
                    <xsl:call-template name="summary"/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    <xsl:template name="thead">
        <fo:table-column column-width="4.5cm"/>
        <fo:table-column column-width="4.5cm"/>
        <fo:table-column column-width="4.5cm"/>
        <fo:table-column column-width="3cm"/>
        <fo:table-column column-width="2.5cm"/>
        <fo:table-column column-width="4.5cm"/>
        <fo:table-column column-width="4.5cm"/>

        <fo:table-header text-align="center" background-color="blueviolet">
            <table-row>
                <table-cell>
                    <block font-weight="bold">Nazwa</block>
                </table-cell>
                <table-cell>
                    <block font-weight="bold">Artysta</block>
                </table-cell>
                <table-cell>
                    <block font-weight="bold">Gatunek</block>
                </table-cell>
                <table-cell>
                    <block font-weight="bold">Data premiery</block>
                </table-cell>
                <table-cell>
                    <block font-weight="bold">Dlugosc albumu</block>
                </table-cell>
                <table-cell>
                    <block font-weight="bold">Wydawca</block>
                </table-cell>
                <table-cell>
                    <block font-weight="bold">Ocena</block>
                </table-cell>
            </table-row>
        </fo:table-header>
    </xsl:template>
    <xsl:template name="tbody">
        <table-row text-align="center">
            <table-cell border="solid" padding="1mm">
                <block>
                    <xsl:value-of select="@Nazwa"/>
                </block>
            </table-cell>
            <table-cell border="solid" padding="1mm">
                <block>
                    <xsl:value-of select="@Artysta"/>
                </block>
            </table-cell>
            <table-cell border="solid" padding="1mm">
                <block>
                    <xsl:value-of select="@Gatunek"/>
                </block>
            </table-cell>
            <table-cell border="solid" padding="1mm">
                <block>
                    <xsl:value-of select="@Data_premiery_albumu"/>
                </block>
            </table-cell>
            <table-cell border="solid" padding="1mm">
                <block>
                    <xsl:value-of select="@Długość_albummu"/>
                </block>
            </table-cell>
            <table-cell border="solid" padding="1mm">
                <block>
                    <xsl:value-of select="@Wydawca"/>
                </block>
            </table-cell>
            <table-cell border="solid" padding="1mm">
                <block>
                    <xsl:value-of select="@Ocena"/>
                </block>
            </table-cell>
        </table-row>
    </xsl:template>
    <xsl:template name="theadsong">
        <fo:table-column column-width="9.33cm"/>
        <fo:table-column column-width="9.33cm"/>
        <fo:table-column column-width="9.33cm"/>
        <fo:table-header>
            <table-row>
                <table-cell>
                    <block font-weight="bold">Album</block>
                </table-cell>
                <table-cell>
                    <block font-weight="bold">Piosenki</block>
                </table-cell>
                <table-cell>
                    <block font-weight="bold">Czas trwania</block>
                </table-cell>
            </table-row>
        </fo:table-header>
    </xsl:template>
    <xsl:template name="tbodysong">
        <table-row>
            <table-cell text-align="center" border="solid" padding="1mm">
                <block>
                    <xsl:value-of select="@Nazwa"/>
                </block>
            </table-cell>
            <table-cell text-align="center" border="solid" padding="1mm">
                <block>
                    <xsl:for-each select="Piosenki/Piosenka">
                        <xsl:value-of select="Nazwa"/>
                        <xsl:value-of select="'&#x2028;'"/>
                    </xsl:for-each>
                </block>
            </table-cell>
            <table-cell text-align="center" border="solid" padding="1mm">
                <block>
                    <xsl:for-each select="Piosenki/Piosenka">
                        <xsl:value-of select="Długość"/>
                        <xsl:value-of select="'&#x2028;'"/>
                    </xsl:for-each>
                </block>
            </table-cell>
        </table-row>
    </xsl:template>
    <xsl:template name="summary">
<fo:block margin-bottom="5px" margin-top="25px" font-size="16px" text-align="center" font-weight="bold">Podsumowanie: </fo:block>
        <list-block>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px">Liczba albumow: <xsl:value-of select="//Ilość_Albumów"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px">Liczba piosenek: <xsl:value-of select="//Całkowita_ilość_piosenek"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px">Liczba albumow rockowych: <xsl:value-of select="//Ilość_alumów_rockowych"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px">Liczba albumow muzyki elektronicznej: <xsl:value-of select="//Ilość_alumów_muzyki_elektronicznej"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px"> Liczba albumow gatunku house: <xsl:value-of select="//Ilość_alumów_gatunku_house"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px"> Liczba alumów popowych: <xsl:value-of select="//Ilość_alumów_popowych"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px"> Liczba alumów metalowych: <xsl:value-of select="//Ilość_alumów_metalowych"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px"> Liczba alumów reggae: <xsl:value-of select="//Ilość_alumów_reggae"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px"> Liczba alumów_jazzowych<xsl:value-of select="//Ilość_alumów_jazzowych"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px"> Liczba alumów jako płyty CD: <xsl:value-of select="//Ilość_alumów_jako_płyty_CD"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px"> Liczba alumów jako płyty vinylowe: <xsl:value-of select="//Ilość_alumów_jako_płyty_vinylowe"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px">Najwyższa ocena albumu w kolekcji: <xsl:value-of select="//Najwyższa_ocena_albumu_w_kolekcji"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px"> Liczba alumów jako płyty CD: <xsl:value-of select="//Ilość_alumów_jako_płyty_CD"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px">Najniższa ocena albumu w kolekcji: <xsl:value-of select="//Najniższa_ocena_albumu_w_kolekcji"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px">Podatek VAT od ceny: <xsl:value-of select="//Podatek_VAT_od_ceny"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px">Najwyżej oceniany album: <xsl:value-of select="//Najwyżej_oceniany-album"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px">Łączna cena wszystkich albumów: <xsl:value-of select="//Łączna_cena_wszystkich_albumów"/> </block>
                </list-item-body>
            </list-item>
            <list-item>
                <list-item-label>
                    <block>-</block>
                </list-item-label>
                <list-item-body>
                    <block margin-left="10px">Data wygenerowania raportu: <xsl:value-of select="//Data_wygenerowania_raportu"/> </block>
                </list-item-body>
            </list-item>
        </list-block>
    </xsl:template>
</xsl:stylesheet>