<!DOCTYPE stylesheet [<!ENTITY nbsp "&#160;" >]>

<xsl:stylesheet version="1.0"
  xmlns:marc="http://www.loc.gov/MARC21/slim"
  xmlns:items="http://www.koha-community.org/items"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="marc items">

<xsl:import href="UNIMARCslimUtils.xsl"/>
<xsl:output method = "html" indent="yes" omit-xml-declaration = "yes" encoding="UTF-8"/>
<xsl:template match="/">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="marc:record">
<xsl:variable name="Show856uAsImage" select="marc:sysprefs/marc:syspref[@name='Display856uAsImage']"/>
<xsl:variable name="leader" select="marc:leader"/>
<xsl:variable name="leader6" select="substring($leader,7,1)"/>
<xsl:variable name="leader7" select="substring($leader,8,1)"/>
<xsl:variable name="biblionumber" select="marc:controlfield[@tag=001]"/>
<xsl:variable name="champ_610" select="marc:datafield[@tag=610]/marc:subfield[@code='a']"/>
<xsl:variable name="ppn" select="marc:controlfield[@tag=009]"/>
<xsl:variable name="coverCD" select="marc:datafield[@tag=933]/marc:subfield[@code='a']"/>
<xsl:variable name="type_doc" select="marc:datafield[@tag=099]/marc:subfield[@code='t']"/>
<xsl:variable name="renvoi" select="marc:datafield[@tag=700]/@ind1"/>
 <xsl:variable name="perio" select="marc:datafield[@tag=099]/marc:subfield[@code='s']"/>

<div id="intranetxslt">

<xsl:if test="marc:datafield[@tag=200]">
<xsl:for-each select="marc:datafield[@tag=200]">
<h1>
<xsl:call-template name="addClassRtl" />
<xsl:variable name="title" select="marc:subfield[@code='a']"/>
<xsl:variable name="ntitle"
select="translate($title, '&#x0098;&#x009C;&#xC29C;&#xC29B;&#xC298;&#xC288;&#xC289;','')"/>
 <xsl:value-of select="marc:subfield[@code='a'][1]" />
<xsl:if test="marc:subfield[@code='e'][1]"><xsl:text> : </xsl:text><xsl:value-of select="marc:subfield[@code='e'][1]" /></xsl:if>
<xsl:if test="marc:subfield[@code='c'][1]"><xsl:text> . </xsl:text><xsl:value-of select="marc:subfield[@code='c'][1]" /></xsl:if>
<xsl:if test="marc:subfield[@code='d'][1]"><xsl:text> = </xsl:text><xsl:value-of select="marc:subfield[@code='d'][1]" /></xsl:if>
<xsl:if test="marc:subfield[@code='h'][1]"><xsl:text> . </xsl:text><xsl:value-of select="marc:subfield[@code='h'][1]" /></xsl:if>
<xsl:if test="marc:subfield[@code='i'][1]"><xsl:text> . </xsl:text><xsl:value-of select="marc:subfield[@code='i'][1]" /></xsl:if>
<xsl:if test="marc:subfield[@code='e'][2]"><xsl:text> : </xsl:text><xsl:value-of select="marc:subfield[@code='e'][2]" /></xsl:if>
<xsl:if test="marc:subfield[@code='c'][2]"><xsl:text> . </xsl:text><xsl:value-of select="marc:subfield[@code='c'][1]" /></xsl:if>
<xsl:if test="marc:subfield[@code='d'][2]"><xsl:text> = </xsl:text><xsl:value-of select="marc:subfield[@code='d'][2]" /></xsl:if>
<xsl:if test="marc:subfield[@code='h'][2]"><xsl:text> . </xsl:text><xsl:value-of select="marc:subfield[@code='h'][2]" /></xsl:if>
<xsl:if test="marc:subfield[@code='i'][2]"><xsl:text> . </xsl:text><xsl:value-of select="marc:subfield[@code='i'][2]" /></xsl:if>
<xsl:if test="marc:subfield[@code='e'][3]"><xsl:text> : </xsl:text><xsl:value-of select="marc:subfield[@code='e'][3]" /></xsl:if>
<xsl:if test="marc:subfield[@code='c'][3]"><xsl:text> .</xsl:text><xsl:value-of select="marc:subfield[@code='c'][3]" /></xsl:if>
<xsl:if test="marc:subfield[@code='d'][3]"><xsl:text> = </xsl:text><xsl:value-of select="marc:subfield[@code='d'][3]" /></xsl:if>
<xsl:if test="marc:subfield[@code='h'][3]"><xsl:text> . </xsl:text><xsl:value-of select="marc:subfield[@code='h'][3]" /></xsl:if>
<xsl:if test="marc:subfield[@code='i'][3]"><xsl:text> . </xsl:text><xsl:value-of select="marc:subfield[@code='i'][3]" /></xsl:if>
<xsl:if test="marc:subfield[@code='a'][2]"><xsl:text>. </xsl:text><xsl:value-of select="marc:subfield[@code='a'][2]" /></xsl:if>
<xsl:if test="marc:subfield[@code='a'][3]"><xsl:text>. </xsl:text><xsl:value-of select="marc:subfield[@code='a'][3]" /></xsl:if>
<xsl:if test="marc:subfield[@code='b']"><xsl:text> [</xsl:text><xsl:value-of select="marc:subfield[@code='b']"/><xsl:text>] </xsl:text>
</xsl:if>
<xsl:if test="marc:subfield[@code='f']">
<xsl:text> / </xsl:text>
<xsl:if test="marc:subfield[@code='f'][1]"><xsl:text></xsl:text><xsl:value-of select="marc:subfield[@code='f'][1]" /></xsl:if>
<xsl:if test="marc:subfield[@code='f'][2]"><xsl:text> ; </xsl:text><xsl:value-of select="marc:subfield[@code='f'][2]" /></xsl:if>
<xsl:if test="marc:subfield[@code='f'][3]"><xsl:text> ; </xsl:text><xsl:value-of select="marc:subfield[@code='f'][3]" /></xsl:if>
</xsl:if>
<xsl:if test="marc:subfield[@code='g'][1]"><xsl:text> ; </xsl:text><xsl:value-of select="marc:subfield[@code='g'][1]" /></xsl:if>
<xsl:if test="marc:subfield[@code='g'][2]"><xsl:text> ; </xsl:text><xsl:value-of select="marc:subfield[@code='g'][2]" /></xsl:if>
<xsl:if test="marc:subfield[@code='g'][3]"><xsl:text> ; </xsl:text><xsl:value-of select="marc:subfield[@code='g'][3]" /></xsl:if>
</h1>
</xsl:for-each>
</xsl:if>


