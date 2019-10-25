if($ENV{HTTP_REFERER} eq "wtv-head-waiter:/login"){
sleep(5);
}



$speed3=Win32::GetTickCount();

$dectime=(time)/86.4;
$dectime=substr($dectime,5,7);

$speed=(($speed3)-($speed1));


$tosendout=<<"ERIC"													  
<!--wtv-home service added by Mattman to help get that initial WebTV feel.-->
<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<script>
			function WorkAround(a){
			document.open("text/url");
			document.write(a);
			document.close();
			}
		</script>

		<TITLE>Home for NO-USER-DEV</TITLE>
		<DISPLAY noscroll options fontsize="medium">
	</HEAD>

	<body background="wtv-home:/images/BackgroundGradient.gif" text="AA9B4A" link="6977a9" vlink="6977a9" hspace=0 vspace=0 >

	<sidebar width=138>
		<table cellspacing=0 cellpadding=0 bgcolor="30364D">
			<!-- BEGIN LOGO SPAN -->
			<tr>
				<td width=138 absheight=112 valign=top align=center>
					<img src="file://rom/Images/Spacer.gif" width=1 height=9><br>

					<a HREF='javascript:WorkAround("client:showservices")'>
						<img src="file://rom/Images/Spacer.gif" width=1 height=2>
						<img src="file://rom/Cache/WebTVLogoJewel.gif" width=127 height=98>
					</A>

			<!-- BEGIN SEPARATOR -->
			<tr>
				<td absheight=5>
					<table cellspacing=0 cellpadding=0>
						<tr>
							<td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28">
								<img src="file://rom/Images/Spacer.gif" width=1 height=1>
						<tr>
							<td abswidth=138 absheight=1 valign=top align=left>
						<tr>
							<td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573">
								<img src="file://rom/Images/Spacer.gif" width=1 height=1>
					</table>
			<!-- END LOGO SPAN -->


			<!-- BEGIN SPAN -->
			<tr>
				<td absheight=25>
					<table cellspacing=0 cellpadding=0>
						<tr>
							<td height=2>
						<tr>
							<td abswidth=7>
							<td abswidth=125>


								<table cellspacing=0 cellpadding=0 href="wtv-1800:/preregister_eMac">
									<tr>
										<td>
											<table cellspacing=0 cellpadding=0>
												<tr>
													<td>
														<shadow><font size=3 color=e7ce4a>eMac's Hacks</font></shadow>
											</table>
								</table>
							<td abswidth=6>
					</table>

			<!-- BEGIN SEPARATOR -->
			<tr>
				<td absheight=5>
					<table cellspacing=0 cellpadding=0>
						<tr>
							<td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28">
								<img src="file://rom/Images/Spacer.gif" width=1 height=1>
						<tr>
							<td abswidth=138 absheight=1 valign=top align=left>
						<tr>
							<td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573">
								<img src="file://rom/Images/Spacer.gif" width=1 height=1>
					</table>
			<!-- END SPAN -->


			<!-- BEGIN SPAN -->
			<tr>
				<td absheight=25>
					<table cellspacing=0 cellpadding=0>
						<tr>
							<td height=2>
						<tr>
							<td abswidth=7>
							<td abswidth=125>
								<table cellspacing=0 cellpadding=0 href='javascript:WorkAround("Client:ShowAlert?message=This%20feature%20is%20only%20available%20with%20my%20custom%20build%20or%20a%20watered%20down%20version%20if%20your%20on%20the%20Viewer.&buttonlabel2=Viewer&buttonaction2=file://disk/Browser/Games/Games.html&buttonlabel1=Close&buttonaction1=client:goback")'>
									<tr>
										<td>
											<table cellspacing=0 cellpadding=0>
												<tr>
													<td>
														<shadow><font size=3 color=e7ce4a>MattMan's Menu</font></shadow>
											</table>
								</table>
							<td abswidth=6>
					</table>

			<!-- BEGIN SEPARATOR -->
			<tr>
				<td absheight=5>
					<table cellspacing=0 cellpadding=0>
						<tr>
							<td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28">
								<img src="file://rom/Images/Spacer.gif" width=1 height=1>
						<tr>
							<td abswidth=138 absheight=1 valign=top align=left>
						<tr>
							<td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573">
								<img src="file://rom/Images/Spacer.gif" width=1 height=1>
					</table>
			<!-- END SPAN -->


			<!-- BEGIN SPAN -->
			<tr>
				<td absheight=25>
					<table cellspacing=0 cellpadding=0>
						<tr>
							<td height=2>
						<tr>
							<td abswidth=7>
							<td abswidth=125>

							<table cellspacing=0 cellpadding=0 href='javascript:WorkAround("client:showalert?message=Special%20Thanks:<br><br>To%20Outa%20for%20his%20hard%20work%20on%20getting%20this%20to%20work%20better%20with%20DreamPi%20and%20everything%20else%20he%20did.")'>
								<tr>
									<td>
										<table cellspacing=0 cellpadding=0>
											<tr>
												<td>
													<shadow><font size=3 color=e7ce4a>Outa</font></shadow>
										</table>
							</table>

							<td abswidth=6>
					</table>

			<!-- BEGIN SEPARATOR -->
			<tr>
				<td absheight=5>

					<table cellspacing=0 cellpadding=0>
						<tr>
							<td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28">
								<img src="file://rom/Images/Spacer.gif" width=1 height=1>
						<tr>
							<td abswidth=138 absheight=1 valign=top align=left>
						<tr>
							<td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573">
							<img src="file://rom/Images/Spacer.gif" width=1 height=1>
					</table>
			<!-- END SPAN -->



			<!-- ADJUST ME FOR HOME TEXT HEIGHT -->
			<tr>
				<td absheight=54>
			
			<tr>
				<td align=right>
					<img src="wtv-home:/images/HomeBanner.gif" width=48 height=126>
			
			<tr>
			<td absheight=5>

		</table>
	</sidebar>


		<table cellspacing=0 cellpadding=0 width=100% height=100%>
			<tr>
				<td rowspan=99 background="wtv-home:/images/BackgroundGradientEdge.gif" width=6 height=100%>

			<tr>
				<td valign=top>
					<table cellspacing=0 cellpadding=0 width=100% absheight=113>
						<tr>
							<!-- BEGIN ICON #1 -->
							<td width=5%>
							<td absheight=113 width=18%>
								<LINK REL=next HREF="wtv-mail:/listmail">
								<table cellspacing=0 cellpadding=0 border=0 ref="wtv-mail:/listmail" selected nocolor width=100%>
									<tr>
										<td height=10>
									<tr>
										<td align=center>
											<img src="wtv-home:/images/mail2.gif" border=0 width=61 height=52>
									<tr>
										<td height=4>
									<tr>
										<td valign=bottom>
											<table cellspacing=0 cellpadding=0 width=100%>
												<tr>
													<td align=center>
														<font size=3 color=#000000>Mail</font>	
											</table>
								</table>
							
							<!-- BEGIN ICON #2 -->
							<td width=6%>
							<td absheight=113 width=22%>
								<table cellspacing=0 cellpadding=0 border=0 ref="wtv-favorite:/favorite" nocolor>
									<tr>
										<td height=12>
									<tr>
										<td align=center>
											<img src="wtv-home:/images/TreasureChest1.gif" border=0 width=92 height=52>
									<tr>
										<td height=2>
									<tr>
										<td valign=bottom>
											<table cellspacing=0 cellpadding=0 width=100%>
												<tr>
													<td align=center>
														<font size=3 color=#000000>Favorites</font>
											</table>
								</table>
							
							<!-- BEGIN ICON #3 -->
							<td width=5%>
							<td absheight=113 width=19%>
								<table cellspacing=0 cellpadding=0 border=0 ref="wtv-explore2:/top" nocolor>
									<tr>
										<td height=5>
									<tr>
										<td align=center>
											<img src="wtv-home:/images/NavigationGlobe0.gif" border=0 width=68 height=59>
									<tr>
										<td height=2>
									<tr>
										<td valign=bottom>
											<table cellspacing=0 cellpadding=0 width=100%>
												<tr>
													<td align=center>
														<font size=3 color=#000000>Explore</font>
											</table>
								</table>

							<!-- BEGIN ICON #4 -->
							<td absheight=113 width=3%>
							<td absheight=113 width=20%>
								<table cellspacing=0 cellpadding=0 border=0 ref="wtv-center:/search-page" nocolor>
									<tr>
										<td height=12>
									<tr>
										<td align=center>
										<A HREF='http://www.duckduckgo.com/lite'>
											<img src="wtv-home:/images/Binoculars0.gif" border=0 width=80 height=51>
									    </A>
									<tr>
										<td height=2>
									<tr>
										<td valign=bottom>
											<table cellspacing=0 cellpadding=0 width=100%>
												<tr>
													<td align=center>
														<font size=3 color=#000000>Search</font>
											</table>
								</table>
							<td width=9%>
					</table>
				<tr>
					<!-- I AM A SPACER / MARGIN MAKER -->
					<td absheight=15>
				<tr>
					<td valign=middle align=center>
						
						<!-- BEGIN MAIN SUB-CONTENT AREA -->
						<table cellspacing=0 cellpadding=0 width=394>						
							<tr>
								<td abswidth=100% absheight=135 valign=middle align=center>
									<table>
										<tr>
											<td>
												<img src="file://rom/Images/Spacer.gif" width=1 height=1><br>
												<A HREF='javascript:WorkAround("flashupgrade:/Upgrade")'>
													<img src="wtv-home:/images/OpenTVLogo.gif" width=364 height=120>
												</A>
											</TD>
										</TR>
									</table>
							<tr>
								<td width=100% absheight=28>
							<tr>
								<td width=100% align=center absheight=84>
									<table cellspacing=0 cellpadding=0 width=100%>
										<tr>
											<td abswidth=390 absheight=84 align=left>
												<embed src="wtv-home:/embed.html" width=390 height=84>

									</table>
						</table>
		</table>

	</body>
</html>
ERIC
    ;

chop($url) if $url=~/ /;

$lenc=length($tosendout);

print <<ERIC;
200 OK.
Connection: Keep-Alive
Content-length: $lenc 
Content-type: text/html

$tosendout
ERIC
    ;
$lenc=0;