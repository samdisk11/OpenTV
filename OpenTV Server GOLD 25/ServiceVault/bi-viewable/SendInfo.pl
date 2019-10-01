splice(@valueArray);
$Change="";
$Reset="";
$countxz=0;
$pastcontenttype=0;
$IPX="";
foreach $thethings (@headersforye) {
$countxz++;
if(lc(substr($thethings,0,index($thethings," "))) eq "content-length:"){
$pastcontenttype=1;
}

if($countxz eq ($#headersforye)+1 && $pastcontenttype){
@valueArray=split(/\&/,$thethings);
}
}

if(!($valueArray[0])){
@valueArray=split(/\&/,$qurey);
}


foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);

$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
if($namem eq "IP" && ($sockhost eq $clienthost)){
$IPX=$valuem;
}elsif($namem eq "Reset"){
$Reset=$valuem;
}else{
$Change="$namem\x00$valuem";

}



}

chop($IPX) if $IPX=~/ /;

if(!($IPX)){
$IPX=$clienthost;
}



$MyLoc=matchInDB($IPX,1);

if($Change){
($namem,$valuem)=split(/\x00/,$Change);
addToDB($MyLoc,$namem,$valuem);
}

if($Reset){
splice(@DummyArray , $MyLoc);
}



$userromtype=getformDB($MyLoc,6);
$userbootromversion=getformDB($MyLoc,7);
$usersysconfig=getformDB($MyLoc,5);
$userchipversion=getformDB($MyLoc,4);
$userclientbuild=getformDB($MyLoc,3);
$userssid=getformDB($MyLoc,2);
chop($userssid) if $userssid=~/ /;
$userscript=getformDB($MyLoc,9);
if(!($userboxtype=$corespondToBT{substr($userssid,8,2)})){
$userboxtype="Viewer"
}


$tosendout=<<"ERIC"
<body bgcolor="#000033" text="#999999">
<center>
<h1>DataBase Variables</h1>
</center><p>
The database is the variables this server uses to identify you individualy.  This is a list of database variables for $IPX.
<p>
<form method=POST>
<input type="submit" value="Reset DB" name="Reset">
</form>
<p>

The first few are static variables which do not change unless the IP changes.<p>
Your rom type is as follows.  This is what type of media the appROM image will be downloaded to:<br>

<form method=POST>
"<input bgcolor=#000033 text=#999999 border=0 nohighlight name=6 value='$userromtype'>"
</form>
<p>
Next is your boot rom version.  Boot rom is the backup ROM if there is no appROM that can be used.  It also is used to download a new bootROM or appROM build:<br>
<form method=POST>
"<input bgcolor=#000033 text=#999999 border=0 nohighlight name=7 value='$userbootromversion'>"
</form>
<p>
Next is your system configuration this is defined when the box is manufactured it is a unique number to all box's:<br>
<form method=POST>
"<input bgcolor=#000033 text=#999999 border=0 nohighlight name=5 value='$usersysconfig'>"
</form>
<p>
Next is your chip version.  This is specific to what proccessor you have.  The first processor is FIDO1 (Classic 1). Each proccessor having a name of a dog SOLO is Steve Perlmans dog:<br>
<form method=POST>
"<input bgcolor=#000033 text=#999999 border=0 nohighlight name=4 value='$userchipversion'>"
</form>
<p>
Next is your client active build.  This is the build that is activly being used to access this page and is loaded into RAM.  It is most likely a appROM build but it can be a bootROM build:<br>
<form method=POST>
"<input bgcolor=#000033 text=#999999 border=0 nohighlight name=3 value='$userclientbuild'>"
</form>
<p>
Next is your Silicon Serial Identifacation.  This is what idetifies the box.  It is used by WebTV networks to identify a subscriber account:<br>
<form method=POST>
"<input bgcolor=#000033 text=#999999 border=0 nohighlight name=2 value='$userssid'>"
</form>
<p>
Next is your user script ID.  This is used to identify what type of TellyScript that was being used to dial into the network.  It is default of 0 which means a scriptless state:<br>
<form method=POST>
"<input bgcolor=#000033 text=#999999 border=0 nohighlight name=9 value='$userscript'>"
</form>
<p>
This is the CPU speed.  This idicates the cpeed of the CPU:<br>
<form method=POST>
"<input bgcolor=#000033 text=#999999 border=0 nohighlight name=22 value='$usercpuspeed'>"
</form>
<p>
Next is the manufacturer of box you have this is found by the SSID which is burned into the box:<br>
<form method=POST>
"$userboxtype"
</form>
<p>
<hr>
<p>
These are temorary variables which change every time it recives the header containing the information.  These variables are for $sockhost.<p>

This is the ticket that is being used.  The ticket is used by WNI to authorize into its trusted servers:<br>
"$ticketXCX"
<p>
This the the request type.  This may be primary if you are viewing this page.  It can change to "messagewatch" or "download" depending on the state of the request:<br>
"$userRequestType"
<p>
This is the clients incarnation.  This is how many times the box had to open a file (or socket).  This is used primarily for encryption purposes:<br>
"$userincarnation"

ERIC
    ;

if($sockhost eq $clienthost){
$tosendout.=<<"ERIC"
<p>
<hr>
<p>
Since you are the local client.  You have the right to view your clients information.  Please remember that this does not mean you can go willy nilly with it.<p>
<a href=wtv-Srvtrigger:/ClientList>Client List</a>

ERIC
    ;
}

print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;