<!--&&OPAC-->
<!--<xsl:if test="$biblionumber">
<li><a><xsl:attribute name="href">/cgi-bin/koha/opac-detail.pl?biblionumber=<xsl:value-of select="$biblionumber"/></xsl:attribute>Voir notice à l’OPAC</a></li>
</xsl:if>-->

<dl>

<xsl:if test="contains($type_doc,'Revue')">
<xsl:call-template name="tag_462" /></xsl:if>

<!--Titre de serie autorité 461-->
<!--<xsl:call-template name="tag_461" />-->

<!--Titre de serie non autorité 461-->
<xsl:call-template name="tag_461bis" />

<!--Titre dépouillé 463-->
<xsl:call-template name="tag_463" />


<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">412</xsl:with-param>
<xsl:with-param name="label">Est un extrait ou tiré à part de</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">413</xsl:with-param>
<xsl:with-param name="label">A pour extrait ou tiré à part</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">421</xsl:with-param>
<xsl:with-param name="label">A pour supplément</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">423</xsl:with-param>
<xsl:with-param name="label">Est un supplément de</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">423</xsl:with-param>
<xsl:with-param name="label">Est publié avec</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">424</xsl:with-param>
<xsl:with-param name="label">Est mis à jour par</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">430</xsl:with-param>
<xsl:with-param name="label">Suite de</xsl:with-param>
</xsl:call-template> 

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">431</xsl:with-param>
<xsl:with-param name="label">Succède après scission à</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">432</xsl:with-param>
<xsl:with-param name="label">Remplace</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">433</xsl:with-param>
<xsl:with-param name="label">Remplace partiellement</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">434</xsl:with-param>
<xsl:with-param name="label">Absorbe</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">435</xsl:with-param>
<xsl:with-param name="label">Absorbe partiellement</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">436</xsl:with-param>
<xsl:with-param name="label">Fusion de</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">437</xsl:with-param>
<xsl:with-param name="label">Suite partielle de</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">440</xsl:with-param>
<xsl:with-param name="label">Devient</xsl:with-param>
</xsl:call-template>


<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">441</xsl:with-param>
<xsl:with-param name="label">Devient partiellement</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">442</xsl:with-param>
<xsl:with-param name="label">Remplacé par</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">443</xsl:with-param>
<xsl:with-param name="label">Remplacé partiellement par</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">444</xsl:with-param>
<xsl:with-param name="label">Absorbé par</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">447</xsl:with-param>
<xsl:with-param name="label">Fusionné avec...pour former</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">451</xsl:with-param>
<xsl:with-param name="label">A pour autre édition, sur le même support</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">452</xsl:with-param>
<xsl:with-param name="label">A pour autre édition, sur un support différent</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">453</xsl:with-param>
<xsl:with-param name="label">Traduit sous le titre</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">454</xsl:with-param>
<xsl:with-param name="label">Est une traduction de</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">455</xsl:with-param>
<xsl:with-param name="label">Est une reproduction de</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">456</xsl:with-param>
<xsl:with-param name="label">Est reproduit comme</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">464</xsl:with-param>
<xsl:with-param name="label">Composante</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">470</xsl:with-param>
<xsl:with-param name="label">Document analysé</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">481</xsl:with-param>
<xsl:with-param name="label">Est aussi relié dans ce volume</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">482</xsl:with-param>
<xsl:with-param name="label">Relié à la suite de</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_4xx">
<xsl:with-param name="tag">488</xsl:with-param>
<xsl:with-param name="label">Autre type de relation</xsl:with-param>
</xsl:call-template>

<!--
<xsl:if test="marc:datafield[@tag=099]/marc:subfield[@code='t']">
<dt class="labelxslt">Catégorie de document</dt>
<dd>
<xsl:for-each select="marc:datafield[@tag=099]">
<xsl:value-of select="marc:subfield[@code='t']"/>
<xsl:choose>
<xsl:when test="position()=last()">
<xsl:text> </xsl:text>
</xsl:when>
<xsl:otherwise>
<xsl:text>; </xsl:text>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</dd>
</xsl:if>

<xsl:if test="marc:datafield[@tag=099]/marc:subfield[@code='y']">
<li><strong>Créateur de la notice&nbsp;: </strong>
<xsl:for-each select="marc:datafield[@tag=099]">
<xsl:value-of select="marc:subfield[@code='y']"/>
<xsl:choose>
<xsl:when test="position()=last()">
<xsl:text> </xsl:text>
</xsl:when>
<xsl:otherwise>
<xsl:text>; </xsl:text>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</li>
</xsl:if>

<xsl:if test="marc:datafield[@tag=099]/marc:subfield[@code='z']">
<li><strong>Modificateur de la notice&nbsp;: </strong>
<xsl:for-each select="marc:datafield[@tag=099]">
<xsl:value-of select="marc:subfield[@code='z']"/>
<xsl:choose>
<xsl:when test="position()=last()">
<xsl:text> </xsl:text>
</xsl:when>
<xsl:otherwise>
<xsl:text>; </xsl:text>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</li>
</xsl:if>-->





<xsl:if test="not(contains($renvoi,'z'))">
<xsl:call-template name="tag_7xx">
<xsl:with-param name="tag">700</xsl:with-param>
<xsl:with-param name="label">Auteur principal</xsl:with-param>
</xsl:call-template>
</xsl:if>

<xsl:call-template name="tag_7xx">
<xsl:with-param name="tag">710</xsl:with-param>
<xsl:with-param name="label">Auteur principal collectivité</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_7xx">
<xsl:with-param name="tag">701</xsl:with-param>
<xsl:with-param name="label">Co-auteur</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_7xx">
<xsl:with-param name="tag">702</xsl:with-param>
<xsl:with-param name="label">Auteur secondaire</xsl:with-param>
</xsl:call-template>

