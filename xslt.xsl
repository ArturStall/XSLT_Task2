<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:wkdoc="http://www.wkpublisher.com/xml-namespaces/document"
xmlns:wklink="http://www.wkpublisher.com/xml-namespaces/links">
	<xsl:template match="/atlas-document">
		<html>
			<head>
				<link rel="stylesheet" href="style.css"/>
			</head>
			
			<body>
				<xsl:for-each select="wkdoc:document">
					<xsl:call-template name="metadata"/>
					<xsl:call-template name="body"/>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="metadata">
		<div id="header">
			<xsl:for-each select="wkdoc:level/wkdoc:level/wkdoc:level">
				<xsl:if test="@css-class='scms_metadata-item scms_name_dashboard-display'">
					<div id="dashboard">
						<xsl:value-of select="para"/>
					</div>
				</xsl:if>
				<xsl:if test="@css-class='scms_metadata-item scms_name_title'">
					<div id="title">
						<xsl:value-of select="para"/>
					</div>
				</xsl:if>
			</xsl:for-each>
		</div>		
	</xsl:template>
	
	<xsl:template name="body">
		<div id="body">
			<xsl:for-each select="wkdoc:level/wkdoc:level/wkdoc:level">
				<xsl:if test="@css-class='scms_va-object_sub-class_key-references scms_va-object_area_va-related-matter'">
					<xsl:call-template name="tips"/>
				</xsl:if>
				<xsl:if test="@css-class='scms_va-object_sub-class_key-references scms_va-object_area_va-translation-of'">
					<a class="h1">
						<xsl:value-of select="h1"/>
						<xsl:text>: </xsl:text>
					</a>
					<a class="links" id="link"><xsl:value-of select="wkdoc:level/para/wklink:cite-ref"/></a>					
				</xsl:if>
				<xsl:if test="@css-class='scms_prov-def scms_status_revoked'">
					<p class="example_header">
						<xsl:value-of select="para"/>
					</p>
				</xsl:if>
				<xsl:if test="@css-class='scms_prov-def'">
					<xsl:call-template name="example"/>
				</xsl:if>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	<xsl:template name="tips">		
		<div class="tips">
			<div class="header_tips">
				<firstletter>R</firstletter>
				<xsl:value-of select="h1"/>
			</div>
			<div class="body_tips">
				<p><xsl:value-of select="wkdoc:level/wkdoc:level/h1"/></p>
				<p class="italic">
					<xsl:value-of select="wkdoc:level/wkdoc:level/wkdoc:level/h1"/>
				</p>
				<p class="links_tips">
					<xsl:for-each select="wkdoc:level/wkdoc:level/wkdoc:level/para/wklink:cite-ref">
						<xsl:value-of select="."/>
						<xsl:text> </xsl:text>								
					</xsl:for-each>
				</p>
			</div>
		</div>
		
		<div class="footer_tips">
			<firstletter>R</firstletter>
			<xsl:value-of select="h1"/>
		</div>
	</xsl:template>
	
	<xsl:template name="example">
		<div class="example">
			<xsl:for-each select="para/span">
				<xsl:value-of select="."/>
			</xsl:for-each>			
			<xsl:for-each select="wkdoc:level/para">
				<p class="example_para">
					<xsl:for-each select="span">
						<xsl:if test="@css-class='scms_num'">
							<a class="italic"><xsl:value-of select="."/></a>
						</xsl:if>						
						<xsl:if test="@css-class='scms_text'">
							<a class="example_space"><xsl:value-of select="."/></a>
						</xsl:if>
					</xsl:for-each>
				</p>
			</xsl:for-each>
			<p class="formula">
			<xsl:value-of select="wkdoc:level/wkdoc:level/wkdoc:level/wkdoc:level/pre"/></p>
			<p class="formula_where">
			<xsl:value-of select="wkdoc:level/wkdoc:level/wkdoc:level/para/span"/></p>			
			<xsl:for-each select="wkdoc:level/wkdoc:level/wkdoc:level/wkdoc:level/para">
				<p class="formula_para">
					<xsl:for-each select="span">
						<xsl:if test="@css-class='scms_num'">
							<xsl:value-of select="."/>
						</xsl:if>
						<xsl:if test="@css-class='scms_text'">
							<a class="example_space"><xsl:value-of select="."/></a>
						</xsl:if>
					</xsl:for-each>
				</p>
			</xsl:for-each>			
		</div>
	</xsl:template>
	
</xsl:stylesheet>