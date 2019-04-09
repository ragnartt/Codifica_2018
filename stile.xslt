<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
        <head>
            <title>
                <xsl:value-of select="//tei:title[@xml:id = 'titleCorpus']"/>
            </title>
            <link href="mycss.css" rel="stylesheet" type="text/css"/>
            <link href="https://fonts.googleapis.com/css?family=Playfair+Display"
                rel="stylesheet"/>
            <link href="https://fonts.googleapis.com/css?family=Homemade+Apple" rel="stylesheet"/>
            <link rel="icon" href="images/postcard.svg"/>
            
        </head>
            <body>
                <header>
                    <h1>
                        <xsl:value-of select="//tei:title[@xml:id = 'titolo_corpus']"/>
                    </h1>
                </header>
        
                <div class="resp_progetto">
                    <table id="resp">
                        <xsl:for-each select="tei:teiCorpus/tei:teiHeader[1]//tei:editionStmt/tei:respStmt">
                            
                                <th>
                                  <p> 
                                    <xsl:value-of select="current()//tei:resp"/>
                                  </p>
                                </th>
                                
                                <xsl:for-each select="current()//tei:name">
                                    <td>
                                        <xsl:value-of select="current()"/>
                                    </td>
                                </xsl:for-each>
                            
                        </xsl:for-each>
                    </table>
                </div>
                
                <div class="jpgContainer">
                    <xsl:for-each select="current()//tei:surface">
                        
                        <xsl:choose>
                            <xsl:when test="tei:graphic[starts-with(@n, 'imgR')]">
                                
                                <img>
                                    <xsl:attribute name="usemap">
                                        <xsl:value-of select="concat('#', substring(tei:graphic/@n, 5), 'map')"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="tei:graphic/@url"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="id">
                                        <xsl:value-of select="concat(tei:graphic/@xml:id, tei:graphic/@n)"/>
                                    </xsl:attribute>
                                </img>
                                <map>
                                    <xsl:attribute name="name">
                                        <xsl:value-of select="concat(substring(tei:graphic/@n, 5), 'map')"/>
                                    </xsl:attribute>
                                    <xsl:for-each select="current()//tei:zone">
                                        <area shape="rect">
                                            <xsl:attribute name="coords">
                                                <xsl:value-of select="concat(@ulx, ',', @uly, ',', @lrx, ',', @lry)"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="class">
                                                <xsl:value-of select="current()/@xml:id"/>
                                            </xsl:attribute>
                                        </area>
                                    </xsl:for-each>
                                </map>
                                
                            </xsl:when>
                            <xsl:otherwise>
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="tei:graphic/@url"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="id">
                                        <xsl:value-of select="tei:graphic/@n"/>
                                    </xsl:attribute>
                                </img>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </div>

                <div class="textContainer">
                    <p class="test">
                    <xsl:for-each select="current()//tei:text/tei:body/tei:div">
                        <xsl:choose>
                            <xsl:when test="current()//attribute::type = 'fronte'">
                                <div>
                                    <xsl:attribute name="id">
                                        <xsl:value-of select="concat('divF', ancestor::node()/@n)"/>
                                    </xsl:attribute>
                                    <header>
                                    <h2>Fronte</h2>
                                    </header>
                                    <p>
                                        <b>Descrizione immagine: </b>
                                        <xsl:apply-templates select="current()//tei:figDesc"/>
                                    </p>
                                    <xsl:if test="current()//tei:note">
                                        <p>
                                            <b>Note: </b>
                                            <xsl:apply-templates select="current()//tei:note"/>
                                        </p>
                                    </xsl:if>
                                </div>
                            </xsl:when>
                            <xsl:when test="current()//attribute::type = 'retro'">
                                <div class="secondo">
                                    <xsl:attribute name="id">
                                        <xsl:value-of select="concat('divR', ancestor::node()/@n)"/><br/>
                                    </xsl:attribute>
                                    
                                    <h3>Retro</h3>
                                    
                                    <xsl:apply-templates/><br/>
                                
                                </div>
                                
                            </xsl:when>
                        
                        </xsl:choose>
                    
                    </xsl:for-each>
           

                    </p>
                </div>
                
               
                
            </body>
        </html>
    </xsl:template>

   
</xsl:stylesheet>