<xsl:call-template name="tag_7xx">
<xsl:with-param name="tag">711</xsl:with-param>
<xsl:with-param name="label">Co-auteur collectivité</xsl:with-param>
</xsl:call-template>

 <xsl:call-template name="tag_7xx">
 <xsl:with-param name="tag">712</xsl:with-param>
 <xsl:with-param name="label">Auteur secondaire collectivité</xsl:with-param>
 </xsl:call-template>

<!--&&0 PPN 009-->
<xsl:if test="marc:controlfield[@tag=009]">
 <dt class="labelxslt">PPN&nbsp;:</dt>
 <dd>
  <a><xsl:attribute name="href">http://www.sudoc.fr/<xsl:value-of select="$ppn"/></xsl:attribute><xsl:value-of select="$ppn"/></a>
 </dd>
 </xsl:if>

<!--N de these-->
<xsl:if test="marc:controlfield[@tag=029]">
 <dt class="labelxslt">N. de thèse&nbsp;: </dt>
 <dd>
<xsl:for-each select="marc:datafield[@tag=029]">
 <xsl:value-of select="marc:subfield[@code='a']"/>
 <xsl:choose>
 <xsl:when test="position()=last()">
 <xsl:text>.</xsl:text>
 </xsl:when>
 <xsl:otherwise>
 <xsl:text> ; </xsl:text>
 </xsl:otherwise>
 </xsl:choose>
 </xsl:for-each>
 </dd>
 </xsl:if>


 <xsl:if test="marc:datafield[@tag=010]/marc:subfield[@code='a']">
 <dt class="labelxslt">ISBN&nbsp;: </dt>
 <dd>
 <xsl:for-each select="marc:datafield[@tag=010]">
 <xsl:variable name="isbn" select="marc:subfield[@code='a']"/>
 <xsl:value-of select="marc:subfield[@code='a']"/>
 <xsl:choose>
 <xsl:when test="position()=last()">
 <xsl:text>.</xsl:text>
 </xsl:when>
 <xsl:otherwise>
 <xsl:text> ; </xsl:text>
 </xsl:otherwise>
 </xsl:choose>
 </xsl:for-each>
 </dd>
 </xsl:if>

 <xsl:if test="marc:datafield[@tag=010]/marc:subfield[@code='d']">
 <dt class="labelxslt">Prix&nbsp;: </dt>
 <dd>
 <xsl:for-each select="marc:datafield[@tag=010]">
 <xsl:variable name="isbn" select="marc:subfield[@code='d']"/>
 <xsl:value-of select="marc:subfield[@code='d']"/>
 <xsl:choose>
 <xsl:when test="position()=last()">
 <xsl:text>.</xsl:text>
 </xsl:when>
 <xsl:otherwise>
 <xsl:text> ; </xsl:text>
 </xsl:otherwise>
 </xsl:choose>
 </xsl:for-each>
 </dd>
 </xsl:if>

<xsl:if test="marc:datafield[@tag=011]">
 <dt class="labelxslt">ISSN&nbsp;: </dt>
 <dd>
 <xsl:for-each select="marc:datafield[@tag=011]">
 <xsl:value-of select="marc:subfield[@code='a']"/>
 <xsl:choose>
 <xsl:when test="position()=last()">
 <xsl:text>.</xsl:text>
 </xsl:when>
 <xsl:otherwise>
 <xsl:text>; </xsl:text>
 </xsl:otherwise>
 </xsl:choose>
 </xsl:for-each>
 </dd>
 </xsl:if>

 <xsl:if test="marc:datafield[@tag=073]">
 <dt class="labelxslt">EAN&nbsp;: </dt>
 <dd>
 <xsl:for-each select="marc:datafield[@tag=073]">
 <xsl:value-of select="marc:subfield[@code='a']"/>
 <xsl:choose>
 <xsl:when test="position()=last()">
 <xsl:text>.</xsl:text>
 </xsl:when>
 <xsl:otherwise>
 <xsl:text>; </xsl:text>
 </xsl:otherwise>
 </xsl:choose>
 </xsl:for-each>
 </dd>
 </xsl:if>


 <xsl:if test="marc:datafield[@tag=101]">
 <dt class="labelxslt">Langue&nbsp;: </dt>
 <xsl:for-each select="marc:datafield[@tag=101]">
 <dd>
 <xsl:for-each select="marc:subfield">
 <xsl:choose>
 <xsl:when test="@code='b'">du texte intermédiaire, </xsl:when>
 <xsl:when test="@code='c'">de l'oeuvre originale, </xsl:when>
 <xsl:when test="@code='d'">du résumé, </xsl:when>
 <xsl:when test="@code='e'">de la table des matières, </xsl:when>
 <xsl:when test="@code='f'">de la page de titre, </xsl:when>
 <xsl:when test="@code='g'">du titre propre, </xsl:when>
 <xsl:when test="@code='h'">du livret ou des paroles, </xsl:when>
 <xsl:when test="@code='i'">du matériel d'accompagnement, </xsl:when>
 <xsl:when test="@code='j'">des sous-titres </xsl:when>n> </xsl:choose>
 <xsl:value-of select="text()"/>
 <xsl:choose>
 <xsl:when test="position()=last()">
 <xsl:text>.</xsl:text>
 </xsl:when>
 <xsl:otherwise>
 <xsl:text> ; </xsl:text>
 </xsl:otherwise>
 </xsl:choose>
 </xsl:for-each>
 </dd>
 </xsl:for-each>
 </xsl:if>

 <xsl:if test="marc:datafield[@tag=102]">
 <dt class="labelxslt">Pays&nbsp;: </dt>
 <dd>
 <xsl:for-each select="marc:datafield[@tag=102]">
 <xsl:for-each select="marc:subfield">
 <xsl:value-of select="text()"/>
 <xsl:choose>
 <xsl:when test="position()=last()">
 <xsl:text>.</xsl:text>
 </xsl:when>
 <xsl:otherwise><xsl:text>, </xsl:text>
 </xsl:otherwise>
 </xsl:choose>
 </xsl:for-each>
 </xsl:for-each>
 </dd>
 </xsl:if>

 <xsl:if test="marc:datafield[@tag=205]">
 <dt class="labelxslt">Mention d'édition&nbsp;: </dt>
 <dd>
 <xsl:for-each select="marc:datafield[@tag=205]">
 <xsl:for-each select="marc:subfield">
 <xsl:value-of select="text()"/>
 <xsl:choose>
 <xsl:when test="position()=last()">
 <xsl:text>.</xsl:text>
 </xsl:when>
 <xsl:otherwise><xsl:text>, </xsl:text>
 </xsl:otherwise>
 </xsl:choose>
 </xsl:for-each>
 </xsl:for-each>
 </dd>
 </xsl:if>

