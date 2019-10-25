$yoyoyo = <<"OUTA"
<html>
<head>
	<display nooptions nostatus keepdocument skipback clearback fontsize=small>
	<title>Connecting</title>
<!meta http-equiv=Refresh content="7; url=wtv-1800:/finish-prereg">

</head>

<body bgcolor="#000000" text="#449944">

<bgsound SRC="file://ROM/Cache/Music/DialingWebTV.mid" LOOP>

<center>
        <br><br>
		<br><br>


	<img src="file://ROM/images/ConnectingTo.gif" ani="file://ROM/Animations/ConnectingTo.cel">
	<br>

	<br>
	<img src="file://ROM/images/CityGlow.gif">
	<br>
	<img src="file://ROM/images/Spacer.gif" width=1 height=4>
	<br>
	<img src="file://ROM/images/CityRoad.gif" ani="file://ROM/Animations/CityRoad.cel">
</center>

<br>
<table cellspacing=0 cellpadding=0>
<tr>
<td valign=top width=250>
<br>
<font color=808080>
<spacer type=horizontal size=24>
<progressindicator name="progressindicator" height=44 width=240>
</font>
<td valign=top>
<!br>
<pre>
BOX VERS: (APP: $userclientbuild) / (BOOT: $userbootromversion)
SSID: ($userssid)
ANI: (956506145500)
Service IP: ($sockhost)
Client IP: ($clienthost)
<!#1:> 
<!#2:> 

</pre>
</table>


<!td align="right">
<!ANI 001112223333>
<!#1: >
<!#2:>
<!SIP:$sockhost>
<!()>
<!/td><!/tr>
<!/table>
</body>
</html>

OUTA
   ;



print "200 OK\n";
print "Pragma: no-cache\n";
print "Connection: Keep-Alive\n";
print "wtv-service: reset\n";
print "wtv-service: name=wtv-1800 host=$sockhost port=$sockport flags=0x00000004\n";
print "wtv-name-server: 4.2.2.2\n"; 
print "wtv-visit: wtv-1800:/finish-prereg\n";
print "wtv-expire-all: wtv-1800:/preregister\n";
print "Content-length: ".length($yoyoyo)."\n";
print "Content-type: text/html\n";
print "Location: client:killprotocols\n\n";
print $yoyoyo;