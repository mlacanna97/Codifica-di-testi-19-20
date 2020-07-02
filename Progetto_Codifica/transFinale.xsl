<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="//tei:title[@xml:id = 'titleCorpus']"/>
                </title>
                <link href="style.css" rel="stylesheet" type="text/css"/>
                <script src="scrollCartoline.js"/>
                <script src="evidenzia.js"/>
            </head>
            
            <body>
              <div id="home">
                  <h1 class="hero-text" style="font-size:40px">Encoding Text</h1>
                  <h2 class="hero-text" style="font-size:20px">Progetto di codifica di testi 2020</h2>
              </div>
              <xsl:element name="grid-container">
                  <xsl:attribute name="id">p1R</xsl:attribute>
                  <xsl:for-each select="//tei:TEI">
                      <section>
                          <xsl:attribute name="id">
                              <xsl:value-of select="current()/@n"/>
                          </xsl:attribute>
                          <h1>
                              <xsl:value-of
                                  select="current()/tei:teiHeader//tei:titleStmt/tei:title"/>
                          </h1>
                          <!-- div per le immagini del fronte e del retro delle cartoline -->
                          <div class="img">
                              <xsl:for-each select="current()//tei:surface">
  
                                  <xsl:choose>
                                      <xsl:when test="tei:graphic[starts-with(@n, 'risultato1')]">
  
                                          <img>
                                              <xsl:attribute name="usemap">
                                                <xsl:value-of
                                                select="concat('#', substring(tei:graphic/@n, 5), 'map')"
                                                />
                                              </xsl:attribute>
                                              <xsl:attribute name="src">
                                                <xsl:value-of select="tei:graphic/@url"/>
                                              </xsl:attribute>
                                              <xsl:attribute name="id">
                                                <xsl:value-of
                                                select="concat(tei:graphic/@xml:id, tei:graphic/@n)"
                                                />
                                              </xsl:attribute>
                                          </img>
                                          <map>
                                              <xsl:attribute name="name">
                                                <xsl:value-of
                                                select="concat(substring(tei:graphic/@n, 5), 'map')"
                                                />
                                              </xsl:attribute>
                                              <xsl:for-each select="current()//tei:zone">
                                                <area shape="rect">
                                                <xsl:attribute name="coords">
                                                <xsl:value-of
                                                select="concat(@ulx, ',', @uly, ',', @lrx, ',', @lry)"
                                                />
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
  
                          <!--  Viene creato il div contenente le trascrizioni delle cartoline -->
                          <div class="letter">
                              <xsl:for-each select="current()//tei:text/tei:body/tei:div">
                                  <xsl:choose>
                                      <xsl:when test="current()//attribute::type = 'p1R'">
                                          <div>
                                              <xsl:attribute name="id">
                                                <xsl:value-of
                                                select="concat('letter', ancestor::node()/@n)"/>
                                              </xsl:attribute>
                                              <h1>fronte</h1>
                                              <p>
                                                <b>Descrizione immagine: </b>
                                                <xsl:apply-templates
                                                select="current()//tei:figDesc"/>
                                              </p>
                                              <xsl:if test="current()//tei:note">
                                                <p>
                                                <b>Note: </b>
                                                <xsl:apply-templates select="current()//tei:note"
                                                />
                                                </p>
                                              </xsl:if>
                                          </div>
                                      </xsl:when>
                                      <xsl:when test="current()//attribute::type = 'right'">
                                          
                                                <xsl:value-of select="concat('img', ancestor::node()/@n)"/>
                                              <h1>retro</h1>
                                              <xsl:apply-templates/>
                                
                                      </xsl:when>
                                  </xsl:choose>
                              </xsl:for-each>
                          </div>
                          <!-- Applicazione del template per sourceDesc relativo a ogni cartolina-->
                          <xsl:apply-templates select="current()/tei:teiHeader//tei:sourceDesc"/>
  
                      </section>
                  </xsl:for-each>
              </xsl:element>
            <footer>
              <h1>Studente Mattia Sebastiano Lacanna</h1>
              <h1>Matricola: 559326</h1>
            </footer>
          </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'p1R']">
        <div class="sinistra">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- Template per opener-->
    <xsl:template match="tei:div[@type = 'p1R']/tei:opener">
        <div class="inizio">
            <span>
                <xsl:attribute name="class">
                    <xsl:value-of select="substring(current()/child::tei:lb/@facs, 2)"/>
                </xsl:attribute>
                <xsl:value-of select="current()//tei:salute | current()//tei:dateline"/>
            </span>
        </div>
    </xsl:template>
    
    <!-- Template per p-->
    <xsl:template match="tei:div[@type = 'p1R']//tei:p">
        <div class="corpoLettera">
            <xsl:apply-templates select="tei:lb"/>
        </div>
    </xsl:template>
    
    <!-- Template per closer-->
    <xsl:template match="tei:closer">
        <div class="chiusura">
            <xsl:apply-templates select="tei:salute | tei:signed"/>
            <xsl:apply-templates select="tei:lb[last()]"/>
            <span>
                <xsl:attribute name="class">
                    <xsl:value-of select="substring(child::tei:lb/@facs, 2)"/>
                </xsl:attribute>
                <xsl:apply-templates select="tei:addName" />
            </span>
        </div>
    </xsl:template>
    
    <!-- Template per salute -->
    <xsl:template match="tei:salute">
        <xsl:apply-templates select="tei:lb"/>
    </xsl:template>
    
    <!-- Template per signed-->
    <xsl:template match="tei:signed">
        <xsl:choose>
            <xsl:when test="./tei:hi">
                <span>
                    <xsl:attribute name="class">
                        <xsl:value-of select="substring(preceding::tei:lb[1]/@facs, 2)"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="tei:hi"/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span>
                    <xsl:attribute name="class">
                        <xsl:value-of select="substring(child::tei:lb/@facs, 2)"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="tei:choice"/>
                </span>
                <span>
                    <xsl:attribute name="class">
                        <xsl:value-of select="substring(child::tei:lb[2]/@facs, 2)"/>
                    </xsl:attribute>
                    <xsl:apply-templates select="tei:persName"/>
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'destination']">
        <div class="destination">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:div[@type = 'destination']//tei:ab">
        <xsl:choose>
            <xsl:when test="current()//child::tei:lb">
                <div class="destination">
                    <h3>Destinatario:</h3>
                    <xsl:for-each select="current()//child::tei:lb">
                        <span>
                            <xsl:attribute name="class">
                                <xsl:value-of select="substring(@facs, 2)"/>
                            </xsl:attribute>
                            <xsl:apply-templates
                                select="current()/following-sibling::tei:addrLine[position() = 1]"/>
                        </span>
                    </xsl:for-each>
                </div>
            </xsl:when>
            <xsl:when test="current()//child::tei:stamp">
                <div class="stampe">
                    <xsl:for-each select="current()//child::tei:stamp">
                        <span>
                            <xsl:attribute name="class">
                                <xsl:value-of select="concat(substring(@facs, 2), ' hs')"/>
                            </xsl:attribute>
                            <xsl:apply-templates/>
                        </span>
                    </xsl:for-each>
                </div>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- Template per lb -->
    <xsl:template match="tei:lb">
        <span>
            <xsl:attribute name="class">
                <xsl:value-of select="substring(@facs, 2)"/>
            </xsl:attribute>
            <xsl:value-of select="following-sibling::node()"/>
        </span>
    </xsl:template>

    
    <!-- Template per placeName -->
    <xsl:template match="tei:placeName">
        <xsl:value-of select="current()"/>
    </xsl:template>

    <!-- Template per date -->
    <xsl:template match="tei:date">
        <xsl:value-of select="current()"/>
    </xsl:template>

    <!-- Template per addName -->
    <xsl:template match="tei:addName">
        
        <xsl:value-of select="current()"/>
    </xsl:template>

    <!-- Template per persName -->
    <xsl:template match="tei:persName">
        <xsl:value-of select="current()"/>
    </xsl:template>

    <!-- Template per addrLine -->
    <xsl:template match="tei:addrLine">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    
    <!-- Template orgName-->
    <xsl:template match="tei:orgName">
        <xsl:choose>
            <xsl:when test="@xml:id = 'MGP' or @ref = '#MGP'">
                <a href="https://it.wikipedia.org/wiki/Museo_civico_etnografico_Giovanni_Podenzana"
                    target="_blank">
                    <xsl:value-of select="descendant-or-self::node()"/>
                </a>
            </xsl:when>
            <xsl:when test="@xml:id = 'UNIPI' or @ref = '#UNIPI'">
                <a href="https://www.unipi.it" target="_blank">
                    <xsl:value-of select="descendant-or-self::node()"/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Template hi-->
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend = 'underline'">
                <u>
                    <xsl:apply-templates/>
                </u>
            </xsl:when>
            <xsl:when test="@rend = 'uppercase'">
                <p style="text-transform: uppercase;">
                    <xsl:apply-templates/>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Template per choice-->
    <xsl:template match="tei:choice">
        <abbr>
            <xsl:attribute name="title">
                <xsl:value-of select="tei:expan"/>
            </xsl:attribute>
            <xsl:apply-templates select="tei:abbr"/>
        </abbr>
    </xsl:template>
    
    <!-- Template per ab dentro div @remaining  -->
    <xsl:template match="tei:div[@type = 'remaining']">
        <div class="remaining">
            <h6>Tipografia e altre stampe:</h6>
            <xsl:for-each select="current()/tei:ab">
                <span>
                    <xsl:attribute name="class">
                        <xsl:value-of select="substring(current()/child::tei:stamp/@facs, 2)"/>
                    </xsl:attribute> * <b><xsl:value-of select="current()//tei:stamp"/></b> ->
                        <xsl:value-of select="current()//tei:note"/>
                </span>
            </xsl:for-each>
        </div>
    </xsl:template>
    
    <!-- Template per sourceDesc-->
    <xsl:template match="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc">
        <div>
            <ul id="list">
                <li>
                    <b>Titolo: </b>
                    <xsl:value-of select="tei:bibl/tei:title"/>
                </li>
                <li>
                    <b>Codice identificativo: </b>
                    <xsl:value-of select="tei:msDesc/tei:msIdentifier/tei:idno"/>
                </li>
                <li>
                    <b>Tipologia: </b>
                    <xsl:value-of select="tei:msDesc/tei:msContents/tei:summary"/>
                </li>
                <li>
                    <b>Materiale: </b>
                    <xsl:value-of select="tei:msDesc/tei:physDesc//tei:material"/>
                </li>
                <li><b>Dimensioni: </b>
                    <xsl:value-of select="tei:msDesc/tei:physDesc//tei:dimensions/tei:height"/> x
                    <xsl:value-of select="tei:msDesc/tei:physDesc//tei:dimensions/tei:width"/>
                    cm</li>
            </ul>
        </div>
    </xsl:template>
    
    
</xsl:stylesheet>
