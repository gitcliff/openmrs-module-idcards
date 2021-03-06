<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY asymptotic-to "&#x2248;">
]>
<xsl:stylesheet version="2.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:fo="http://www.w3.org/1999/XSL/Format"
      xmlns:fn="http://www.w3.org/2005/02/xpath-functions">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="simple" page-height="297mm" page-width="210mm"
            margin-top="0.6cm" margin-left="0cm" margin-right="0cm" margin-bottom="0.8cm">
            <fo:region-body margin-top="0.4cm" margin-bottom="0cm" />
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="simple">
        <fo:flow flow-name="xsl-region-body" font-family="Helvetica" font-size="8pt">
            <fo:block text-align="center">
                <fo:table table-layout="fixed" start-indent="(100% - 168mm - 3mm) div 2"
                        table-omit-header-at-break="false" >
                    <fo:table-column column-width="84mm"/>
                    <fo:table-column column-width="84mm"/>

                    <fo:table-header border="solid white" >
                        <fo:table-row height="6mm" >
                            <fo:table-cell>
                                <fo:block font-size="6pt" font-weight="bold" display-align="before">
                                    DRAFT Patient ID Cards
                                      (<xsl:value-of select="idCardList/contextPath"/>)
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell>
                                <fo:block font-size="6pt" font-weight="bold">
                                    Page: <fo:page-number/>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-header>

                    <fo:table-body border="2 pt solid black">
                        <xsl:variable name="contextPath" select="idCardList/contextPath"/>
                        <xsl:variable name="padding" select="'000000000'"/>
                        <xsl:for-each select="idCardList/idCard">
                            <xsl:variable name="id" select="./id"/>
                            <xsl:variable name="identifier" select="substring(concat($padding, $id), string-length($id) - 1, string-length($padding) + 2)" />
                            <fo:table-row height="52mm" border="2pt solid black">
                                    <fo:table-cell border="1pt dashed grey" display-align="before">
                                        <fo:block text-align="center" start-indent="0mm" margin-top="0mm" >
                                            <fo:block-container>
                                                <fo:block-container position="absolute">
                                                    <fo:block font-size="6pt"
                                                              font-style="italic"
                                                              font-weight="bold"
                                                              color="(#4c4c4c)">
                                                        <fo:table table-layout="fixed" >
                                                            <fo:table-column column-width="40%"/>
                                                            <fo:table-column column-width="20%"/>
                                                            <fo:table-column column-width="40%"/>
                                                            <fo:table-body>
                                                                <fo:table-row height="6mm" >
                                                                    <fo:table-cell><fo:block/></fo:table-cell>
                                                                </fo:table-row>
                                                                <fo:table-row >
                                                                    <fo:table-cell
                                                                            border-top-color="black"
                                                                            border-top-style="dotted"
                                                                            border-top-width="1pt">
                                                                        <fo:block>Date Issued</fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell >
                                                                            <fo:block></fo:block>
                                                                        </fo:table-cell>
                                                                    <fo:table-cell
                                                                            border-top-color="black"
                                                                            border-top-style="dotted"
                                                                            border-top-width="1pt">
                                                                        <fo:block>Assigning Location</fo:block>
                                                                    </fo:table-cell>
                                                                 </fo:table-row>
                                                            </fo:table-body>
                                                        </fo:table>
                                                    </fo:block>
                                                    <fo:block text-align="center" display-align="after" margin-top="0mm" margin-bottom="0mm">
                                                        <fo:external-graphic
                                                                src="test/org/openmrs/module/idcards/include/card_logo_06.png"
                                                                scaling="uniform"
                                                                content-height="8mm"
                                                                content-width="scale-to-fit"/>
                                                    </fo:block>
                                                    <fo:block margin-top="0mm" margin-bottom="1mm">
                                                        <fo:instream-foreign-object >
                                                            <barcode:barcode
                                                                xmlns:barcode="http://barcode4j.krysalis.org/ns"
                                                                message="{$identifier}" orientation="0">
                                                                <barcode:code39>
                                                                    <barcode:height>24mm</barcode:height>
                                                                    <barcode:quiet-zone enabled="false"></barcode:quiet-zone>
                                                                    <barcode:checksum>ignore</barcode:checksum>
                                                                    <barcode:module-width>0.30mm</barcode:module-width>
                                                                    <barcode:human-readable>
                                                                      <barcode:placement>bottom</barcode:placement>
                                                                      <barcode:font-size>12pt</barcode:font-size>
                                                                    </barcode:human-readable>
                                                                </barcode:code39>
                                                                <barcode:quiet-zone enabled="false"/>
                                                            </barcode:barcode>
                                                        </fo:instream-foreign-object>
                                                    </fo:block>
                                                    <fo:block font-size="6pt">
                                                        <xsl:value-of select="lostAndFound"/>
                                                    </fo:block>
                                                </fo:block-container>
                                            </fo:block-container>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="1pt dashed grey" display-align="before">
                                        <fo:block text-align="center" start-indent="0mm" margin-top="5mm">
                                            <fo:block-container>
                                                <fo:block-container position="absolute">
                                                    <fo:block>
                                                        <fo:table table-layout="fixed">
                                                            <fo:table-column column-width="100%"/>
                                                            <fo:table-body display-align="center">
                                                                <fo:table-row>
                                                                    <fo:table-cell>
                                                                        <fo:block text-align="center" display-align="center">
                                                                            <fo:external-graphic
                                                                                    src="test/org/openmrs/module/idcards/include/card_logo_06.png"
                                                                                    scaling="uniform"
                                                                                    content-height="12mm"
                                                                                    content-width="scale-to-fit"/>
                                                                        </fo:block>
                                                                        <fo:block font-weight="bold" font-size="12pt">
                                                                            <xsl:value-of select="name"/>
                                                                        </fo:block>
                                                                        <fo:block font-weight="bold" font-size="12pt" >
                                                                            <xsl:value-of select="id"/>
                                                                        </fo:block>

                                                                        
                                                                        <!--
                                                                        <fo:block color="(#4c4c4c)" font-weight="bold" >
                                                                            <fo:table table-layout="fixed">
                                                                                <fo:table-column column-width="10%"/>
                                                                                <fo:table-column column-width="52%"/>
                                                                                <fo:table-column column-width="6%"/>
                                                                                <fo:table-column column-width="22%"/>
                                                                                <fo:table-column column-width="10%"/>
                                                                                <fo:table-body>
                                                                                    <fo:table-row>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block font-style="italic"
                                                                                                    font-size="8pt"
                                                                                                    text-align="center"
                                                                                                    display-align="after"
                                                                                                    margin-top="0mm">
                                                                                                <xsl:value-of select="birthdate" />
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block></fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block font-size="8pt"
                                                                                                      font-weight="normal"
                                                                                                      display-align="after"
                                                                                                      margin-top="0mm">
                                                                                                <xsl:value-of select="gender" />
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                    </fo:table-row>
                                                                                    <fo:table-row>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block font-style="italic"
                                                                                                    font-size="5pt"
                                                                                                    text-align="left"
                                                                                                    display-align="after"
                                                                                                    margin-top="0mm"
                                                                                                    border-top-color="black"
                                                                                                    border-top-style="dotted"
                                                                                                    border-top-width="1pt">
                                                                                                    Birthdate
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block></fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block font-style="italic"
                                                                                                    font-size="5pt"
                                                                                                    text-align="left"
                                                                                                    display-align="after"
                                                                                                    margin-top="0mm"
                                                                                                    border-top-color="black"
                                                                                                    border-top-style="dotted"
                                                                                                    border-top-width="1pt">
                                                                                                    Gender
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                    </fo:table-row>
                                                                                </fo:table-body>
                                                                            </fo:table>
                                                                        </fo:block>
                                                                        <fo:block color="(#4c4c4c)" font-weight="bold" >
                                                                            <fo:table table-layout="fixed">
                                                                                <fo:table-column column-width="10%"/>
                                                                                <fo:table-column column-width="80%"/>
                                                                                <fo:table-column column-width="10%"/>
                                                                                <fo:table-body>
                                                                                    <fo:table-row>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block color="black"
                                                                                                    font-size="8pt"
                                                                                                    text-align="center"
                                                                                                    display-align="after"
                                                                                                    margin-top="0mm"
                                                                                                    border-top-color="black"
                                                                                                    border-top-style="dotted"
                                                                                                    border-top-width="1pt">
                                                                                                    <xsl:value-of select="location"/>
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                    </fo:table-row>
                                                                                    <fo:table-row>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block font-style="italic"
                                                                                                    font-size="5pt"
                                                                                                    text-align="left"
                                                                                                    display-align="after"
                                                                                                    margin-top="0mm"
                                                                                                    border-top-color="black"
                                                                                                    border-top-style="dotted"
                                                                                                    border-top-width="1pt">
                                                                                                    Location
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                    </fo:table-row>
                                                                                    <fo:table-row>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block color="black"
                                                                                                    font-size="8pt"
                                                                                                    text-align="center"
                                                                                                    display-align="after"
                                                                                                    margin-top="0mm"
                                                                                                    border-top-color="black"
                                                                                                    border-top-style="dotted"
                                                                                                    border-top-width="1pt">
                                                                                                    <xsl:value-of select="subLocation"/>
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                    </fo:table-row>
                                                                                    <fo:table-row>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block font-style="italic"
                                                                                                    font-size="5pt"
                                                                                                    text-align="left"
                                                                                                    display-align="after"
                                                                                                    margin-top="0mm"
                                                                                                    border-top-color="black"
                                                                                                    border-top-style="dotted"
                                                                                                    border-top-width="1pt">
                                                                                                    Sublocation
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                    </fo:table-row>
                                                                                    <fo:table-row>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block color="black"
                                                                                                    font-size="8pt"
                                                                                                    text-align="center"
                                                                                                    display-align="after"
                                                                                                    margin-top="0mm"
                                                                                                    border-top-color="black"
                                                                                                    border-top-style="dotted"
                                                                                                    border-top-width="1pt">
                                                                                                    <xsl:value-of select="phone"/>
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                    </fo:table-row>
                                                                                    <fo:table-row>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block font-style="italic"
                                                                                                    font-size="5pt"
                                                                                                    text-align="left"
                                                                                                    display-align="after"
                                                                                                    margin-top="0mm"
                                                                                                    border-top-color="black"
                                                                                                    border-top-style="dotted"
                                                                                                    border-top-width="1pt">
                                                                                                    Mobile Phone
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                    </fo:table-row>
                                                                                    <fo:table-row>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block color="black"
                                                                                                    font-size="8pt"
                                                                                                    text-align="center"
                                                                                                    display-align="after"
                                                                                                    margin-top="0mm"
                                                                                                    border-top-color="black"
                                                                                                    border-top-style="dotted"
                                                                                                    border-top-width="1pt">
                                                                                                    123-0, 456-0, 78910-1
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell><fo:block/></fo:table-cell>
                                                                                    </fo:table-row>
                                                                                    <fo:table-row>
                                                                                        <fo:table-cell><fo:block></fo:block></fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block font-style="italic"
                                                                                                    font-size="5pt"
                                                                                                    text-align="left"
                                                                                                    display-align="after"
                                                                                                    margin-top="0mm"
                                                                                                    border-top-color="black"
                                                                                                    border-top-style="dotted"
                                                                                                    border-top-width="1pt">
                                                                                                    Previous Medical Identifier(s)
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell><fo:block></fo:block></fo:table-cell>
                                                                                    </fo:table-row>
                                                                                </fo:table-body>
                                                                            </fo:table>
                                                                        </fo:block>
                                                                        -->
                                                                        
                                                                        
                                                                        <fo:block font-size="8pt" font-weight="bold">
                                                                            <fo:table table-layout="fixed">
                                                                                <fo:table-column column-width="30%" />
                                                                                <fo:table-column column-width="30%" />
                                                                                <fo:table-column column-width="12%" />
                                                                                <fo:table-column column-width="28%" />
                                                                                <fo:table-body>
                                                                                    <fo:table-row height="3.5mm">
                                                                                        <fo:table-cell>
                                                                                            <fo:block text-align="right"
                                                                                                    font-style="italic"
                                                                                                    font-size="6pt"
                                                                                                    color="(#4c4c4c)">
                                                                                                Birthdate:
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block text-align="left"
                                                                                                    margin-left="2mm">
                                                                                                <xsl:value-of select="birthdate"/>
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block text-align="right"
                                                                                                    font-style="italic"
                                                                                                    font-size="6pt"
                                                                                                    color="(#4c4c4c)">
                                                                                                Gender:
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block text-align="left"
                                                                                                    margin-left="2mm">
                                                                                                <xsl:value-of select="gender"/>
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                    </fo:table-row>
                                                                                </fo:table-body>
                                                                            </fo:table>
                                                                        </fo:block>
                                                                        <fo:block font-size="8pt" font-weight="bold" display-align="center">
                                                                            <fo:table table-layout="fixed">
                                                                                <fo:table-column column-width="30%"/>
                                                                                <fo:table-column column-width="70%"/>
                                                                                <fo:table-body>
                                                                                    <fo:table-row height="3.5mm">
                                                                                        <fo:table-cell>
                                                                                            <fo:block text-align="right"
                                                                                                    font-style="italic"
                                                                                                    font-size="6pt"
                                                                                                    color="(#4c4c4c)">
                                                                                                Location:
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block text-align="left"
                                                                                                    margin-top="0mm"
                                                                                                    margin-left="2mm">
                                                                                                <xsl:value-of select="location"/>
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                    </fo:table-row>
                                                                                    <fo:table-row>
                                                                                        <fo:table-cell>
                                                                                            <fo:block text-align="right"
                                                                                                    font-style="italic"
                                                                                                    font-size="6pt"
                                                                                                    color="(#4c4c4c)">
                                                                                                Sublocation:
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block text-align="left"
                                                                                                    margin-left="2mm">
                                                                                                <xsl:value-of select="subLocation"/>
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                    </fo:table-row>
                                                                                    <fo:table-row height="3.5mm">
                                                                                        <fo:table-cell>
                                                                                            <fo:block text-align="right"
                                                                                                    font-style="italic"
                                                                                                    font-size="6pt"
                                                                                                    color="(#4c4c4c)">
                                                                                                Mobile Phone:
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block text-align="left"
                                                                                                    margin-left="2mm">
                                                                                                <xsl:value-of select="phone"/>
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                    </fo:table-row>
                                                                                    <fo:table-row height="3.5mm">
                                                                                        <fo:table-cell>
                                                                                            <fo:block text-align="right"
                                                                                                    font-style="italic"
                                                                                                    font-size="6pt"
                                                                                                    color="(#4c4c4c)">
                                                                                                Previous Medical Identifier(s):
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                        <fo:table-cell>
                                                                                            <fo:block text-align="left"
                                                                                                    display-align="after"
                                                                                                    margin-top="2mm"
                                                                                                    margin-left="2mm">
                                                                                                123-0, 456-0, 78910-1
                                                                                            </fo:block>
                                                                                        </fo:table-cell>
                                                                                    </fo:table-row>
                                                                                </fo:table-body>
                                                                            </fo:table>
                                                                        </fo:block>

                                                                        
                                                                    </fo:table-cell>
                                                                </fo:table-row>
                                                            </fo:table-body>
                                                        </fo:table>
                                                    </fo:block>
                                                </fo:block-container>
                                            </fo:block-container>
                                        </fo:block>
                                    </fo:table-cell>
                            </fo:table-row>
                        </xsl:for-each>
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>