<!--&&3 Publisher 210-->
 <xsl:call-template name="tag_210" />

<!--&&16 Publisher 219-->
 <xsl:call-template name="tag_219" />

 <xsl:call-template name="tag_215" />

 <xsl:if test="marc:datafield[@tag=207]">
 <dt class="labelxslt">Numérotation&nbsp;: </dt>
 <dd>
 <xsl:for-each select="marc:datafield[@tag=207]">
 <xsl:for-each select="marc:subfield">
 <xsl:value-of select="text()"/>
 <xsl:choose>
 <xsl:when test="position()=last()">
 <xsl:text> </xsl:text>
 </xsl:when>
 <xsl:otherwise>
 <xsl:text> ; </xsl:text>
 </xsl:otherwise>
 </xsl:choose>
 </xsl:for-each>
 </xsl:for-each>
 </dd>
 </xsl:if>


 <xsl:call-template name="tag_collection">
 <xsl:with-param name="tag">225</xsl:with-param>
 <xsl:with-param name="label">Collection</xsl:with-param>
 </xsl:call-template>

<!--&&4 Collection Authotity 410-->
<!--<xsl:for-each select="marc:datafield[@tag=410]">
 <li>
 <strong>Collection-Autorité&nbsp;: </strong>
 <span>
<xsl:choose>
<xsl:when test="marc:subfield[@code='9']">
<xsl:element name="a">
        <xsl:attribute name="href">
     /cgi-bin/koha/catalogue/search.pl?q=an:<xsl:value-of select="marc:subfield[@code='9']"/></xsl:attribute>
<xsl:value-of select="marc:subfield[@code='t']"/>
</xsl:element>
      </xsl:when>
<xsl:otherwise>
<xsl:element name="a">
        <xsl:attribute name="href">
     /cgi-bin/koha/catalogue/search.pl?idx=Title-series&amp;q=<xsl:value-of select="marc:subfield[@code='t']"/>
</xsl:attribute><xsl:value-of select="marc:subfield[@code='t']"/></xsl:element>
</xsl:otherwise>
 </xsl:choose>
<xsl:if test="marc:subfield[@code='t'] and marc:subfield[@code='v']">
<xsl:text> . </xsl:text>
<xsl:value-of select="marc:subfield[@code='v']"/>
  </xsl:if>
</span>
</li>
</xsl:for-each>-->

 <xsl:call-template name="tag_title">
 <xsl:with-param name="tag">500</xsl:with-param>
 <xsl:with-param name="label">Titre Uniforme</xsl:with-param>
 </xsl:call-template>

 <xsl:call-template name="tag_title">
 <xsl:with-param name="tag">503</xsl:with-param>
 <xsl:with-param name="label">Titre de forme</xsl:with-param>
 </xsl:call-template>

 <xsl:call-template name="tag_title">
 <xsl:with-param name="tag">510</xsl:with-param>
 <xsl:with-param name="label">Titre parallèle</xsl:with-param>
 </xsl:call-template>

 <xsl:call-template name="tag_title">
 <xsl:with-param name="tag">517</xsl:with-param>
 <xsl:with-param name="label">Autres variantes du titre</xsl:with-param>
 </xsl:call-template>

 <xsl:call-template name="tag_title">
 <xsl:with-param name="tag">530</xsl:with-param>
 <xsl:with-param name="label">Titre clé</xsl:with-param>
 </xsl:call-template>




<!--
 <xsl:if test="marc:datafield[@tag=686]">
 <li>
 <strong>Autre Classification : </strong>
 <xsl:for-each select="marc:datafield[@tag=686]">
 <xsl:value-of select="marc:subfield[@code='a']"/>
 <xsl:if test="marc:subfield[@code='2']">
 <xsl:text>, </xsl:text>
 <xsl:value-of select="marc:subfield[@code='2']"/>
 </xsl:if>
 <xsl:if test="marc:subfield[@code='z']">
 <xsl:text>, </xsl:text>
 <xsl:value-of select="marc:subfield[@code='z']"/>
 </xsl:if>
 <xsl:if test="not (position()=last())">
 <xsl:text> ; </xsl:text>
 </xsl:if>
 </xsl:for-each>
 </li>
 </xsl:if>

 <xsl:if test="marc:datafield[@tag=675]">
 <li>
 <strong>Classification-675&nbsp;: </strong>
 <xsl:for-each select="marc:datafield[@tag=675]">
 <xsl:value-of select="marc:subfield[@code='a']"/>
 <xsl:if test="marc:subfield[@code='b']">
 <xsl:text>, </xsl:text>
 <xsl:value-of select="marc:subfield[@code='b']"/>
 </xsl:if>
 <xsl:if test="marc:subfield[@code='c']">
 <xsl:text>, </xsl:text>
 <xsl:value-of select="marc:subfield[@code='c']"/>
 </xsl:if>
 <xsl:if test="not (position()=last())"><xsl:text> ; </xsl:text></xsl:if>
 </xsl:for-each>
 </li>
 </xsl:if>


 <xsl:if test="marc:datafield[@tag=676]">
 <li>
 <strong>Classification-676&nbsp;: </strong>
 <xsl:for-each select="marc:datafield[@tag=676]">
 <xsl:value-of select="marc:subfield[@code='a']"/>
 <xsl:if test="marc:subfield[@code='b']">
 <xsl:text>, </xsl:text>
 <xsl:value-of select="marc:subfield[@code='b']"/>
 </xsl:if>
 <xsl:if test="marc:subfield[@code='c']">
 <xsl:text>, </xsl:text>
 <xsl:value-of select="marc:subfield[@code='c']"/>
 </xsl:if>
 <xsl:if test="not (position()=last())"><xsl:text> ; </xsl:text></xsl:if>
 </xsl:for-each>
 </li>
 </xsl:if>
