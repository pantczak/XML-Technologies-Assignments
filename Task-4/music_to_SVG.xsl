<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsd="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <svg width="1920" height="1500" viewBox="0 0 1920 1500" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">

            <g transform="translate({960 - 200} 0)">
                <a xlink:href="./musicSVG.svg#tab2" target="_self">
                    <g transform="translate(0 0)">
                        <rect x="0" y="0" width="200" height="50" fill="white" stroke="grey"/>
                        <text x="100" y="30" text-anchor="middle">Tabela podsumowania</text>
                    </g>
                </a>

                <a xlink:href="./musicSVG.svg#chart1" target="_self">
                    <g transform="translate(200 0)">
                        <rect x="0" y="0" width="200" height="50" fill="white" stroke="grey"/>
                        <text x="100" y="30" text-anchor="middle">Wykres gatunków</text>
                    </g>
                </a>
            </g>


                <g transform="translate(450, 150)">
                    <rect x="0"  y="0" width="500" height="450" fill="white" stroke="black" stroke-width="3.0"/>
                    <xsl:for-each select="1 to 9">
                        <rect x="0" y="{(position() - 1) * 50}" width="250" height="50" fill="grey" stroke="black" stroke-width="3.0" fill-opacity="0.33"/>
                    </xsl:for-each>

                    <xsl:for-each select="1 to 8">
                        <line x1="250" x2="500" y1="{position() * 50}" y2="{position() * 50}" style="stroke:rgb(0,0,0);stroke-width:2"/>
                    </xsl:for-each>

                    <a id="tab2"/>

                    <text x="10" y="30">Ilość albumów</text>
                    <text x="10" y="80">Całkowita ilość piosenek</text>
                    <text x="10" y="130">Ilość albumów rockowych</text>
                    <text x="10" y="180">Ilość albumów elektronicznych</text>
                    <text x="10" y="230">Ilość albumów muzyki house</text>
                    <text x="10" y="280">Ilość albumów popowych</text>
                    <text x="10" y="330">Ilość albumów metalowych</text>
                    <text x="10" y="380">Ilość albumów reggae</text>
                    <text x="10" y="430">Ilość albumów jazzowych</text>

                    <xsl:for-each select="Płytoteka/Podsumowanie_kolekcji">
                        <text x="260" y="30"> <xsl:value-of select="Ilość_Albumów"/> </text>
                        <text x="260" y="80"> <xsl:value-of select="Całkowita_ilość_piosenek"/> </text>
                        <text x="260" y="130"> <xsl:value-of select="Ilość_alumów_rockowych"/> </text>
                        <text x="260" y="180"> <xsl:value-of select="Ilość_alumów_muzyki_elektronicznej"/> </text>
                        <text x="260" y="230"> <xsl:value-of select="Ilość_alumów_gatunku_house"/> </text>
                        <text x="260" y="280"> <xsl:value-of select="Ilość_alumów_popowych"/> </text>
                        <text x="260" y="330"> <xsl:value-of select="Ilość_alumów_metalowych"/> </text>
                        <text x="260" y="380"> <xsl:value-of select="Ilość_alumów_reggae"/> </text>
                        <text x="260" y="430"> <xsl:value-of select="Ilość_alumów_jazzowych"/> </text>
                    </xsl:for-each>

                </g>

                <g transform="translate(970, 150)">
                    <rect x="0"  y="0" width="500" height="450" fill="white" stroke="black" stroke-width="3.0"/>
                    <xsl:for-each select="1 to 9">
                        <rect x="0" y="{(position() - 1) * 50}" width="250" height="50" fill="grey" stroke="black" stroke-width="3.0" fill-opacity="0.33"/>
                    </xsl:for-each>

                    <xsl:for-each select="1 to 8">
                        <line x1="250" x2="500" y1="{position() * 50}" y2="{position() * 50}" style="stroke:rgb(0,0,0);stroke-width:2"/>
                    </xsl:for-each>

                    <text x="10" y="30">Ilość albumów na CD</text>
                    <text x="10" y="80">Ilość albumów na winylach</text>
                    <text x="10" y="130">Najwyższa ocena albumu w kolekcji</text>
                    <text x="10" y="180">Najniższa ocena albumu w kolekcji</text>
                    <text x="10" y="230">Podatek VAT od ceny</text>
                    <text x="10" y="280">Najwyżej oceniany album</text>
                    <text x="10" y="330">Łączna cena wszystkich albumów</text>
                    <text x="10" y="380">Data wygenerowania raportu</text>
                    <text x="10" y="430">Autorzy</text>

                    <xsl:for-each select="Płytoteka/Podsumowanie_kolekcji">
                        <text x="260" y="30"> <xsl:value-of select="Ilość_alumów_jako_płyty_CD"/> </text>
                        <text x="260" y="80"> <xsl:value-of select="Ilość_alumów_jako_płyty_vinylowe"/> </text>
                        <text x="260" y="130"> <xsl:value-of select="Najwyższa_ocena_albumu_w_kolekcji"/> </text>
                        <text x="260" y="180"> <xsl:value-of select="Najniższa_ocena_albumu_w_kolekcji"/> </text>
                        <text x="260" y="230"> <xsl:value-of select="Podatek_VAT_od_ceny"/> </text>
                        <text x="260" y="280"> <xsl:value-of select="Najwyżej_oceniany-album"/> </text>
                        <text x="260" y="330"> <xsl:value-of select="Łączna_cena_wszystkich_albumów"/> </text>
                        <text x="260" y="380"> <xsl:value-of select="Data_wygenerowania_raportu"/> </text>
                    </xsl:for-each>

                    <text x="260" y="430"> Piotr Antczak, Mikołaj Bajkowski </text>

                </g>

            <g transform="translate(960 700)">
                <a id="chart1"/>
                <xsl:for-each select="Płytoteka/Podsumowanie_kolekcji">
                    <rect id="chartRect" x="-400" y="0" height="300" width="800" fill="rgb(230,230,230)">
                        <animate begin="mouseover" end="mouseout" attributeName="fill-opacity" values="1; 0.3; 1" dur="1" repeatCount="indefinite"/>
                    </rect>
                    <text x="0" y="30" text-anchor="middle" font-weight="900">Liczność albumów według gatunku</text>
                    <text x="-300" y="50" text-anchor="middle">Rock</text>
                    <rect x="-300" y="60" width="25" height="{25 * Ilość_alumów_rockowych}" transform="translate(-12.5 0)" fill="rgb(200,200,100)" fill-opacity="0.5">
                        <animate begin="mouseover" attributeName="fill-opacity" values="0.5; 1"  dur="1" fill="freeze"/>
                        <animate begin="mouseout" attributeName="fill-opacity" values="1;0.5" dur="1" fill="freeze"/>
                        <animate attributeType="XML" attributeName="height" from="0" to="{(25*Ilość_alumów_rockowych)}" dur="2s" fill="freeze"/>
                    </rect>
                    <text x="-300" y="{80 + 25 * Ilość_alumów_rockowych}" text-anchor="middle"> <xsl:value-of select="Ilość_alumów_rockowych"/> </text>
                    <text x="-200" y="50" text-anchor="middle">Elektroniczny</text>
                    <rect x="-200" y="60" width="25" height="{25 * Ilość_alumów_muzyki_elektronicznej}" transform="translate(-12.5 0)" fill="rgb(200,100,200)" fill-opacity="0.5">
                        <animate begin="mouseover" attributeName="fill-opacity" values="0.5; 1"  dur="1" fill="freeze"/>
                        <animate begin="mouseout" attributeName="fill-opacity" values="1;0.5" dur="1" fill="freeze"/>
                        <animate attributeType="XML" attributeName="height" from="0" to="{(25*Ilość_alumów_muzyki_elektronicznej)}" dur="2s" fill="freeze"/>
                    </rect>
                    <text x="-200" y="{80 + 25 * Ilość_alumów_muzyki_elektronicznej}" text-anchor="middle"> <xsl:value-of select="Ilość_alumów_muzyki_elektronicznej"/> </text>
                    <text x="-100" y="50" text-anchor="middle">House</text>
                    <rect x="-100" y="60" width="25" height="{25 * Ilość_alumów_gatunku_house}" transform="translate(-12.5 0)" fill="rgb(100,200,200)" fill-opacity="0.5">
                        <animate begin="mouseover" attributeName="fill-opacity" values="0.5; 1"  dur="1" fill="freeze"/>
                        <animate begin="mouseout" attributeName="fill-opacity" values="1;0.5" dur="1" fill="freeze"/>
                        <animate attributeType="XML" attributeName="height" from="0" to="{(25*Ilość_alumów_gatunku_house)}" dur="2s" fill="freeze"/>
                    </rect>
                    <text x="-100" y="{80 + 25 * Ilość_alumów_gatunku_house}" text-anchor="middle"> <xsl:value-of select="Ilość_alumów_gatunku_house"/> </text>
                    <text x="0" y="50" text-anchor="middle">Pop</text>
                    <rect x="0" y="60" width="25" height="{25 * Ilość_alumów_popowych}" transform="translate(-12.5 0)" fill="rgb(250,75,175)" fill-opacity="0.5">
                        <animate begin="mouseover" attributeName="fill-opacity" values="0.5; 1"  dur="1" fill="freeze"/>
                        <animate begin="mouseout" attributeName="fill-opacity" values="1;0.5" dur="1" fill="freeze"/>
                        <animate attributeType="XML" attributeName="height" from="0" to="{(25*Ilość_alumów_popowych)}" dur="2s" fill="freeze"/>
                    </rect>
                    <text x="0" y="{80 + 25 * Ilość_alumów_popowych}" text-anchor="middle"> <xsl:value-of select="Ilość_alumów_popowych"/> </text>
                    <text x="100" y="50" text-anchor="middle">Metal</text>
                    <rect x="100" y="60" width="25" height="{25 * Ilość_alumów_metalowych}" transform="translate(-12.5 0)" fill="rgb(175,250,75)" fill-opacity="0.5">
                        <animate begin="mouseover" attributeName="fill-opacity" values="0.5; 1"  dur="1" fill="freeze"/>
                        <animate begin="mouseout" attributeName="fill-opacity" values="1;0.5" dur="1" fill="freeze"/>
                        <animate attributeType="XML" attributeName="height" from="0" to="{(25*Ilość_alumów_metalowych)}" dur="2s" fill="freeze"/>
                    </rect>
                    <text x="100" y="{80 + 25 * Ilość_alumów_metalowych}" text-anchor="middle"> <xsl:value-of select="Ilość_alumów_metalowych"/> </text>
                    <text x="200" y="50" text-anchor="middle">Reggae</text>
                    <rect x="200" y="60" width="25" height="{25 * Ilość_alumów_reggae}" transform="translate(-12.5 0)" fill="rgb(175,75,250)" fill-opacity="0.5">
                        <animate begin="mouseover" attributeName="fill-opacity" values="0.5; 1"  dur="1" fill="freeze"/>
                        <animate begin="mouseout" attributeName="fill-opacity" values="1;0.5" dur="1" fill="freeze"/>
                        <animate attributeType="XML" attributeName="height" from="0" to="{(25*Ilość_alumów_reggae)}" dur="2s" fill="freeze"/>
                    </rect>
                    <text x="200" y="{80 + 25 * Ilość_alumów_reggae}" text-anchor="middle"> <xsl:value-of select="Ilość_alumów_reggae"/> </text>
                    <text x="300" y="50" text-anchor="middle">Jazz</text>
                    <rect x="300" y="60" width="25" height="{25 * Ilość_alumów_jazzowych}" transform="translate(-12.5 0)" fill="rgb(75,250,175)" fill-opacity="0.5">
                        <animate begin="mouseover" attributeName="fill-opacity" values="0.5; 1"  dur="1" fill="freeze"/>
                        <animate begin="mouseout" attributeName="fill-opacity" values="1;0.5" dur="1" fill="freeze"/>
                        <animate attributeType="XML" attributeName="height" from="0" to="{(25*Ilość_alumów_jazzowych)}" dur="2s" fill="freeze"/>
                    </rect>
                    <text x="300" y="{80 + 25 * Ilość_alumów_jazzowych}" text-anchor="middle"> <xsl:value-of select="Ilość_alumów_jazzowych"/> </text>
                </xsl:for-each>

            </g>

        </svg>
    </xsl:template>
</xsl:stylesheet>