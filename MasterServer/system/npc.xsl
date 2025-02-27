<?xml version = "1.0" ?>
<xsl:stylesheet version = "1.0" xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">

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
			<font color='black'></font>
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
				<table bgcolor="black" cellspacing="1" cellpadding="2" width="600">
					<tr>
						<td width="50" align="center">id</td>
						<td  width="80">name</td>
						<td  width="80">type</td>
					</tr>
					<xsl:apply-templates select="NPC"/>
				</table>		
			</div>
		</div>
	</xsl:template>
		
	<!-- COMBAT template -->
	<xsl:template match="NPC">
		<tr bgcolor="#ffffff">
				<td align="center"> <xsl:value-of select="@id" /> </td>
				<td> <a href="../script/npc/colt/{substring(@id+10000000,2,8) }.colt.xml" ><xsl:value-of select="@Name" /></a> </td>
				<td> <xsl:value-of select="@Type" /> </td>
		</tr>
	</xsl:template>
	
</xsl:stylesheet>