-->

 <xsl:if test="marc:datafield[@tag=300]">
 <dt class="labelxslt">Note &nbsp;: </dt>
 <dd>
 <xsl:for-each select="marc:datafield[@tag=300]">
 <xsl:call-template name="chopPunctuation">
 <xsl:with-param name="chopString">
 <xsl:call-template name="subfieldSelect">
 <xsl:with-param name="codes">a</xsl:with-param>
 <xsl:with-param name="subdivCodes">a</xsl:with-param>
 <xsl:with-param name="subdivDelimiter"> | </xsl:with-param>
 </xsl:call-template>
 </xsl:with-param>
 </xsl:call-template>
 </xsl:for-each>
 </dd>
 </xsl:if>

 <xsl:if test="marc:datafield[@tag=305]">
 <dt class="labelxslt">Note sur l'édition et l'histoire bibliographique&nbsp;: </dt>
 <dd>
 <xsl:for-each select="marc:datafield[@tag=305]">
 <xsl:call-template name="chopPunctuation">
 <xsl:with-param name="chopString">
 <xsl:call-template name="subfieldSelect">
 <xsl:with-param name="codes">a</xsl:with-param>
 <xsl:with-param name="subdivCodes">a</xsl:with-param>
 <xsl:with-param name="subdivDelimiter"> | </xsl:with-param>
 </xsl:call-template>
 </xsl:with-param>
 </xsl:call-template>
 </xsl:for-each>
 </dd>
 </xsl:if>

<!--
 <xsl:if test="marc:datafield[@tag=327]">
 <li>
 <strong>Note de contenu&nbsp;: </strong>
 <xsl:for-each select="marc:datafield[@tag=327]">
 <xsl:call-template name="chopPunctuation">
 <xsl:with-param name="chopString">
 <xsl:call-template name="subfieldSelect">
 <xsl:with-param name="codes">a</xsl:with-param>
 <xsl:with-param name="subdivCodes">a</xsl:with-param>
 <xsl:with-param name="subdivDelimiter"> | </xsl:with-param>
 </xsl:call-template>
 </xsl:with-param>
 </xsl:call-template>
 </xsl:for-each>
 </li>
 </xsl:if>-->

<!-- <xsl:if test="marc:datafield[@tag=330]">
 <li>
 <strong>Résumé&nbsp;: </strong>
 <xsl:for-each select="marc:datafield[@tag=330]">
 <xsl:value-of select="marc:subfield[@code='a']"/>
 <xsl:choose>
 <xsl:when test="position()=last()">
 <xsl:text> </xsl:text>
 </xsl:when>
 <xsl:otherwise>
 <br></br><xsl:text> </xsl:text>
 </xsl:otherwise>
 </xsl:choose>
 </xsl:for-each>
 </li>
 </xsl:if>-->

 <xsl:if test="marc:datafield[@tag=326]">
 <dt class="labelxslt">Périodicité&nbsp;: </dt>
 <dd>
 <xsl:for-each select="marc:datafield[@tag=326]">
 <xsl:value-of select="marc:subfield[@code='a']"/>
 <xsl:choose>
 <xsl:when test="position()=last()">
 <xsl:text> </xsl:text>
 </xsl:when>
 <xsl:otherwise>
 <xsl:text>; </xsl:text>
 </xsl:otherwise>
 </xsl:choose>
 </xsl:for-each>
 </dd>
 </xsl:if>



<!--<xsl:if test="marc:datafield[@tag=310]">
 <li>
 <strong>Note sur la disponibilité&nbsp;: </strong>
 <xsl:for-each select="marc:datafield[@tag=310]">
 <xsl:value-of select="marc:subfield[@code='a']"/>
 <xsl:choose>
 <xsl:when test="position()=last()">
 <xsl:text> </xsl:text>
 </xsl:when>
 <xsl:otherwise>
 <xsl:text>; </xsl:text>
 </xsl:otherwise>
 </xsl:choose>
 </xsl:for-each>
 </li>
 </xsl:if>-->

 <!--<xsl:if test="marc:datafield[@tag=317]">
 <li>
 <strong>Note de provenance&nbsp;: </strong>
 <xsl:for-each select="marc:datafield[@tag=317]">
 <xsl:value-of select="marc:subfield[@code='a']"/>
 </xsl:for-each>
 </li>
 </xsl:if>-->

 <!--<xsl:if test="marc:datafield[@tag=320]">
 <li>
 <strong>Notes : </strong>
 <xsl:for-each select="marc:datafield[@tag=320]">
 <xsl:value-of select="marc:subfield[@code='a']"/>
 <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
 </xsl:for-each>
 </li>
 </xsl:if>-->

  <xsl:if test="marc:datafield[@tag=328]">
  <dt class="labelxslt">Thèse :</dt>
    <dd>
      <xsl:for-each select="marc:datafield[@tag=328]">
        <xsl:for-each select="marc:subfield">
          <xsl:value-of select="text()"/>
          <xsl:choose>
            <xsl:when test="position()=last()">
              <xsl:text>.</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text> : </xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </xsl:for-each>
    </dd>
  </xsl:if>

 <!--<xsl:if test="marc:datafield[@tag=333]">
 <li>
 <strong>Public&nbsp;: </strong>
 <xsl:for-each select="marc:datafield[@tag=333]">
 <xsl:value-of select="marc:subfield[@code='a']"/>
 <xsl:choose><xsl:when test="position()=last()"><xsl:text>.</xsl:text></xsl:when><xsl:otherwise><xsl:text>; </xsl:text></xsl:otherwise></xsl:choose>
 </xsl:for-each>
 </li>
 </xsl:if>-->

