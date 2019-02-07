<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    xmlns="http://www.w3.org/1999/xhtml" >
    
    <xsl:output method="html" indent="yes"/>


    <xsl:template match="//tei:title[@type='main']">
        <h1 align="center" style="color: green;">            
            <xsl:value-of select="."/>
        </h1>
    </xsl:template>
    
    <xsl:template match="//tei:respStmt">
        <h5 align="center">            
            <xsl:value-of select="."/>
        </h5>
    </xsl:template>
    
    

    <xsl:template match="//tei:title[@type='sub']">
        <h1 align="center" >            
            <xsl:value-of select="."/>
        </h1>
        <div align="center">
        <img width="200px" height="300px" src="7694-023F.jpg"/>
        <img display="inline" margin-left="50px" width="400px" height="300px" src="7694-023R.jpg" /><br/>
        </div>
    </xsl:template>
    
    <xsl:template match="//tei:title[@type='sud']">
        <h1 align="center">            
            <xsl:value-of select="."/>
        </h1>
        <div align="center">
        <img  width="200px" height="300px" src="7694-060F.jpg" /><img></img>
        <img margin-left="50%" width="400px" height="300px" src="7694-060R.jpg" /><br/>
        </div>
    </xsl:template>


    <xsl:template match="//tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno">
        <br/><strong> Codice identificativo cartolina:</strong> 
        <xsl:value-of select="."/> <br/>
    </xsl:template>
    
    <xsl:template match="//tei:msContents" >
        <p id="msContents"> 
            <h3 style="color:green;">  &#9658; Descrizione Oggetto:  </h3>
            <xsl:value-of select="//tei:msContents/tei:summary"/>
            scritta 
            in <strong><xsl:value-of select="//tei:msContents/tei:textLang"/> </strong>
            il <strong><xsl:value-of select="//tei:bibl/tei:date"/></strong></p>
    </xsl:template> 


    <xsl:template match="//tei:profileDesc"> 
        <th id="AttoCorrispondenza" >
            <h3 style="color:green;"> &#9658; Atto di corrispondenza </h3> 
            
            <li>  cartolina arrivata a <xsl:value-of select="//tei:correspAction[@type='received']/tei:persName" /> </li>
        </th>
    </xsl:template>
    
    <xsl:template match="//tei:sourceDesc/tei:listPerson">
        <table id="persons_involved"> 
            <h3 style="color:green;">&#9658;Persone coinvolte: </h3> 
            <ul>
                <h4>Nome    -    Cognome    - Sesso   - Educazione/Professione</h4>
                <xsl:apply-templates/> 
            </ul>
        </table>
    </xsl:template>
    
    <xsl:template match="//tei:listPerson/tei:person">
        <li>  <xsl:apply-templates/>  </li>  
    </xsl:template>
    
    <xsl:template match="//tei:person/tei:persName">
        <xsl:value-of select="."/> -
        
    </xsl:template>
    
    <xsl:template match="//tei:person/tei:sex">
        <xsl:value-of select="."/>  -
    </xsl:template>
    
    
    <xsl:template match="//tei:person/tei:education">
        <xsl:value-of select="."/>  
    </xsl:template>
   
    
    <xsl:template match="//tei:list">
        <h3 style="color:green;"> &#9658; Interpretazioni Editoriali</h3>       
        <th> 
            <li><xsl:apply-templates/></li>
        </th>
    </xsl:template>

    <xsl:template match="//tei:figDesc">
    </xsl:template>
    <xsl:template match="//tei:text">
    </xsl:template>
    <xsl:template match="//tei:orgName">
    </xsl:template>
    <xsl:template match="//tei:title[@type='custom']">
    </xsl:template>
    <xsl:template match="//tei:listPlace">
    </xsl:template>
    <xsl:template match="//tei:quote">
    </xsl:template>
    <xsl:template match="//tei:edition">        
    </xsl:template>
    <xsl:template match="//tei:publicationStmt">        
    </xsl:template>
    <xsl:template match="//tei:interp">        
    </xsl:template>
    <xsl:template match="//tei:msIdentifier">        
    </xsl:template>
    <xsl:template match="//tei:physDesc">        
    </xsl:template>
    
    
 
    
</xsl:stylesheet>