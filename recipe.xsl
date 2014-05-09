<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
<xsl:template match="/">
<HTML>
<HEAD> <TITLE>Recipes</TITLE>
</HEAD>
<BODY style="background-color:#cccccc">
<xsl:apply-templates/>
</BODY>
</HTML>


</xsl:template>
<xsl:template match="cookbook">
<h1>Cook Book</h1>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="recipe">
	<xsl:apply-templates select="title"/>
	<table cellpadding="4" border="1" width="600">
		<tr>
			<th>Ingredient</th>
			<th>Amount</th>
		</tr>	
	<xsl:for-each select="ingredient">		
			<tr>
				<td><xsl:value-of select="@name"/></td>
				<td><xsl:value-of select="@amount"/>
				<xsl:value-of select="@unit"/></td>
			</tr>		
	</xsl:for-each>
	</table>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="title">
	<h2 style="text-align:center"><xsl:value-of select="."/></h2>	
</xsl:template>


<xsl:template match="ingredient">
	<table cellpadding="4" border="dashed" width="100%">
	<xsl:if test="child::ingredient">
		<h4 style="text-align:center; text-transform:capitalize;"><xsl:value-of select="@name"/></h4>
		<table cellpadding="4" border="1" width="600">
		<tr>
			<th>Ingredient</th>
			<th>Amount</th>
		</tr>	
	<xsl:for-each select="ingredient">		
			<tr>
				<td><xsl:value-of select="@name"/></td>
				<td><xsl:value-of select="@amount"/>
				<xsl:value-of select="@unit"/></td>
			</tr>		
	</xsl:for-each>
	</table>
	</xsl:if>
	<xsl:if test="child::preparation">
		<xsl:apply-templates select="preparation"/>
	</xsl:if>
	</table>
	<p></p>
</xsl:template>

<xsl:template match="preparation">
	<h3>Preparation
	<xsl:if test="parent::ingredient">
	<span> Of <xsl:value-of select="../@name"/></span>
	</xsl:if>
	</h3>
	<ol>
	<xsl:for-each select="step">
		<li><xsl:value-of select="."/></li>
	</xsl:for-each>
	</ol>

</xsl:template>

<xsl:template match="nutrition">
	<h3>Nutrition</h3>
	<table border="1" cellpadding="2" width="600">
		<tr>
			<th>Calories</th>
			<th>Fat</th>
			<th>Carbohydrates</th>
			<th>Protein</th>
			<th>Alcohol</th>
		</tr>
		<tr>
			<td><xsl:value-of select="@calories"/></td>
			<td><xsl:value-of select="@fat"/></td>
			<td><xsl:value-of select="@carbohydrates"/></td>
			<td><xsl:value-of select="@protein"/></td>
			<td><xsl:value-of select="@alcohol"/></td>
		</tr>
	</table>
</xsl:template>

</xsl:stylesheet>