<!--&&8 sons clips 464u-->
<!--<xsl:if test="marc:datafield[@tag=464]"> 
   <div class="panel panel-default results_summary"> 
     <div class="panel-heading" style="background-color:#FAFAFA"> 
     Contenu : 
     </div> 
    <div class="panel-body" style="height:190px;overflow:auto;background-color:#FAFAFA"> 

      <xsl:for-each select="marc:datafield[@tag=464]"> 
    <p> 
        <xsl:choose> 
        <xsl:when test="marc:subfield[@code='u']"> 
        <a> 
        <xsl:attribute name="href"><xsl:value-of select="marc:subfield[@code='u']"/></xsl:attribute> 
        <xsl:attribute name="title"><xsl:text>play-pause</xsl:text></xsl:attribute> 
        <xsl:attribute name="class"><xsl:text>sm2_button</xsl:text></xsl:attribute>  
        <img id="play" width="18" height="18"><xsl:attribute name="src">/public/images/play.png</xsl:attribute></img> 
        </a> 
        </xsl:when> 
        <xsl:otherwise> 
          <img id="noplay" width="18" height="18"><xsl:attribute name="src">/public/images/noplay.png</xsl:attribute></img> 
        </xsl:otherwise> 
        </xsl:choose> 
        <xsl:text> - </xsl:text> 
       <xsl:if test="marc:subfield[@code='t']"> 
        <xsl:value-of select="marc:subfield[@code='t']"/><xsl:text> - </xsl:text> 
        </xsl:if> 
        <xsl:choose> 
        <xsl:when test="marc:subfield[@code='t']"><xsl:value-of select="marc:subfield[@code='t']"/></xsl:when> 
        <xsl:when test="marc:subfield[@code='h']"><xsl:value-of select="marc:subfield[@code='h']"/></xsl:when> 
        <xsl:otherwise>Titre inconnu</xsl:otherwise> 
        </xsl:choose> 
        <xsl:if test="marc:subfield[@code='a']"> 
           <i> 
<xsl:for-each select="marc:subfield[@code='a']"> 
           <xsl:text> - </xsl:text><xsl:value-of select="."/> 
           </xsl:for-each> 
           </i> 
        </xsl:if> 
    </p> 
      </xsl:for-each> 
      </div> 
      </div> 
  </xsl:if>-->



<!--&&13 Descripteur 610-->
<xsl:if test="marc:datafield[@tag=610]">
 <dt class="labelxslt">Descripteur&nbsp;: </dt>
 <xsl:for-each select="marc:datafield[@tag=610]">
<dd>
<xsl:variable name="chp_610" select="marc:datafield[@tag=610]/marc:subfield[@code='a']"/>
<xsl:variable name="between" select="substring-before(substring-after(marc:subfield[@code='a'], '('), ')')"/>
<xsl:choose>
<xsl:when test="contains($chp_610,'(')">
<a>
<xsl:attribute name="href">/cgi-bin/koha/catalogue/search.pl?q=su,phr:<xsl:value-of select="substring-before(marc:subfield[@code='a'], '(')"/> <xsl:value-of select="$between"/></xsl:attribute>
<xsl:value-of select="marc:subfield[@code='a']"/>
</a>
</xsl:when>
<xsl:otherwise>
<a>
<xsl:attribute name="href">/cgi-bin/koha/catalogue/search.pl?q=su,phr:<xsl:value-of select="marc:subfield[@code='a']"/>
</xsl:attribute>
<xsl:value-of select="marc:subfield[@code='a']"/>
</a>
 </xsl:otherwise>
</xsl:choose>
 <xsl:choose>
 <xsl:when test="position()=last()">
 <xsl:text> </xsl:text>
 </xsl:when>
 <xsl:otherwise>
 <xsl:text> .  </xsl:text>
</xsl:otherwise>
 </xsl:choose>
</dd>
 </xsl:for-each>
 </xsl:if>


<!--&&15 cover cd dvd-->
<!--<xsl:if test="$coverCD!=' '">
<div id='jacquette'>
      <xsl:if test="marc:datafield[@tag=933]">
      <xsl:for-each select="marc:datafield[@tag=933]">
        <img class="coverimages" height="80" width="80"><xsl:attribute name="src"><xsl:value-of select="marc:subfield[@code='a']"/></xsl:attribute></img>
          <xsl:choose>
            <xsl:when test="position()=last()"/>
          </xsl:choose>
        </xsl:for-each>
      </xsl:if> </div></xsl:if>-->




<!--&& Etat de collection - SUDOC-->
<xsl:if test="marc:datafield[@tag=955]">
<dt class="labelxslt">Etat de collection</dt>
          <xsl:for-each select="marc:datafield[@tag=955]">
            <xsl:if test="marc:subfield[@code='9'] or marc:subfield[@code='r']">
              <dd>
              <xsl:if test="marc:subfield[@code='9']">
                	<xsl:call-template name="RCR">
        		      <xsl:with-param name="code" select="marc:subfield[@code='9']"/>
        	      	</xsl:call-template>
  	          </xsl:if>
        	      <xsl:if test="marc:subfield[@code='r']">
                  <!--<xsl:text> : </xsl:text>-->
                  <span class="available">
        		        <xsl:value-of select="marc:subfield[@code='r']"/>
                  </span>
        	      </xsl:if>
              </dd>
            </xsl:if>
        </xsl:for-each>
</xsl:if>

<!--reprendre le 930, y mettre la condition pério et voir pk il ne s'affiche pas-->
<xsl:if test="$perio='1'">
<xsl:if test="marc:datafield[@tag=930]">
    <dt class="labelxslt">Cote</dt>
          <xsl:for-each select="marc:datafield[@tag=930]">
        <xsl:if test="marc:subfield[@code='9'] or marc:subfield[@code='a']">
              <dd>
            <xsl:if test="marc:subfield[@code='9']">
                	<xsl:call-template name="RCR">
        		      <xsl:with-param name="code" select="marc:subfield[@code='9']"/>
        	      	</xsl:call-template>
  	          </xsl:if>
        	     <xsl:if test="marc:subfield[@code='a']">
                 <!-- <xsl:text> : </xsl:text>-->
                  <span class="available">
        		        <xsl:value-of select="marc:subfield[@code='a']"/>
                  </span>
        	      </xsl:if>
              </dd>
            </xsl:if>
        </xsl:for-each>
</xsl:if>
</xsl:if>

<xsl:if test="marc:datafield[@tag=959]">
    <dt class="labelxslt">Lacunes</dt>
          <xsl:for-each select="marc:datafield[@tag=959]">
            <xsl:if test="marc:subfield[@code='9'] or marc:subfield[@code='r']">
              <dd>
              <xsl:if test="marc:subfield[@code='9']">
                	<xsl:call-template name="RCR">
        		      <xsl:with-param name="code" select="marc:subfield[@code='9']"/>
        	      	</xsl:call-template>
  	          </xsl:if>
        	      <xsl:if test="marc:subfield[@code='r']">
                  <xsl:text> : </xsl:text>
                  <span class="available">
        		        <xsl:value-of select="marc:subfield[@code='r']"/>
                  </span>
        	      </xsl:if>
              </dd>
            </xsl:if>
        </xsl:for-each>
