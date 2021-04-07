<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <xsl:element name="Płytoteka">
            <xsl:apply-templates select="albums/albumlist"/>
            <xsl:element name="Podsumowanie_kolekcji">
                <xsl:element name="Ilość_Albumów">
                    <xsl:value-of select="count(albums/albumlist/album)"/>
                </xsl:element>
                <xsl:element name="Całkowita_ilość_piosenek">
                    <xsl:value-of select="count(albums/albumlist/album/songs/song)"/>
                </xsl:element>
                <xsl:element name="Ilość_alumów_rockowych">
                    <xsl:value-of select="count(albums/albumlist/album[@genre_type='Rock'])"/>
                </xsl:element>
                <xsl:element name="Ilość_alumów_muzyki_elektronicznej">
                    <xsl:value-of select="count(albums/albumlist/album[@genre_type='Electronic'])"/>
                </xsl:element>
                <xsl:element name="Ilość_alumów_gatunku_house">
                    <xsl:value-of select="count(albums/albumlist/album[@genre_type='House'])"/>
                </xsl:element>
                <xsl:element name="Ilość_alumów_popowych">
                    <xsl:value-of select="count(albums/albumlist/album[@genre_type='Pop'])"/>
                </xsl:element>
                <xsl:element name="Ilość_alumów_metalowych">
                    <xsl:value-of select="count(albums/albumlist/album[@genre_type='Metal'])"/>
                </xsl:element>
                <xsl:element name="Ilość_alumów_reggae">
                    <xsl:value-of select="count(albums/albumlist/album[@genre_type='Reggae'])"/>
                </xsl:element>
                <xsl:element name="Ilość_alumów_jazzowych">
                    <xsl:value-of select="count(albums/albumlist/album[@genre_type='Jazz'])"/>
                </xsl:element>
                <xsl:element name="Ilość_alumów_jako_płyty_CD">
                    <xsl:value-of select="count(albums/albumlist/album[@type='CD'])"/>
                </xsl:element>
                <xsl:element name="Ilość_alumów_jako_płyty_vinylowe">
                    <xsl:value-of select="count(albums/albumlist/album[@type='Vinyl'])"/>
                </xsl:element>
                <xsl:element name="Najwyższa_ocena_albumu_w_kolekcji">
                    <xsl:value-of select="max(albums/albumlist/album/info/rating)"/>
                </xsl:element>
                <xsl:element name="Najniższa_ocena_albumu_w_kolekcji">
                    <xsl:value-of select="min(albums/albumlist/album/info/rating)"/>
                </xsl:element>
                <xsl:variable name="maxRating" select="max(albums/albumlist/album/info/rating)"/>
                <xsl:variable name="PodatekVat" select="sum(albums/albumlist/album/info/price)"/>

                <xsl:element name="Podatek_VAT_od_ceny">
                    <xsl:value-of select="concat(round(($PodatekVat * 23)div 100),'zł')"/>
                </xsl:element>

                <xsl:element name="Najwyżej_oceniany-album">
                    <xsl:for-each select="albums/albumlist/album/info">
                        <xsl:choose>
                            <xsl:when test="rating = $maxRating">
                                <xsl:value-of select="album_title"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:element>

                <xsl:element name="Łączna_cena_wszystkich_albumów">
                    <xsl:value-of select="concat(sum(albums/albumlist/album/info/price),'zł')"/>
                </xsl:element>

                <xsl:element name="Data_wygenerowania_raportu">
                    <xsl:value-of select="format-dateTime(current-dateTime(),'[D01]-[M01]-[Y0001]')"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="albums/albumlist">
        <xsl:for-each select="album">
            <xsl:sort select="info/rating" order="descending"/>
            <xsl:element name="Album">
                <xsl:attribute name="Nazwa">
                    <xsl:value-of select="info/album_title"/>
                </xsl:attribute>
                <xsl:attribute name="Artysta">
                    <xsl:choose>
                        <xsl:when test="info/band[(@band_id_ref ='Weez')]">
                            <xsl:value-of select="/albums/bandlist/bandinfo[@band_id ='Weez']/name"/>
                        </xsl:when>
                        <xsl:when test="info/band[(@band_id_ref ='BKey')]">
                            <xsl:value-of select="/albums/bandlist/bandinfo[@band_id ='BKey']/name"/>
                        </xsl:when>
                        <xsl:when test="info/band[(@band_id_ref ='DPun')]">
                            <xsl:value-of select="/albums/bandlist/bandinfo[@band_id ='DPun']/name"/>
                        </xsl:when>
                        <xsl:when test="info/band[(@band_id_ref ='LL')]">
                            <xsl:value-of select="/albums/bandlist/bandinfo[@band_id ='LL']/name"/>
                        </xsl:when>
                        <xsl:when test="info/band[(@band_id_ref ='Avic')]">
                            <xsl:value-of select="/albums/bandlist/bandinfo[@band_id ='Avic']/name"/>
                        </xsl:when>
                        <xsl:when test="info/band[(@band_id_ref ='MJac')]">
                            <xsl:value-of select="/albums/bandlist/bandinfo[@band_id ='MJac']/name"/>
                        </xsl:when>
                        <xsl:when test="info/band[(@band_id_ref ='ATCu')]">
                            <xsl:value-of select="/albums/bandlist/bandinfo[@band_id ='ATCu']/name"/>
                        </xsl:when>
                        <xsl:when test="info/band[(@band_id_ref ='EJoh')]">
                            <xsl:value-of select="/albums/bandlist/bandinfo[@band_id ='EJoh']/name"/>
                        </xsl:when>
                        <xsl:when test="info/band[(@band_id_ref ='Slip')]">
                            <xsl:value-of select="/albums/bandlist/bandinfo[@band_id ='Slip']/name"/>
                        </xsl:when>
                        <xsl:when test="info/band[(@band_id_ref ='MDav')]">
                            <xsl:value-of select="/albums/bandlist/bandinfo[@band_id ='MDav']/name"/>
                        </xsl:when>
                        <xsl:when test="info/band[(@band_id_ref ='Muse')]">
                            <xsl:value-of select="/albums/bandlist/bandinfo[@band_id ='Muse']/name"/>
                        </xsl:when>
                        <xsl:when test="info/band[(@band_id_ref ='BMar')]">
                            <xsl:value-of select="/albums/bandlist/bandinfo[@band_id ='BMar']/name"/>
                        </xsl:when>
                        <xsl:when test="info/band[(@band_id_ref ='FMac')]">
                            <xsl:value-of select="/albums/bandlist/bandinfo[@band_id ='FMac']/name"/>
                        </xsl:when>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:choose>
                    <xsl:when test="string(@genre_type) = 'Rock'">
                        <xsl:attribute name="Gatunek">Rock</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@genre_type) = 'Electronic'">
                        <xsl:attribute name="Gatunek">Muzyka Elektroniczna</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@genre_type) = 'House'">
                        <xsl:attribute name="Gatunek">House</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@genre_type) = 'Pop'">
                        <xsl:attribute name="Gatunek">Pop</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@genre_type) = 'Metal'">
                        <xsl:attribute name="Gatunek">Metal</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@genre_type) = 'Reggae'">
                        <xsl:attribute name="Gatunek">Reggae</xsl:attribute>
                    </xsl:when>
                    <xsl:when test="string(@genre_type) = 'Jazz'">
                        <xsl:attribute name="Gatunek">Jazz</xsl:attribute>
                    </xsl:when>
                </xsl:choose>
                <xsl:attribute name="Data_premiery_albumu">
                    <xsl:value-of select="info/release_year"/>
                </xsl:attribute>
                <xsl:attribute name="Ilość_piosenek_w_albumie">
                    <xsl:value-of select="info/number_of_songs"/>
                </xsl:attribute>
                <xsl:attribute name="Długość_albummu">
                    <xsl:value-of select="info/total_length"/>
                </xsl:attribute>
                <xsl:attribute name="Wydawca">
                    <xsl:value-of select="info/studio"/>
                </xsl:attribute>
                <xsl:attribute name="Ocena">
                    <xsl:value-of select="concat(info/rating,'/10')"/>
                </xsl:attribute>
                <xsl:element name="Piosenki">
                    <xsl:for-each select="songs/song">
                        <xsl:element name="Piosenka">
                            <xsl:element name="Nazwa">
                                <xsl:value-of select="title"/>
                            </xsl:element>
                            <xsl:element name="Długość">
                                <xsl:value-of select="song_length"/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
