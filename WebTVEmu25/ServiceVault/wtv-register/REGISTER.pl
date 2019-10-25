

if(!($decidedfolder)){
$decidedfolder="Personal";
}

if(!($ProxyHOST)){
$ProxyHOST="209.240.194.41:1650"
}

chop($userssid) if $userssid=~/ /;

if($registering){
if(length($decidedusername) > 14){
print $clients "500 Username is to long.  Please choose another name.\nwtv-field-name: UNM\n\n";
}elsif(length($decidedfolder) > 13){
print $clients "500 Favorite folder name is to long.  Please choose another name.\nwtv-field-name: FAVFN\n\n";
}elsif(!($decidedusername) || matchUsername($decidedusername) || $decidedusername=~/\:/){
print $clients "500 Please decide on a differnet username than \"$decidedusername\"\nwtv-field-name: UNM\n\n";
}elsif($decidedpassword=~/\:/){
print $clients "500 Please decide on a differnet password than \"$decidedpassword\"\nwtv-field-name: UPW\n\n";
}elsif(!($userssid)){
print $clients "500 I need a SSID in order to register.\nwtv-field-name: SSN\n\n";
}elsif(!($decidedusernameF)){
print $clients "500 Please enter your first name.\nwtv-field-name: FNM\n\n";
}elsif(!($decidedusernameL)){
print $clients "500 Please enter your last name.\nwtv-field-name: LNM\n\n";

}elsif(!($EMAL=~/\@/)){
print $clients "500 Invalid E-mail address.  There is no \"at\" sign (\@)\nwtv-field-name: POP3H\n\n";
}elsif(!($POP3H) && !($URSV)){
print $clients "500 Please decide on some sort of mail service.\nwtv-field-name: POP3H\n\n";
}else{


open(FILE,"> $RealDir/UserDataBase/users.txt");


print FILE "$userssid:$newuserid:$decidedusername:$decidedusernameF:$decidedusernameL:0:$decidedpassword\n";
close(FILE);







$rootdirxz="UserDataBase/Users/$decidedusername";

mkdir("$rootdirxz",1);
mkdir("$rootdirxz/Favorites",1);
mkdir("$rootdirxz/Favorites/$decidedfolder",1);
mkdir("$rootdirxz/Favorites/$decidedfolder/Thumbnails",1);
mkdir("$rootdirxz/Mail",1);
mkdir("$rootdirxz/Mail/outbox",1);
mkdir("$rootdirxz/Mail/inbox",1);
mkdir("$rootdirxz/Mail/sent",1);
mkdir("$rootdirxz/Mail/trash",1);
mkdir("$rootdirxz/Mail/mbox",1);
mkdir("$rootdirxz/ActivityLog",1);
mkdir("$rootdirxz/Preferences",1);


open(FILE,"> $RealDir/$rootdirxz/Mail/mbox/MailCount.txt");
print FILE "0:0\n";
close(FILE);
open(FILE,"> $RealDir/$rootdirxz/Mail/sent/MailCount.txt");
print FILE "0:0\n";
close(FILE);
open(FILE,"> $RealDir/$rootdirxz/Mail/trash/MailCount.txt");
print FILE "0:0\n";
close(FILE);
open(FILE,"> $RealDir/$rootdirxz/Mail/inbox/MailCount.txt");
print FILE "0:0\n";
close(FILE);

open(FILE,"> $RealDir/$rootdirxz/Preferences/Proxy.txt");
print FILE "$ProxyHOST\n";
close(FILE);


open(FILE,"> $RealDir/$rootdirxz/Preferences/Mail.txt");
print FILE "UseEricSrv: $URSV\n";
print FILE "POP3HOST: $POP3H\n";
print FILE "POP3USER: $POP3U\n";
print FILE "POP3PASS: $POP3P\n";
print FILE "EMAL: $EMAL\n";
close(FILE);

open(FILE,"> $RealDir/$rootdirxz/Preferences/News.txt");
print FILE "NNTPHOST: $NNTPH\n";
print FILE "NNTPPOST: $NNTPP\n";
print FILE "NNTPSEARCH: $NNTPS\n";
close(FILE);

open(FILE,"> $RealDir/$rootdirxz/Preferences/IRC.txt");
print FILE "$IRCNi\n";
close(FILE);

open(FILE,"> $RealDir/$rootdirxz/Preferences/primesetup.txt");
print FILE "from-server=1\&setup-advanced-options=0\&setup-play-bgm=1\&setup-bgm-tempo=-1\&setup-bgm-volume=100\&setup-background-color=c6c6c6\&setup-font-sizes=large\&setup-in-stereo=1\&setup-keyboard=standard\&setup-link-color=2222bb\&setup-play-songs=1\&setup-play-sounds=1\&setup-text-color=0\&setup-visited-color=8822bb\&setup-japan-keyboard=roman\&setup-japan-softkeyboard=norm\&setup-chat-access-level=0\&setup-chat-on-nontrusted-pages=1\&setup-tv-chat-level=0";
close(FILE);



open(FILE,"> $RealDir/$rootdirxz/Mail/inbox/MailCount.txt");
print FILE "1:1\n";
close(FILE);

open(FILE,"> $RealDir/$rootdirxz/Mail/inbox/MailData.txt");
print FILE "1\x00Welcome to EricSrv\x00Eric-MacDonald\@cooltude.webtv.net\x00$months/$days\n";
close(FILE);
open(FILE,"> $RealDir/$rootdirxz/Favorites/FavData.txt");

open(FILE,"> $RealDir/$rootdirxz/Mail/inbox/1.txt");
print FILE "From: OpenTV Server\@$ServerMailaddress\n";
print FILE "To: $decidedusername\@$ServerMailaddress\n";
print FILE "Subject: Welcome to OpenTV\n";
print FILE "X-WebTV-Stationery: BGColor $bgclr;TextColor $fgclr\n";
print FILE "Date: $formateddate\n\n";
print FILE "--WebTV-Mail-9896-1069\n";
print FILE "Content-Type: Text/Plain; Charset=US-ASCII\n";
print FILE "Content-Transfer-Encoding: 7Bit\n\n";
print FILE "Welcome to the EricSrv serives.  This is a mini account that has less functionality as the old Emulator but has enought to satisfy a WebTV box user.  Enjoy!\n\n"; 


open(FILE,"> $RealDir/$rootdirxz/Favorites/FavData.txt");
print FILE "FolderCount: 1\n\n$decidedfolder\n";
close(FILE);


open(FILE,"> $RealDir/$rootdirxz/Favorites/$decidedfolder/origanized-.txt");
print FILE "Discovery\x00http://www.discovery.com\x00wtv-favorite:/canned/discovery.gif\n";
print FILE "PBS Onlibe\x00http://www.pbs.org\x00wtv-favorite:/canned/images/pbs_online.gif\n";
close(FILE);


print $clients "300 OK\n";
print $clients "wtv-service: reset\n";
print $clients "wtv-transition: light\n";
print $clients "wtv-service: name=wtv-head-waiter host=$sockhost port=$sockport flags=0x04\n";
print $clients "wtv-boot-url: wtv-head-waiter:/login?new_registration=2\n";
print $clients "wtv-service: name=wtv-1800 host=$sockhost port=$sockport flags=0x04\n";
print $clients "wtv-service: name=wtv-flashrom host=$sockhost port=$sockport flags=0x04\n";
print $clients "wtv-service: name=wtv-home host=$sockhost port=$sockport flags=0x04\n";
print $clients "wtv-relogin-url: wtv-head-waiter:/login?new_registration=1\n";
print $clients "Location: client:ReLogin\n\n";

}
}else{


open(FILE,"< $RealDir/UserDataBase/UID.txt");
sysread(FILE,$newuserid,-s FILE,0);
close(FILE);



if($newuserid == 0 || !($newuserid)){
$newuserid="127000013";
}else{
$addon="";
$partC=(substr($newuserid,7,2));
$P1=(substr($partC,0,1)*1);
$P2=(substr($partC,1,1)*1);
$partB=(substr($newuserid,3,4));
$Prefix=(substr($newuserid,0,7)*1);
if(substr($partB,1,1) == 9){
$newuserid=$newuserid+14;
}elsif(substr($partB,2,1) == 9){
$newuserid=$newuserid+12;
}elsif(substr($partB,3,1) == 9){
$newuserid=$newuserid+9;
}elsif($P1 == 9){
$newuserid=$newuserid+10;
}else{
$P1++;
$P2=$P2+3;
if(length($P2) > 1){
$P2=$P2-10;
}
$newuserid="$Prefix$P1$P2";
}

for($i=length($newuserid); $i < 9; $i++){
$addon.="0";
}

$newuserid="$addon$newuserid";

}

open(FILE,"< $RealDir/UserDataBase/UID.txt");
print FILE "$newuserid\n";
close(FILE);


$tosendout=<<"ERIC"
<html>
<head>
<script>

function UNSyn(){
UNM=document.forms[0].elements[2].value;
if(UNM){
document.forms[0].URSVC.value="("+UNM+"\@$ServerMailaddress)"
}
}
function Pass(){
if(document.forms[0].elements[3].checked){
document.forms[0].elements[4].readonly=0
document.forms[0].elements[4].Focus()
}else{
document.forms[0].elements[4].readonly=1
document.forms[0].elements[4].value="";
}
}

</script>

<title>Register a Mini 1.5 Account</title>
</head>
<body bgcolor="#000033" text="#999999">
<center>
<h1>Register a Mini 1.5 Account</h1>
</center>
<p>
Please provide me with this information to setup your account.  This is used for box users who are still able to pass the IP block on some of WNIs POPs who want to have some capability to do things w/o a WNI account.  The current service version is "$serviceversion".<p>
<form method="POST">
<input type="hidden" name="register" value="true">
<input type="hidden" name="user-id" value="$newuserid">

<h4>Identification</h4>
<p>
<table>
<tr><td>User ID:</td><td>$newuserid</td></tr> 
<tr><td>Username:</td><td><input name="UNM" value="$decidedusername" onChange="UNSyn()" maxlength=14></td></tr> 
<tr><td>Password:</td><td><input type=checkbox onClick="Pass()"><input type="password" size="17" name="UPW" value="$decidedpassword" readonly=1></td></tr> 
<tr><td>First Name:</td><td><input name="FNM" value="$decidedusernameF"></td></tr>
<tr><td>Last Name:</td><td><input name="LNM" value="$decidedusernameL"></td></tr>
<tr><td>SSID:</td><td><input name="SSN" value="$userssid"></td></tr>
</table>



<p>
<h4>Mail</h4>
<p>
<table>
<tr><td>Use Srv Mail:</td><td><input type="checkbox" name="URSV" value="true" checked="true"><input noselect border=0 nobackground width="70%" text="#999999" name="URSVC"></td></tr>
<tr><td>Ext POP Host:</td><td><input name="POP3H" value="$POP3H">&nbsp;Ex: pop.webtv.net</td></tr>
<tr><td>E-mail Addy:</td><td><input name="EMAL" value="$EMAL"></td></tr>
<tr><td>Ext POP User:</td><td><input name="POP3U" value="$POP3U"></td></tr>
<tr><td>Ext POP Pass:</td><td><input type="password" name="POP3P" value="$POP3P"></td></tr>
</table>

<h4>News</h4>
<p>
<table>
<tr><td>Ext NNTP Host:</td><td><input name="NNTPH" value="$NNTPH"></td><td>Ex: News.matnet.com</td></tr>
<tr><td>Host Allows Posting:</td><td><input type="checkbox" name="NNTPP" value="true"></td></tr>
<tr><td>Host Allows Search:</td><td><input type="checkbox" name="NNTPS" value="true"></td></tr>
</table>

<h4>Favs</h4>
<p>
<table>
<tr><td>Starting Folder Name:</td><td><input name="FAVFN" value="$decidedfolder"></td></tr>
</table>


<h4>IRC</h4>
<p>
<table>
<tr><td>IRC Nick:</td><td><input name="IRCNi" value="$IRCNi"></td></tr>
</table>


<h4>Proxy</h4>
<p>
<table>
<tr><td>Prefered Proxy:</td><td><input name="Proxy" value="$ProxyHOST"></td></tr>
</table>
<p>
<input type="submit" value="Signup">
ERIC
    ;


print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;

}