</xsl:if>

 <xsl:call-template name="tag_subject">
 <xsl:with-param name="tag">600</xsl:with-param>
 <xsl:with-param name="label">Sujet personne</xsl:with-param>
 </xsl:call-template>

 <xsl:call-template name="tag_subject">
 <xsl:with-param name="tag">601</xsl:with-param>
 <xsl:with-param name="label">Sujet collectivité</xsl:with-param>
 </xsl:call-template>

 <xsl:call-template name="tag_subject">
 <xsl:with-param name="tag">602</xsl:with-param>
 <xsl:with-param name="label">Sujet nom de famille</xsl:with-param>
 </xsl:call-template>

 <xsl:call-template name="tag_subject">
 <xsl:with-param name="tag">604</xsl:with-param>
 <xsl:with-param name="label">Sujet auteur titre</xsl:with-param>
 </xsl:call-template>

 <xsl:call-template name="tag_subject">
 <xsl:with-param name="tag">605</xsl:with-param>
 <xsl:with-param name="label">Sujet titre</xsl:with-param>
 </xsl:call-template>

 <xsl:call-template name="tag_subject">
 <xsl:with-param name="tag">606</xsl:with-param>
 <xsl:with-param name="label">Sujet nom commun</xsl:with-param>
 </xsl:call-template>

 <xsl:call-template name="tag_subject">
 <xsl:with-param name="tag">607</xsl:with-param>
 <xsl:with-param name="label">Sujet géographique</xsl:with-param>
 </xsl:call-template>

 <xsl:call-template name="tag_subject">
 <xsl:with-param name="tag">608</xsl:with-param>
 <xsl:with-param name="label">Sujet - Forme, genre, caractéristiques physiques</xsl:with-param>
 </xsl:call-template>

 <xsl:call-template name="tag_subject">
 <xsl:with-param name="tag">615</xsl:with-param>
 <xsl:with-param name="label">Catégorie de sujet</xsl:with-param>
 </xsl:call-template>

 <xsl:call-template name="tag_subject">
 <xsl:with-param name="tag">616</xsl:with-param>
 <xsl:with-param name="label">Marque commerciale</xsl:with-param>
 </xsl:call-template>

<!--&&14 URL 856-->
<xsl:if test="marc:datafield[@tag=856]/marc:subfield[@code='u']">
      <span class="results_summary">
        <span class="label">Ressource en ligne : </span>
        <xsl:for-each select="marc:datafield[@tag=856]">
 <xsl:variable name="url" select="substring-before(marc:subfield[@code='u'], '//')"/>
<xsl:if test="contains($url,'http:')">
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="marc:subfield[@code='u']"/>
            </xsl:attribute>
            <xsl:choose>
              <xsl:when test="marc:subfield[@code='y' or @code='3' or @code='z']">
                <xsl:call-template name="subfieldSelect">
                  <xsl:with-param name="codes">y3z</xsl:with-param>
                </xsl:call-template>
              </xsl:when>
              <xsl:when test="not(marc:subfield[@code='y']) and not(marc:subfield[@code='3']) and not(marc:subfield[@code='z'])">
              Cliquer ici
            </xsl:when>
            </xsl:choose>
          </a>
</xsl:if>
<xsl:if test="not(contains($url,'http:'))">
          <a>
            <xsl:attribute name="href">
              http://<xsl:value-of select="marc:subfield[@code='u']"/>
            </xsl:attribute>
            <xsl:choose>
              <xsl:when test="marc:subfield[@code='y' or @code='3' or @code='z']">
                <xsl:call-template name="subfieldSelect">
                  <xsl:with-param name="codes">y3z</xsl:with-param>
                </xsl:call-template>
              </xsl:when>
              <xsl:when test="not(marc:subfield[@code='y']) and not(marc:subfield[@code='3']) and not(marc:subfield[@code='z'])">
              Cliquer ici
            </xsl:when>
            </xsl:choose>
          </a>
</xsl:if>
          <xsl:choose>
            <xsl:when test="position()=last()"/>
            <xsl:otherwise> | </xsl:otherwise>
          </xsl:choose>
        </xsl:for-each>
      </span>
    </xsl:if>
 
<!--<xsl:if test="marc:datafield[@tag=901]">
 <li>
 <strong>Genre&nbsp;: </strong>
 <xsl:for-each select="marc:datafield[@tag=901]">
 <xsl:for-each select="marc:subfield">
 <xsl:value-of select="text()"/>
 <xsl:choose>
 <xsl:when test="position()=last()">
 <xsl:text>.</xsl:text>
 </xsl:when>
 <xsl:otherwise><xsl:text>, </xsl:text>
 </xsl:otherwise>
 </xsl:choose>
 </xsl:for-each>
 </xsl:for-each>
 </li>
 </xsl:if>-->


 <!-- 780 -->
 <xsl:if test="marc:datafield[@tag=780]">
 <xsl:for-each select="marc:datafield[@tag=780]">
 <li>
 <xsl:choose>
 <xsl:when test="@ind2=0">
 <strong>Continue:</strong>
 </xsl:when>
 <xsl:when test="@ind2=1">
 <strong>Continue en partie:</strong>
 </xsl:when>
 <xsl:when test="@ind2=2">
 <strong>Remplace&nbsp;:</strong>
 </xsl:when>
 <xsl:when test="@ind2=3">
 <strong>Remplace partiellement&nbsp;:</strong>
 </xsl:when>
 <xsl:when test="@ind2=4">
 <strong>Formé par la réunion de ... et: ...</strong>
 </xsl:when>
 <xsl:when test="@ind2=5">
 <strong>Absorbé:</strong>
 </xsl:when>
 <xsl:when test="@ind2=6">
 <strong>Absorbé en partie:</strong>
 </xsl:when>
 <xsl:when test="@ind2=7">
 <strong>Séparé de&nbsp;:</strong>
 </xsl:when>
 </xsl:choose>

 <xsl:variable name="f780">
 <xsl:call-template name="subfieldSelect">
 <xsl:with-param name="codes">à</xsl:with-param>
 </xsl:call-template>
 </xsl:variable>
 <a><xsl:attribute name="href">/cgi-bin/koha/catalogue/search.pl?q=<xsl:value-of select="translate($f780, '()', '')"/></xsl:attribute>
 <xsl:value-of select="translate($f780, '()', '')"/>
 </a>
 </li>

 <xsl:choose>
 <xsl:when test="@ind1=0">
 <li><xsl:value-of select="marc:subfield[@code='n']"/></li>
 </xsl:when>
 </xsl:choose>

 </xsl:for-each>
 </xsl:if>

 <!-- 785 -->
 <xsl:if test="marc:datafield[@tag=785]">
 <xsl:for-each select="marc:datafield[@tag=785]">
 <li>
 <xsl:choose>
 <xsl:when test="@ind2=0">
 <strong>Continué par&nbsp;:</strong>
 </xsl:when>
 <xsl:when test="@ind2=1">
 <strong>Continué partiellement par&nbsp;:</strong>
 </xsl:when>
 <xsl:when test="@ind2=2">
 <strong>Remplacé par&nbsp;:</strong>
 </xsl:when>
 <xsl:when test="@ind2=3">
 <strong>Partiellement remplacé par&nbsp;:</strong>
 </xsl:when>
 <xsl:when test="@ind2=4">
 <strong>Absorbé par:</strong>
 </xsl:when>
 <xsl:when test="@ind2=5">
 <strong>Absorbé partiellement par:</strong>
 </xsl:when>
 <xsl:when test="@ind2=6">
 <strong>Eclater de ... à ... :</strong>
 </xsl:when>
 <xsl:when test="@ind2=7">
 <strong>Fusionné avec ... pour former ...</strong>
 </xsl:when>
 <xsl:when test="@ind2=8">
 <strong>Redevient:</strong>
 </xsl:when>
 </xsl:choose>
 <xsl:variable name="f785">
 <xsl:call-template name="subfieldSelect">
 <xsl:with-param name="codes">à</xsl:with-param>
 </xsl:call-template>
 </xsl:variable>

 <a><xsl:attribute name="href">/cgi-bin/koha/catalogue/search.pl?q=<xsl:value-of select="translate($f785, '()', '')"/></xsl:attribute>
 <xsl:value-of select="translate($f785, '()', '')"/>
 </a>

 </li>
 </xsl:for-each>
 </xsl:if>

