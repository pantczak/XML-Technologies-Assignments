<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="yes"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
            <head>
                <title>XML Zadanie 3 Płytoteka</title>
                <meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8"/>
                <style type="text/css">
                    body {
                        background-attachment: fixed;
                        background-image: url("backgrounds/turntable.jpeg")
                    }

                    table {
                        margin-left: auto;
                        margin-right: auto;
                    }

                    table.table1 {
                        align-content: center;
                        opacity: 0.5;
                        width: 80%;
                        background: #FFFFFF;
                    }

                    b {
                        font-weight: bold;
                        font-family: 'Ink Free', serif;
                        font-size: 50pt
                    }

                    td {
                        text-align: center;
                        align-content: center;
                    }
                </style>
            </head>
            <body>
                <div>
                    <div>
                        <table class="table1" border="5">
                            <caption>
                                <b>Nasze albumy:</b>
                            </caption>
                            <tr>
                                <th>Nazwa albumu</th>
                                <th>Artysta</th>
                                <th>Gatunek</th>
                                <th>Data premiery</th>
                                <th>Ilość piosenek</th>
                                <th>Długość</th>
                                <th>Wydawca</th>
                                <th>Ocena krytyków</th>
                                <th>Piosenki</th>
                            </tr>
                            <xsl:for-each select="Płytoteka/Album">
                                <tr>
                                    <td>
                                        <xsl:value-of select="@Nazwa"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Artysta"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Gatunek"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Data_premiery_albumu"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Ilość_piosenek_w_albumie"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Długość_albummu"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Wydawca"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@Ocena"/>
                                    </td>
                                    <td>
                                        <table class="tableinside">
                                            <xsl:for-each select="Piosenki">
                                                <xsl:for-each select="Piosenka">
                                                    <tr>
                                                        <td>
                                                            <xsl:value-of select="Nazwa"/>
                                                        </td>
                                                    </tr>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </table>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>
                </div>
                <div>
                    <div>
                        <xsl:for-each select="Płytoteka/Podsumowanie_kolekcji">
                            <table class="table1"  border="5">
                                <caption>
                                    <b>
                                        Podsumowanie:
                                    </b>
                                </caption>
                                <tr>
                                    <th>Ilość albumów</th>
                                    <th>Ilość piosenek</th>
                                    <th>Albumy rockowe</th>
                                    <th>Albumy elektro</th>
                                    <th>Albumy house</th>
                                    <th>Albumy popowe</th>
                                    <th>Albumy metalowe</th>
                                    <th>Albumy reggae</th>
                                    <th>Albumy jazzowe</th>
                                </tr>
                                <tr>
                                    <td>
                                        <xsl:value-of select="Ilość_Albumów"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Całkowita_ilość_piosenek"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Ilość_alumów_rockowych"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Ilość_alumów_muzyki_elektronicznej"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Ilość_alumów_gatunku_house"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Ilość_alumów_popowych"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Ilość_alumów_metalowych"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Ilość_alumów_reggae"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Ilość_alumów_jazzowych"/>
                                    </td>
                                </tr>
                            </table>
                            <table class="table1"  border="5">
                                <tr>
                                    <th>Ilość płyt CD</th>
                                    <th>Ilość winyli</th>
                                    <th>Najwyższa ocena</th>
                                    <th>Najniższa ocena</th>
                                    <th>Podatek VAT</th>
                                    <th>Najwyzej oceniany</th>
                                    <th>Suma cen albumów</th>
                                </tr>
                                <tr>
                                    <td>
                                        <xsl:value-of select="Ilość_alumów_jako_płyty_CD"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Ilość_alumów_jako_płyty_vinylowe"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Najwyższa_ocena_albumu_w_kolekcji"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Najniższa_ocena_albumu_w_kolekcji"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Podatek_VAT_od_ceny"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Najwyżej_oceniany-album"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Łączna_cena_wszystkich_albumów"/>
                                    </td>
                                </tr>
                            </table>
                            <table class="table1" border="5">
                                <tr>
                                    <th>Data wygenerowania raportu</th>
                                </tr>
                                <tr>
                                    <td>
                                        <xsl:value-of select="Data_wygenerowania_raportu"/>
                                    </td>
                                </tr>
                            </table>
                        </xsl:for-each>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
