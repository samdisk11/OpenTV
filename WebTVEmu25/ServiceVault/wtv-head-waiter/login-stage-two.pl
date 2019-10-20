

$speed3=Win32::GetTickCount();

$dectime=(time)/86.4;
$dectime=substr($dectime,5,7);

$speed=(($speed3)-($speed1));

$tosendout=<<"ERIC"													  
<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>The New WebTV Emulator 2.5 GOLD</title>
<script>
function WorkAround(a){
document.open("text/url");
document.write(a);
document.close();
}

</script>
</head>
<display clearback showwhencomplete switchtowebmode>
<body bgcolor="#000922" text="#CCCCCC" link="#AAAAAA" vlink="#999999" alink="#777777" fontsize="small">
<center>
<h1>The New WebTV Emulator 2.5 <font color="gold">GOLD</font></i></h1>
</center>
<p>
<hr noshade>
<p>
Welcome to the new Emulator version 2.5.  This viewer was made to allow you to have more control over connections and integrates the new protocol from the MSNTV viewer.<p>
<center>
<table cellspacing=5><tr><td>
<b>Information</b>:</td><td>
<form>
<select>
<option>Internal Latency: $speed ms
<script>
clk=new Date();
dectime=clk.getTime()/86400;
laten=((((dectime.toString()).substring(5,12))*1)-($dectime))*100;
laten=laten.toString();
laten=(laten.substring(0,laten.indexOf(".")+3))*1;

document.write("<option>Physical Latency: "+laten+" Secs");
</script>
<option>HOST-IP: $clienthost:$clientport
<option>Browser: $browtype
<option>SSID: $userssid
<option>AppROM Vers: $userclientbuild
<option>BootROM Vers: $userbootromversion
<option>Capabilities: $usercapabilities
<option>Username: $username
<option>CPU Speed: $usercpuspeed
<option>System Configuration: $usersysconfig
<option>Chip Version: $userchipversion
<option>ROM Type: $userromtype
<option>Endpoint Token: $endpointTokenStringX
<option>More...
</select>
</td></tr></table>
</center>
<P>
<hr noshade>
<p>
<center>
<table width="90%" cellspacing=0 cellpadding=0>



<tr><td align="center" bgcolor="#000011">
<br>
<h3>Remote Connection</h3>
</td></tr>
<tr><td>
<table width="100%" cellspacing=5 cellpadding=5>
<tr><td align="left">
<a href=javascript:WorkAround("vie-remote:/SuperConnect")>Super Connections</a><br>
</td><td align="right">
<a href=javascript:WorkAround("vie-remote:/VMenu")>Menu</a><br>
</td></tr>
<tr><td align="left">
<a href=javascript:WorkAround("vie-remote:/Proxy")>Proxy Setup</a><p>
</td><td align="right">
<a href=javascript:WorkAround("vie-remote:/MSServ")>MSNTV Serv</a><p>
</td><td>
</td></tr>
</table>
</td></tr>


<tr><td align="center" bgcolor="#000011">
<br>
<h3>Local Setup</h3>
</td></tr>
<tr><td>
<table width="100%" cellspacing=5 cellpadding=5>
<tr><td align="left">
<a href=javascript:WorkAround("vie-local:/SetClock")>Set the Clock</a><br>
</td>
</td><td align="right">
<a href=javascript:WorkAround("vie-local:/URLExpire")>URL Expireration</a><br>
</td></tr>
<tr><td align="left">
<a href=javascript:WorkAround("vie-local:/BootLED")>Boot LED Setup</a><br>
</td><td align="right">
<a href=javascript:WorkAround("vie-local:/BlastBacklist")>Blast Black List</a><br>
</td></tr>
<tr><td align="left">
<a href=javascript:WorkAround("vie-local:/AcptLang")>Accept Language</a><br>
</td><td align="right">
<a href=javascript:WorkAround("vie-local:/TLLY")>Setup NV RAM</a><br>
</td></tr>
<tr><td align="left">
<a href=javascript:WorkAround("flashupgrade:/Upgrade")>Flash Builds</a><p>
</td><td align="right">
<a href=javascript:WorkAround("vie-local:/hdrs")>Hearder Serv</a><br>
</td></tr>
</table>
</td></tr>

<tr><td align="center" bgcolor="#000011">
<br>
<font size="4"><b>Donations</h3>
</td></tr>


<tr><td>

<table width="100%" cellspacing=5 cellpadding=5>
<tr><td align="left">
<a href=javascript:WorkAround("emu-donate:/Jo5h")>Cache File Upload (Jo5h)</a><br>
</td></tr>
</table>

</td></tr>

<tr><td align="center" bgcolor="#000011">
<br>
<h3>Tricks and Hacks</h3>
</td></tr>
<tr><td>

<table width="100%" cellspacing=5 cellpadding=5>
<tr><td align="left">
<a href=javascript:WorkAround("bi-trih:/CompileFlash")>Compile Macromedia Flash Image</a><br>
</td><td align="right">
<a href=javascript:WorkAround("bi-trih:/WrkS")>WebTV Workshed</a><br>
</td></tr>
<tr><td align="left">
<a href=javascript:WorkAround("bi-trih:/Loop-D-Loop")>Loop d' loop</a><br>
</td><td align="right">
<a href=javascript:WorkAround("bi-trih:/MSNTVCmd")>MSNTV Command-or</a><br>
</td></tr>
</table>



<tr><td align="center" bgcolor="#000011">
<br>
<h3>Emulator Control</h3>
</td></tr>


<tr><td>
<table width="100%" cellspacing=5 cellpadding=5>
<tr><td align="left">
<a href=javascript:WorkAround("emu-local:/LoginManager")>Login Manager</a><br>
</td><td align="right">
<a href=javascript:WorkAround("wtv-tricks:/Proxy")>Setup Proxy Service</a><br>
</td></tr>
<tr><td align="left">
<a href=javascript:WorkAround("emu-local:/MSLogin")>Master Service Login</a><br>
</td><td align="right">
<a href=javascript:WorkAround("emu-local:/URLList")>Service Directory Index</a><br>
</td></tr>
<tr><td align="left">
<a href=javascript:WorkAround("emu-local:/Command")>Commandor</a><p>
</td></tr>

</tr></td>
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
wtv-service: name=wtv-1800 host=$sockhost port=$sockport flags=0x04
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
wtv-service: name=wtv-head-waiter host=127.0.0.1 port=1618 flags=0x04
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