</dl>
</div>

 </xsl:template>

 <xsl:template name="nameABCDQ">
 <xsl:call-template name="chopPunctuation">
 <xsl:with-param name="chopString">
 <xsl:call-template name="subfieldSelect">
 <xsl:with-param name="codes">aq</xsl:with-param>
 </xsl:call-template>
 </xsl:with-param>
 <xsl:with-param name="punctuation">
 <xsl:text>:,;/ </xsl:text>
 </xsl:with-param>
 </xsl:call-template>
 <xsl:call-template name="termsOfAddress"/>
 </xsl:template>

 <xsl:template name="nameABCDN">
 <xsl:for-each select="marc:subfield[@code='a']">
 <xsl:call-template name="chopPunctuation">
 <xsl:with-param name="chopString" select="."/>
 </xsl:call-template>
 </xsl:for-each>
 <xsl:for-each select="marc:subfield[@code='b']">
 <xsl:value-of select="."/>
 </xsl:for-each>
 <xsl:if test="marc:subfield[@code='c'] or marc:subfield[@code='d'] or marc:subfield[@code='n']">
 <xsl:call-template name="subfieldSelect">
 <xsl:with-param name="codes">cdn</xsl:with-param>
 </xsl:call-template>
 </xsl:if>
 </xsl:template>

 <xsl:template name="nameACDEQ">
 <xsl:call-template name="subfieldSelect">
 <xsl:with-param name="codes">acdeq</xsl:with-param>
 </xsl:call-template>
 </xsl:template>
 <xsl:template name="termsOfAddress">
 <xsl:if test="marc:subfield[@code='b' or @code='c']">
 <xsl:call-template name="chopPunctuation">
 <xsl:with-param name="chopString">
 <xsl:call-template name="subfieldSelect">
 <xsl:with-param name="codes">bc</xsl:with-param>
 </xsl:call-template>
 </xsl:with-param>
 </xsl:call-template>
 </xsl:if>
 </xsl:template>

 <xsl:template name="part">
 <xsl:variable name="partNumber">
 <xsl:call-template name="specialSubfieldSelect">
 <xsl:with-param name="axis">n</xsl:with-param>
 <xsl:with-param name="anyCodes">n</xsl:with-param>
 <xsl:with-param name="afterCodes">fghkdlmor</xsl:with-param>
 </xsl:call-template>
 </xsl:variable>
 <xsl:variable name="partName">
 <xsl:call-template name="specialSubfieldSelect">
 <xsl:with-param name="axis">p</xsl:with-param>
 <xsl:with-param name="anyCodes">p</xsl:with-param>
 <xsl:with-param name="afterCodes">fghkdlmor</xsl:with-param>
 </xsl:call-template>
 </xsl:variable>
 <xsl:if test="string-length(normalize-space($partNumber))">
 <xsl:call-template name="chopPunctuation">
 <xsl:with-param name="chopString" select="$partNumber"/>
 </xsl:call-template>
 </xsl:if>
 <xsl:if test="string-length(normalize-space($partName))">
 <xsl:call-template name="chopPunctuation">
 <xsl:with-param name="chopString" select="$partName"/>
 </xsl:call-template>
 </xsl:if>
 </xsl:template>

 <xsl:template name="specialSubfieldSelect">
 <xsl:param name="anyCodes"/>
 <xsl:param name="axis"/>
 <xsl:param name="beforeCodes"/>
 <xsl:param name="afterCodes"/>
 <xsl:variable name="str">
 <xsl:for-each select="marc:subfield">
 <xsl:if test="contains($anyCodes, @code)      or (contains($beforeCodes,@code) and following-sibling::marc:subfield[@code=$axis])      or (contains($afterCodes,@code) and preceding-sibling::marc:subfield[@code=$axis])">
 <xsl:value-of select="text()"/>
 <xsl:text> </xsl:text>
 </xsl:if>
 </xsl:for-each>
 </xsl:variable>
 <xsl:value-of select="substring($str,1,string-length($str)-1)"/>
 </xsl:template>

<xsl:template name="RCR">
  <xsl:param name="code"/>
  <xsl:choose>
    <xsl:when test="$code='200962101'"> Bibliothèque universitaire</xsl:when>
    <xsl:otherwise><xsl:value-of select="$code"/></xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>
