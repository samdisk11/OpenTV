

$speed3=Win32::GetTickCount();

$dectime=(time)/86.4;
$dectime=substr($dectime,5,7);

$speed=(($speed3)-($speed1));


$tosendout=<<"ERIC"													  
<!--wtv-head-waiter SPLASH added by Mattman to help get that initial WebTV feel. Should be put in wtv-head-waiter service but i am lazy.-->
<html>
	<head>
		<display hideoptions skipback clearback fontsize=medium>
		<title>WebTV service</title>
		<meta http-equiv=Refresh content="4; url=wtv-home:/home">
	</head>
		<body bgcolor="#000000" text="#449944">
		<bgsound src="file://ROM/Sounds/Splash.mid">
		<center>
		<spacer type=block height=98 width=21>
		<br>
		<img src="file://ROM/Images/SplashLogo1.gif" width=250 height=175>
		<br><br><br>
		<p><br>
		<table border>
			<tr><td width=150>
			<center>OpenTV - https://github.com/samdisk11/OpenTV</center>
			<tr><td>
			<center>TestDrive Service, (rev 76,xPerlUniversal)</center>
        	<tr><td>
			<center>Newer WebTV (WebTV 3.0) Client Detected</center>
		</table>
		</center>
	</body>
</html>
ERIC
    ;


chop($url) if $url=~/ /;

$lenc=length($tosendout);

print <<ERIC;
200 OK.
wtv-service: reset
wtv-service: name=http host=74.76.120.18 port=1650 flags=0x04
wtv-service: name=wtv-1800 host=$sockhost port=$sockport flags=0x04
wtv-service: name=wtv-home host=$sockhost port=$sockport flags=0x04
wtv-service: name=wtv-music host=$sockhost port=$sockport flags=0x04
wtv-service: name=wtv-star host=$sockhost port=$sockport flags=0x04
wtv-service: name=wtv-log host=$sockhost port=$sockport flags=0x04
wtv-service: name=help host=$sockhost port=$sockport flags=0x04
wtv-service: name=bi-viewable host=$sockhost port=$sockport flags=04
wtv-service: name=bi-trih host=$sockhost port=$sockport flags=0x04
wtv-service: name=emu-donate host=$sockhost port=$sockport flags=0x04
wtv-service: name=emu-local host=$sockhost port=$sockport flags=0x04
wtv-service: name=vie-local host=$sockhost port=$sockport flags=0x04
wtv-service: name=vie-remote host=$sockhost port=$sockport flags=0x04
wtv-service: name=cgi-bin host=$sockhost port=$sockport flags=0x04
wtv-service: name=wtv-head-waiter host=$sockhost port=$sockport flags=0x04
wtv-service: name=wtv-tricks host=$sockhost port=$sockport flags=0x04
Connection: Keep-Alive
wtv-service: name=wtv-help2 host=$sockhost port=$sockport flags=0x04
wtv-service: name=wtv-we205 host=$sockhost port=$sockport flags=04
wtv-home-url: $par
wtv-expire-all: wtv-1800:/preregister
Content-length: $lenc 
Content-type: text/html

$tosendout
ERIC
    ;
$lenc=0;



