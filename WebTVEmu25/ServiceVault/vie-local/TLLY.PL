splitq("$ENV{QUERY_STRING}&$ENV{CONTENT}");




if($qrs{'TLLY'}&& $qrs{'BootURL'} && $qrs{'wtv-head-waiter'} && $qrs{'wtv-s'}){
open(FILE,"< ServiceDB/TLLYVault/$qrs{'TLLY'}");
binmode(FILE);
sysread(FILE,$TLLY,-s FILE,0);
close(FILE);

print "200 OK\n";
print "Connection: Keep-Alive\n";
print "wtv-initial-key: $wtv_inital_key\n" if $qrs{'wtv-inital-key'};
print "wtv-offline-mail-connect-url: $wtv_offline_mail_connect_url\n" if $qrs{'wtv-offline-mail-connect-url'};
print "wtv-datadownload-url: $wtv_datadownload_url\n" if $qrs{'wtv-datadownload-url'};
print "wtv-datadownload-login-url: $wtv_datadownload_login_url\n" if $qrs{'wtv-datadownload-login-url'};
print "wtv-datadownload-checktimeoffset: $wtv_datadownload_checktimeoffset\n" if $qrs{'wtv-datadownload-checktimeoffset'};
print "wtv-messagewatch-url: $wtv_messagewatch_url\n" if $qrs{'wtv-messagewatch-url'};
print "wtv-service: name=wtv-log host=$qrs{'wtv-log'} port=1619 flags=0x04\n" if $qrs{'wtv-log'};
print "wtv-service: name=wtv-flashrom host=$qrs{'wtv-flashrom'} port=1618 flags=0x04\n" if $qrs{'wtv-flashrom'};

($qrs{'wtv-head-waiter'},$wtv_head_waiterp)=split(/:/,$qrs{'wtv-head-waiter'});
$wtv_head_waiterp="1601" if !($wtv_head_waiterp);

print "wtv-service: name=wtv-head-waiter host=$qrs{'wtv-head-waiter'} port=$wtv_head_waiterp flags=0x04\n";

($qrs{'wtv-s'},$wtv_sp)=split(/:/,$qrs{'wtv-s'});
$wtv_sp="1603" if !($wtv_sp);
print "wtv-service: name=wtv-* host=$qrs{'wtv-s'} port=$wtv_sp flags=0x04\n";


print "wtv-boot-url: $qrs{'BootURL'}\n";
print "wtv-execute-tellyscript-now: $qrs{'wtv-execute-tellyscript-now'}\n";
print "Content-type: text/x-tellyscript\n";
print "Content-length: ".length($TLLY)."\n\n";
print $TLLY;

$TLLY="";


}else{

$tosendout=<<"ERIC"
<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<script>
function WorkAround(a){
document.open("text/url");
document.write(a);
document.close();
}
</script>
<title> Setup Your NV RAM </title>
</head>
<body bgcolor="#000033" text="#999999" link="#999999" vlink="#999999">
<center>
<h1> Setup Your NV RAM </h1>
</center>
The box's TellyScript is what controls which POP to initiate a connection with.  The TellyScript must be in a compiled state before the box can accept it.  The TellyScript is the first piece of data within the Flash NV RAM.  Once the modem software has finished the connection speed handshake the box then looks for certain variables within NV RAM.  These variables are what the box uses to start a connection with the central servers.  If more information on this is needed please read "NV RAM" within the theories section that is contained in this Emulator.  Please enter your data below to write a TellyScript within NV RAM. * indicate that it is required.  You may execute your TellyScript <a href=javascript:WorkAround('client:ActivateNetwork')>here</a> if once you have already set it up.<p>
<form>
<table>
<tr><td><a href="javascript:alert('Currently I have three different types of TellyScripts.  Im not sure what number will be dialed from any of the current TellyScripts.')">* TellyScript: </a></td><td>
<select name="TLLY">
<option value="01.tok">TellyScript 01.tok
<option value="02.tok">TellyScript 02.tok
<option value="02.tok">TellyScript 03.tok
</select>
</td></tr>

<!--<tr><td><a href="javascript:alert('This is used to preform a TellyScript execution as soon as it's distributed.')">Execute TellyScript Now: </a></td><td><input type="checkbox" value="true" name="wtv-execute-tellyscript-now"></td></tr> -->


<tr><td><a href="javascript:alert('The boot url defines what URL the box will go to once the service list is setup and the box has connected to the POP server.\n Ex: wtv-head-waiter:/login?')">* Boot URL: </a></td><td><input type="text" name="BootURL" value="wtv-head-waiter:/login?"></td></tr>


<tr><td><a href="javascript:alert('The head waiter IP is the IP that will be set on your service buffer for wtv-head-waiter this is setup after your box has connected to the POP service.')">* Head Waiter IP: </a></td><td><input name="wtv-head-waiter" type="text" value="$sockhost:$sockport"></td></tr>


<tr><td><a href="javascript:alert('The star IP is the IP that will be set on your service buffer for wtv-* this is setup after your box has connected to the POP service.')">* Star IP: </a></td><td><input type="text" name="wtv-s" value="$sockhost:$sockport"></td></tr>

<tr><td><a href="javascript:alert('The inital key is used for the box to verify the challenge and produce a challenge-response.  The is needed if you are going to login through /login if this key does not match then you would get a reset error and go into a hot boot.')">Initial Key: </a></td><td><input type="text" value="ATt8Eq4Zi/s=" name="wtv-inital-key"></td></tr>


<tr><td><a href="javascript:alert('When the box has this feature this is used to download mail to the box so it can be read offline.')">Offline Mail URL: </a></td><td><input type="text" value="wtv-head-waiter:/offline-mail-connect" name="wtv-offline-mail-connect-url"></td></tr>

<tr><td><a href="javascript:alert('This is used to download data to the box.  This is normally TV listings, ROMCache, IR, and video ad data.')">DataDownload URL: </a></td><td><input type="text" value="wtv-disk:/download-list" name="wtv-datadownload-url"></td></tr>


<tr><td><a href="javascript:alert('Aftre the box has a connection with a POP sever then it requests this URL to make a download login.')">DataDownload Login URL: </a></td><td><input type="text" value="wtv-head-waiter:/login?DataDownload=1" name="wtv-datadownload-login-url"></td></tr>



<tr><td><a href="javascript:alert('This is the time when the box will connect to the server to start a datadownload.')">DataDownload Time Offset: </a></td><td><input type="text" value="12093" name="wtv-datadownload-checktimeoffset"></td></tr>

<tr><td><a href="javascript:alert('This is the URL that the box will use to check to see if there is any mail available on the current account.')">Message Watch URL: </a></td><td><input type="text" value="wtv-head-waiter:/login?MessageWatch=1" name="wtv-messagewatch-url"></td></tr>


<tr><td>&nbsp;</td><td><input type="submit" value="Setup"></td></tr>


</body>
</html>
ERIC
    ;




print "200 OK.\n";
print "wtv-expire-all: wtv-1800:/preregister\n";
print "Content-length: ".length($tosendout)."\n";
print "Content-type: text/html\n\n";
print $tosendout;
}