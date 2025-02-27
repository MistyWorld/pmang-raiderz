<?xml version = "1.0" ?>
<xsl:stylesheet version = "1.0" xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="../../../system/action.xsl" />
	<xsl:variable name='NPCID' select='/maiet/COLT/@npcid'/>
	<xsl:variable name='NAME' select='/maiet/COLT/@name'/>
	<xsl:template match = "/">
   		<html>	
   		<head>
		   	<style type='text/css'>
				body {  font-family: verdana; font-size:11; color: #000000}
				td {  font-family: verdana; font-size:11; color: #000000}
   			</style>
			
			<script type="text/javascript"><![CDATA[ 
			function PopDivColt()
			{
				PopDiv( 0 )
			}

			function PopDivScript()
			{
				PopDiv( 1 )
			}

			function PopDivLua()
			{
				PopDiv( 2 )
			}
			
			function PopDiv( PopIdx )
			{
				var arrDivs = [ DivColt, DivScript, DivLua ]
				var arrTabs = [ DivTabColt, DivTabScript, DivTabLua ]
				for( i=0; i<3; i=i+1 ) {
					if( i == PopIdx ) {
						arrTabs[i].style.background="black"
						arrDivs[i].style.display = ""
					} 	else 	{
						arrTabs[i].style.background="grey"
						arrDivs[i].style.display = "none"
					}
				}
			}
			]]></script>

		</head>
   		<body bgcolor="white">
   			<xsl:apply-templates select="maiet"/>
		</body>   			
   		</html>
	</xsl:template>

	<xsl:template match="maiet">
		<div id='DivTabName' style='float:left;width:300; height:18; background:white;' >
			<font color='black'>[ <xsl:value-of select="$NAME" /> ]</font>
		</div>
		<div id='DivTabColt' style='width:100; height:18; background:black;float:left;' OnClick='PopDivColt()' OnMouseOver='this.style.cursor="hand"'>
			<font color='white' ><center>COLT</center></font>
		</div>
		<div id='DivTabScript' style='float:left;width:100; height:18; background:grey;' OnClick='PopDivScript()' OnMouseOver='this.style.cursor="hand"'>
			<font color='white' ><center>SCRIPT</center></font>
		</div>
		<div id='DivTabLua' style='float:left;width:100; height:18; background:grey;' OnClick='PopDivLua()' OnMouseOver='this.style.cursor="hand"'>
			<font color='white' ><center>LUA</center></font>
		</div>
		<div style='clear:both;width:100%; height:100%; ;'>
			<div id='DivColt' style='display:;clear:both;width:100%; height:100%;'>
				<xsl:apply-templates select="COLT"/>
			</div>
			<div id='DivScript' style='display:none;clear:both;'>
				<xsl:apply-templates select="SCRIPT"/>
			</div>
			<div id='DivLua' style='display:none;clear:both;'>
				<center>= Not yet. =</center>
				<!--<iframe border='0' frameborder='0' src='../lua/NPC_{$NPCID}.lua' width='100%' height='100%'/>-->
			</div>
		</div>
	</xsl:template>
		
	<!-- COLT template -->
	<xsl:template match="COLT">
		<xsl:apply-templates select="COMBAT"/>
		<xsl:apply-templates select="REACTION"/>
		<xsl:apply-templates select="IDLE"/>
	</xsl:template>
	
	<!-- COMBAT template -->
	<xsl:template match="COMBAT">
		<table bgcolor="black" cellspacing="1" cellpadding="2" width="600">
			<tr >
				<td width="80">
					<font color="white">
					COMBAT( 
					<xsl:choose>
						<xsl:when test=" string-length(@mode) = 0  ">0</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@mode" />
						</xsl:otherwise>
					</xsl:choose>
					) </font></td>
				<td colspan="6"><font color="white">
					<xsl:value-of select="@comment" />
				</font></td>
			</tr>
			<tr bgcolor="#dddddd">
				<td width="80">Default</td>
				<td width="80" align="center">Type</td>
				<td width="200" align="center">Param1</td>
				<td align="center">Param2</td>
				<td align="center">Rate</td>
				<td align="center">Cycle</td>
				<td align="center">Duration</td>
				<td align="center">Auto_run</td>
			</tr>
			<xsl:apply-templates select="DEFAULT"/>
			<xsl:apply-templates select="CHECK"/>
		</table>
		<br/>
	</xsl:template>
	
	<!-- IDLE template -->
	<xsl:template match="IDLE">
		<table bgcolor="black" cellspacing="1" cellpadding="2" width="600">
			<tr >
				<td width="80"><font color="white">IDLE</font></td>
			</tr>
			<tr bgcolor="#dddddd">
				<td width="80">Default</td>
				<td width="80" align="center">Type</td>
				<td width="200" align="center">Param1</td>
				<td align="center">Param2</td>
				<td align="center">Rate</td>
				<td align="center">Cycle</td>
				<td align="center">Duration</td>
				<td align="center">Auto_run</td>
			</tr>
			<xsl:apply-templates select="DEFAULT"/>
			<xsl:apply-templates select="CHECK"/>
		</table>
		<br/>
	</xsl:template>
	
	<!-- REACTION template -->
	<xsl:template match="REACTION">
		<table bgcolor="black" cellspacing="1" cellpadding="2" width="600">
			<tr >
				<td width="80"><font color="white">REACTION</font></td>
			</tr>
			<tr bgcolor="#dddddd">
				<td width="80" align="center">Default</td>
				<td width="80" align="center">Type</td>
				<td width="200" align="center">Param1</td>
				<td align="center">Param2</td>
				<td align="center">Rate</td>
				<td align="center">Cycle</td>
				<td align="center">Duration</td>
				<td align="center">Auto_run</td>
			</tr>
			<xsl:apply-templates select="DEFAULT"/>
			<xsl:apply-templates select="CHECK"/>
		</table>
		<br/>
	</xsl:template>
	
	<!-- DEFAULT -->
	<xsl:template match="DEFAULT">
		<xsl:apply-templates select="ACTION"/>
	</xsl:template>
	
	<!-- CHECK -->
	<xsl:template match="CHECK">
			<tr bgcolor="#dddddd">
				<td width="80">Check</td>
				<td colspan='7'>
					<xsl:choose>
						<xsl:when test="@type = 'mode'">
							mode = <xsl:value-of select="@param1"/>
						</xsl:when>
						<xsl:when test="@type = 'breakpart'">
							barekpart = <xsl:value-of select="@param1"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:if test="string-length( @param1 ) > 0 " >
								<xsl:value-of select="@param1"/> &lt;
							</xsl:if>
							<xsl:value-of select="@type"/>
							<xsl:if test="string-length( @param2 ) > 0 " >
								&gt; <xsl:value-of select="@param2"/> 
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
			<xsl:apply-templates select="CHECK"/>
			<xsl:apply-templates select="ACTION"/>
			<tr bgcolor="black"><td width="80"></td><td colspan='7'></td></tr>
	</xsl:template>
	
	<xsl:template match="SCRIPT">
		<table bgcolor="black" cellspacing="1" cellpadding="1">
		<tr><td><font color="white">SCRIPT </font></td></tr>
		<tr bgcolor="white" align="center" ><td>
			<textarea readonly="readonly" cols="120" rows="40" style="border:0px" >
				<xsl:choose>
					<xsl:when test="string-length(text() ) = 0 ">
						n/a
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="text()"/>
					</xsl:otherwise>
				</xsl:choose>
			</textarea>
		</td></tr>
		</table>
		
	</xsl:template>
	
</xsl:stylesheet>