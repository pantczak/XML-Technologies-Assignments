<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:for-each select="Płytoteka/Album">
            <xsl:text>________________________________________________________________________________________________________________________________________________________________________________________&#xA;</xsl:text>
            <xsl:text>|       Nazwa Albumu       |        Wykonawaca       |         Data Premiery        |        Ocena       |    Długość albumu   |      Ilość piosenek     |            Wydawca          |&#xA;</xsl:text>
            <xsl:text>***************************************************************************************************************************************************************************************|&#xA;</xsl:text>
            <xsl:value-of
                    select="concat('|',@Nazwa,substring('                       ',1,26 - string-length(@Nazwa)),'|',@Artysta,substring('                           ',1,25 - string-length(@Artysta)),'|',@Data_premiery_albumu,
                    substring('                            ',1,30 - string-length(@Data_premiery_albumu)),'|',@Ocena,substring('                 ',1,20 - string-length(@Ocena)),'|',@Długość_albummu,
                    substring('                 ',1,21 - string-length(@Długość_albummu)),'|',@Ilość_piosenek_w_albumie,substring('                          ',1,25 - string-length(@Ilość_piosenek_w_albumie)),'|',@Wydawca,substring('                  ',1,29 - string-length(@Wydawca)),'|')"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text>***************************************************************************************************************************************************************************************|&#xA;</xsl:text>
            <xsl:text>|                     Piosenka                       |            Długość           |</xsl:text>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text>***************************************************************************************************************************************************************************************|&#xA;</xsl:text>
            <xsl:for-each select="Piosenki/Piosenka">
                <xsl:value-of
                        select="concat('|',Nazwa,substring('                                                                   ',1,52 - string-length(Nazwa)),'|',Długość,substring('                            ',1,30-string-length(Długość)),'|')"/>
                <xsl:text>&#xA;</xsl:text>
            </xsl:for-each>
            <xsl:text>***************************************************************************************************************************************************************************************|&#xA;</xsl:text>
            <xsl:text>&#xA;</xsl:text><xsl:text>&#xA;</xsl:text><xsl:text>&#xA;</xsl:text><xsl:text>&#xA;</xsl:text>
        </xsl:for-each>
        <xsl:text>____________Podsumowanie:_____________ &#xA;</xsl:text>
        <xsl:text>Ilość Albumów&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Ilość_Albumów"/><xsl:text>&#xA;</xsl:text>
        <xsl:text>Całkowita ilość piosenek&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Całkowita_ilość_piosenek"/><xsl:text>&#xA;</xsl:text>
        <xsl:text>Ilość alumów rockowych&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Ilość_alumów_rockowych"/><xsl:text>&#xA;</xsl:text>
        <xsl:text>Ilość alumów muzyki elektronicznej&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Ilość_alumów_muzyki_elektronicznej"/><xsl:text>&#xA;</xsl:text>
        <xsl:text>Ilość alumów gatunku house&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Ilość_alumów_gatunku_house"/><xsl:text>&#xA;</xsl:text>

        <xsl:text>Ilość alumów popowych&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Ilość_alumów_popowych"/><xsl:text>&#xA;</xsl:text>

        <xsl:text>Ilość alumów metalowych&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Ilość_alumów_metalowych"/><xsl:text>&#xA;</xsl:text>

        <xsl:text>Ilość alumów reggae&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Ilość_alumów_reggae"/><xsl:text>&#xA;</xsl:text>

        <xsl:text>Ilość alumów jazzowych&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Ilość_alumów_jazzowych"/><xsl:text>&#xA;</xsl:text>

        <xsl:text>Ilość alumów jako płyty CD&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Ilość_alumów_jako_płyty_CD"/><xsl:text>&#xA;</xsl:text>

        <xsl:text>Ilość alumów jako płyty vinylowe&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Ilość_alumów_jako_płyty_vinylowe"/><xsl:text>&#xA;</xsl:text>

        <xsl:text>Najwyższa ocena albumu w kolekcji&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Najwyższa_ocena_albumu_w_kolekcji"/><xsl:text>&#xA;</xsl:text>

        <xsl:text>Najniższa ocena albumu w kolekcji&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Najniższa_ocena_albumu_w_kolekcji"/><xsl:text>&#xA;</xsl:text>

        <xsl:text>Podatek VAT od ceny&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Podatek_VAT_od_ceny"/><xsl:text>&#xA;</xsl:text>

        <xsl:text>Najwyżej oceniany album&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Najwyżej_oceniany-album"/><xsl:text>&#xA;</xsl:text>

        <xsl:text>Łączna cena wszystkich albumów&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Łączna_cena_wszystkich_albumów"/><xsl:text>&#xA;</xsl:text>

        <xsl:text>Data wygenerowania raportu&#xA;</xsl:text>
        <xsl:value-of select="Płytoteka/Podsumowanie_kolekcji/Data_wygenerowania_raportu"/><xsl:text>&#xA;</xsl:text>

    </xsl:template>

</xsl:stylesheet>
