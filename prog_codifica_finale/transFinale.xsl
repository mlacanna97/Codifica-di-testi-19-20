<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:output method="html"/> 
    
    <xsl:template match="/">
        <html>

            <head>
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <script src="http://code.jquery.com/jquery-1.6.4.min.js" type="text/javascript"></script>
                <script type="text/javascript" src="evidenzia.js"></script>
                <script type="text/javascript" src="scrollCartoline.js"></script>
                <title>
                    Project Encoding Text
                </title>
            </head>
            <body>
				<div id="navbar">
					<h1>Encoding Text Project</h1>
					<h2>19-20</h2>
				</div>
				    <xsl:element name="div">
							<xsl:attribute name="class">titolo</xsl:attribute>
							<h1>
								<xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='titleCorpus']" />	
							</h1>
					</xsl:element>
					<div class="intro">
						<p>
                            In questo sito è presentata la codifica digitale di due cartoline provenienti dal <i><xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository"/></i>
							di <xsl:value-of select="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement"/> e si connette ad un progetto realizzato dal <xsl:value-of select = "//tei:publicationStmt/tei:address/tei:addrLine"/>.
							Entrambe le cartoline sono state spedite da <xsl:value-of select="//tei:sourceDesc/tei:listPerson/tei:person[@n='GC']/tei:persName" /> e ricevute da <xsl:value-of select="//tei:sourceDesc/tei:listPerson/tei:person[@n='OT']/tei:persName" />
                            <br />
                            
						</p>
					</div>
					
                    
                    <!-- TEMPLATE PER LE DESCRIZIONI DEL FRONTE -->
                   
						
                        <xsl:apply-templates select="//tei:teiCorpus/tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl" />
                        <xsl:apply-templates select="//tei:noteStmt" />

                        <xsl:apply-templates select="//tei:teiCorpus/tei:TEI/tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date" />
                    
                     <div class="wrapper">
                   
					  <div id="imgCart224">
            		    <button type="button" id="bottone_fronte1">Cambia visualizzazione</button>
						<xsl:apply-templates select="//tei:facsimile/tei:surface[@n = 2]" />
						<xsl:apply-templates select="//tei:facsimile/tei:surface[@n = 1]" />
					 </div>
					  <div id="cart224">                        
						<p id="opener"><xsl:apply-templates select="//tei:div[@type='left']/tei:opener/tei:placeName/tei:settlement/tei:span"/>
						<xsl:apply-templates select="//tei:div[@type='left']/tei:opener/tei:date/tei:span"/>	</p>					
						<xsl:apply-templates select="//tei:div[@type='left']/tei:p/tei:span"/>
						<xsl:apply-templates select="//tei:div[@type='left']/tei:closer/tei:salute/tei:span"/>
						<xsl:apply-templates select="//tei:div[@type='left']/tei:closer/tei:signed/tei:span"/>
					  </div>
					  <div id="pDX">
						<xsl:apply-templates select="//tei:div[@type = 'fronte']/tei:figure/tei:figDesc[@n='figDesc1']"/>
						<br></br><strong>Identificativo cartolina:</strong><xsl:apply-templates select="//tei:idno[@type='i224']" />
						<p id="nota224"><br></br><strong>Nota: </strong><xsl:apply-templates select="//tei:note[@n='note224']" /></p><br></br>
						<p id="nota918"><strong>Elemento tipografico: </strong><xsl:apply-templates select="//tei:stamp[@n='note918']" /></p><br></br>
					  	<strong>Compilatore: </strong><xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt/tei:name[@ref='#TC']"/>
				  		<br></br>
					  	<strong>Responsabile scientifico: </strong><xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt[@n='respS']/tei:name"/>
						<br></br>
					  	<strong>Funzionario responsabile: </strong><xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt[@n='funzR']/tei:name"/>
						<br></br>
						<xsl:apply-templates select="//tei:stamp[@type = 'postage224']" />
						<xsl:apply-templates select="//tei:stamp[@type = 'postmark224']" />
						<br></br>
						<p id="abbr224"><strong>Abbreviazioni: </strong><xsl:apply-templates select="//tei:ab[@n='ind224']/tei:address/tei:addrLine/tei:choice" /></p>
						<p id="dest224"><strong>Destinatario: </strong><xsl:apply-templates select="//tei:ab[@n='ind224']/tei:address/tei:addrLine[@n='dest']/tei:persName" /></p>
						<p id="indirizzo224"><strong>Indirizzo: </strong><xsl:apply-templates select="//tei:ab[@n='ind224']/tei:address/tei:addrLine[@n='via']" /></p>
					    <p id="citta224"><strong>Città: </strong><u><xsl:apply-templates select="//tei:ab[@n='ind224']/tei:address/tei:addrLine[@n='rv']/tei:hi" /></u></p>

					 </div>
					</div>
					<div class="wrapper">
					  <div id="imgCart227">
                        <button type="button" id="bottone_fronte2">Cambia visualizzazione</button>
						<xsl:apply-templates select="//tei:facsimile/tei:surface[@n = 4]" />
						<xsl:apply-templates select="//tei:facsimile/tei:surface[@n = 3]" />
					  </div>
					  <div id="cart227">
                        <xsl:apply-templates select="//tei:div[@type='right']/tei:opener/tei:placeName/tei:settlement/tei:span"/>
						<xsl:apply-templates select="//tei:div[@type='right']/tei:opener/tei:date/tei:span"/>
						<xsl:apply-templates select="//tei:div[@type='right']/tei:p/tei:span"/>
						<xsl:apply-templates select="//tei:div[@type='right']/tei:closer/tei:salute/tei:span"/>
						<u><xsl:apply-templates select="//tei:div[@type='right']/tei:closer/tei:signed/tei:span"/></u>
                      </div>
                      <div id="p2DX">
						  	  <xsl:apply-templates select="//tei:div[@type = 'fronte']/tei:figure/tei:figDesc[@n='figDesc2']"/>
							  <br></br><strong>Identificativo cartolina:</strong><xsl:apply-templates select="//tei:idno[@type='i227']" />
					  		  <br></br>
							  <br></br><p id="nota227"><strong>Nota:</strong><xsl:apply-templates select="//tei:note[@n='note227']" /></p>
					  		  <strong>Compilatore: </strong><xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt/tei:name[@ref='#TC']"/>
				  			  <br></br>
					  		  <strong>Responsabile scientifico: </strong><xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt[@n='respS']/tei:name"/>
							  <br></br>
					  		  <strong>Funzionario responsabile: </strong><xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt[@n='funzR']/tei:name"/>
							  <br></br>
							  <xsl:apply-templates select="//tei:stamp[@type = 'postage227']" />
							  <xsl:apply-templates select="//tei:stamp[@type = 'postmark227']" />
							  <strong>IICI: </strong><xsl:apply-templates select="//tei:note[@type='iici']" />  
							  <p id="abbr227"><strong>Abbreviazioni: </strong> <xsl:apply-templates select="//tei:ab[@n='ind224']/tei:address/tei:addrLine/tei:choice" /></p>							  	
							  <p id="dest227"><strong>Destinatario: </strong> <xsl:apply-templates select="//tei:ab[@n='ind224']/tei:address/tei:addrLine[@n='dest']/tei:persName" /></p>
							  <p id="indirizzo227"><strong>Indirizzo: </strong> <xsl:apply-templates select="//tei:ab[@n='ind224']/tei:address/tei:addrLine[@n='via']" /></p>
							  <p id="citta227"><strong>Città: </strong> <u><xsl:apply-templates select="//tei:ab[@n='ind224']/tei:address/tei:addrLine[@n='rv']/tei:hi[@rend = 'underline']" /></u></p>
					</div>
                </div>
                 <div id="footer">
							<xsl:apply-templates select ="//tei:name[@type = 'msl']" /> 
				 </div> 
            </body>
        </html>
        
    </xsl:template>
    
     <xsl:template match="//tei:facsimile/tei:surface[@n = 1]">   
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="tei:graphic/@url" />
                </xsl:attribute>
                <xsl:attribute name="class">retro</xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="'Retro_'" />
                    <xsl:number level="any" />
                </xsl:attribute>
                <xsl:attribute name="usemap">
                    <xsl:value-of select="concat('#image-map', position())" />
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="map">
                <xsl:attribute name="name">
                    <xsl:value-of select="concat('#image-map', position())" />
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id" />
                </xsl:attribute>
                <xsl:for-each select="tei:zone">
                    <xsl:element name="area">
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id" />
                        </xsl:attribute>
                        <xsl:attribute name="class">area</xsl:attribute>
                        <xsl:attribute name="coords">
                            <xsl:value-of select="@ulx" />,<xsl:value-of select="@uly" />,<xsl:value-of select="@lrx" />,<xsl:value-of select="@lry" /></xsl:attribute>
                        <xsl:attribute name="shape">rect</xsl:attribute>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
    </xsl:template>
     <xsl:template match="//tei:facsimile/tei:surface[@n = 3]">   
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="tei:graphic/@url" />
                </xsl:attribute>
                <xsl:attribute name="class">retro</xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="'Retro_'" />
                    <xsl:number level="any" />
                </xsl:attribute>
                <xsl:attribute name="usemap">
                    <xsl:value-of select="concat('#image-map2', position())" />
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="map">
                <xsl:attribute name="name">
                    <xsl:value-of select="concat('#image-map2', position())" />
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id" />
                </xsl:attribute>
                <xsl:for-each select="tei:zone">
                    <xsl:element name="area">
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id" />
                        </xsl:attribute>
                        <xsl:attribute name="class">area</xsl:attribute>
                        <xsl:attribute name="coords">
                            <xsl:value-of select="@ulx" />,<xsl:value-of select="@uly" />,<xsl:value-of select="@lrx" />,<xsl:value-of select="@lry" /></xsl:attribute>
                        <xsl:attribute name="shape">rect</xsl:attribute>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
     
    </xsl:template>
    
    <xsl:template match="//tei:facsimile/tei:surface[@n = 2]">     
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="tei:graphic/@url" />
                </xsl:attribute>
                <xsl:attribute name="class">retro</xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="'Retro_'" />
                    <xsl:number level="any" />
                </xsl:attribute>
            </xsl:element>
    </xsl:template>
        <xsl:template match="//tei:facsimile/tei:surface[@n = 4]">     
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="tei:graphic/@url" />
                </xsl:attribute>
                <xsl:attribute name="class">retro</xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="'Retro_'" />
                    <xsl:number level="any" />
                </xsl:attribute>
            </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:note[@type='iici']">
        <xsl:element name="p">
            <xsl:attribute name="id">
                <xsl:value-of select="concat('iici', position())" />
            </xsl:attribute>   
            <xsl:apply-templates/> 
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template match="//tei:note[@type='note918']">
        <xsl:element name="p">
            <xsl:attribute name="id">
                <xsl:value-of select="concat('note918', position())" />
            </xsl:attribute>   
            <xsl:apply-templates/> 
        </xsl:element>
    </xsl:template>
    
     <xsl:template match="//tei:idno[@type='i224']">
        <xsl:element name="p">
            <xsl:attribute name="id">
				<xsl:value-of select="concat('idno', '1')" />
            </xsl:attribute>
           <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
     <xsl:template match="//tei:idno[@type='i227']">
        <xsl:element name="p">
            <xsl:attribute name="id">
				<xsl:value-of select="concat('idno', '2')" />
            </xsl:attribute>
           <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
 
    
    <xsl:template match="//tei:teiCorpus/tei:TEI/tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction/tei:date[@type='writing']">
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="(position() = 1)">prima</xsl:when>
                    <xsl:when test="(position() = 2)">seconda</xsl:when>

                </xsl:choose>
            </xsl:attribute>
            <strong>Data di invio della cartolina: </strong>
            <xsl:value-of select="." />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:listPerson">
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="(position() = 1)">prima</xsl:when>
                    <xsl:when test="(position() = 2)">seconda</xsl:when>
                </xsl:choose>
            </xsl:attribute>
            <xsl:for-each select="tei:person[1]/tei:persName">
                <strong>Mittente: </strong>
                <xsl:value-of select="." />
            </xsl:for-each>
            <br />
            <xsl:for-each select="tei:person[2]/tei:persName">
                <strong>Destinatario: </strong>
                <xsl:value-of select="." />
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
       <!-- TEMPLATE PER LA TRASCRIZIONE DEL TESTO NEL RETRO-->
    <xsl:template match="//tei:div[@type='left']/tei:p/tei:span">
        <br />
        <xsl:element name="p">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs, '#', 'p')" />
            </xsl:attribute>     
            <xsl:value-of select="current()" />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='left']/tei:opener/tei:placeName/tei:settlement/tei:span">
        <br />
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:value-of select="translate(@facs, '.', 'p')" />
            </xsl:attribute>  
            <xsl:value-of select="current()" />   
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type='left']/tei:opener/tei:date/tei:span">
        <br />
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:value-of select="translate(@facs, '.', 'p')" />
            </xsl:attribute>   
            <xsl:value-of select="current()" />  
        </xsl:element>
    </xsl:template>
    <xsl:template match="//tei:div[@type='left']/tei:closer/tei:salute/tei:span">
        <br />
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:value-of select="translate(@facs, '.', 'p')" />
            </xsl:attribute>  
            <xsl:value-of select="current()" />   
        </xsl:element>
    </xsl:template>
        <xsl:template match="//tei:div[@type='left']/tei:closer/tei:signed/tei:span">
        <br />
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:value-of select="translate(@facs, '.', 'p')" />
            </xsl:attribute>     
            <xsl:value-of select="current()" />
        </xsl:element>
    </xsl:template>
    
        <xsl:template match="//tei:div[@type='right']/tei:p/tei:span">
        <br />
        <xsl:element name="p">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs, '#', 'p')" />
            </xsl:attribute>  
            <xsl:value-of select="current()" />   
        </xsl:element>
    </xsl:template>
    <xsl:template match="//tei:div[@type='right']/tei:opener/tei:placeName/tei:settlement/tei:span">
        <br />
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:value-of select="translate(@facs, '.', 'p')" />
            </xsl:attribute>
            <xsl:value-of select="current()" />     
        </xsl:element>
    </xsl:template>
    <xsl:template match="//tei:div[@type='right']/tei:opener/tei:date/tei:span">
        <br />
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:value-of select="translate(@facs, '.', 'p')" />
            </xsl:attribute>   
            <xsl:value-of select="current()" />  
        </xsl:element>
    </xsl:template>
    <xsl:template match="//tei:div[@type='right']/tei:closer/tei:salute/tei:span">
        <br />
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:value-of select="translate(@facs, '.', 'p')" />
            </xsl:attribute>  
            <xsl:value-of select="current()" />   
        </xsl:element>
    </xsl:template>
        <xsl:template match="//tei:div[@type='right']/tei:closer/tei:signed/tei:span">
        <br />
        <xsl:element name="p">
            <xsl:attribute name="class">
                <xsl:value-of select="translate(@facs, '.', 'p')" />
            </xsl:attribute>   
            <xsl:value-of select="current()" />  
        </xsl:element>
    </xsl:template>
    
     <xsl:template match="//tei:div[@type = 'fronte']/tei:figure/tei:figDesc[@n='figDesc1']">
        <xsl:element name="div">
            <xsl:attribute name="id">
				
                <xsl:value-of select="concat('descrizione_testo', position())" />
                
            </xsl:attribute>
            <br></br><strong>Dimensione: </strong><xsl:value-of select="//tei:height[@n='h224']" />cm x <xsl:value-of select="//tei:width[@n='w224']" />cm<br></br> <strong>Stato: </strong><xsl:value-of select="//tei:condition[@n='con']" /><br></br><strong>Materiale: </strong><xsl:value-of select="//tei:material[@n='mat']" />
			<br></br>
			<strong>Descrizione immagine:</strong>
            <xsl:apply-templates />
        </xsl:element>
        
    </xsl:template>
        <xsl:template match="//tei:div[@type = 'fronte']/tei:figure/tei:figDesc[@n='figDesc2']">
		
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="'descrizione_testo2'" />
                
            </xsl:attribute>
            <br></br><strong>Dimensione: </strong><xsl:value-of select="//tei:height[@n='h224']" />cm x <xsl:value-of select="//tei:width[@n='w224']" />cm<br></br><strong>Stato:</strong> <xsl:value-of select="//tei:condition[@n='con']" /><br></br><strong>Materiale: </strong><xsl:value-of select="//tei:material[@n='mat']" />
			<br></br>
			Descrizione immagine:
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:div[@type = 'left']">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="concat('trascrizione_testo', position())" />
            </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
     <xsl:template match="//tei:div[@type = 'right']">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="concat('trascrizione_testo', position())" />
            </xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:salute">
        <xsl:element name = "p">
            <xsl:attribute name="id">
                <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <i>
                <xsl:value-of select="." />
            </i>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="//tei:address">
        <address id = "cart_3">
            <xsl:apply-templates />
        </address>
    </xsl:template>
    
    <xsl:template match="//tei:closer">
        <p>
            <i>
                <xsl:apply-templates />
            </i>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:stamp[@type = 'postage224']">
        <p id="francobollo224">
            <strong>
            Francobollo:
            </strong>
            <xsl:apply-templates />
        </p>
    </xsl:template>
    
    <xsl:template match="tei:stamp[@type = 'postmark224']">
        <p id="timbro224">
            <strong>
            Timbro:
        </strong>
            <xsl:apply-templates />
        </p>
    </xsl:template>
        <xsl:template match="tei:stamp[@type = 'postage227']">
        <p id="francobollo227">
            <strong>
            Francobollo:
            </strong>
            <xsl:apply-templates />
        </p>
    </xsl:template>
    
    <xsl:template match="tei:stamp[@type = 'postmark227']">
        <p id="timbro227">
            <strong>
            Timbro:
        </strong>
            <xsl:apply-templates />
        </p>
    </xsl:template>
 
 <!-- TEMPLATE PER IL FOOTER -->
    <xsl:template match = "//tei:name[@type = 'msl']">
        <div id = "about">
            <h3>Studente:</h3>
            <p>
				 <xsl:value-of select="//tei:name[@type = 'msl']"/>
            </p>
            <h3>Matricola: 559326</h3>
        </div>
        
    </xsl:template>
</xsl:stylesheet>
