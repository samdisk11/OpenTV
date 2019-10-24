splitq("$ENV{QUERY_STRING}&$ENV{CONTENT}");







open(FILE,"< Modules/ServiceList.txt");
@BuFF=<FILE>;
close(FILE);


if($qrs{'account'}){
foreach  (@BuFF) {
chop if $_=~/\n/;
chop if $_=~/\r/;

($DirectoryX,$UserNameX,$PasswordX,$BootX)=split(/\^/,$_);

if($DirectoryX eq $qrs{'account'}){
if($UserNameX){
$tosendout.="<tr><td>Username:</td><td><input name='username'></td></tr>\n";
}

if($PasswordX){
$tosendout.="<tr><td>Password:</td><td><input name='password'></td></tr>\n";

}
}
}
if($tosendout){
$tosendout=<<"ERIC"
<html>
<head>
<title>Required Feilds Needed</title>
</head>
<body bgcolor="#000033" text="#999999">
<center>
<h1>Required Feilds Needed</h1>
</center>

<p>

There are required fields that are needed in order to log in.  Please enter them.<p>
<form>
<input type="hidden" name="account" value="$qrs{'account'}">
<table>

$tosendout
<tr><td></td></td><input type="submit"></td></tr>
</table>
ERIC
    ;


}else{

print $clients "500 $DirectoryX, $UserNameX, $PasswordX, $BootX, $qrs{'account'}\n\n";
#print $clients "Content-length: 0\n";
#print $clients "Content-type: text/html\n";
#print $clients "Location: $BootX\n\n";
}

}else{
$tosendout="<table><tr><th>Account Title</th><th>Prerequisite</th></tr>";



foreach  (@BuFF) {
chop if $_=~/\n/;
chop if $_=~/\r/;
$PreR="";
($DirectoryX,$UserNameX,$PasswordX)=split(/\^/,$_);

if($UserNameX){
$PreR="Needs username.";
}

if($PasswordX){
if(!($UserNameX)){
$PreR="Needs password.";
}else{
$PreR="Needs username and password.";
}
}

if(!($PreR)){
$PreR="Possible Registration.";
}

$tosendout.="<tr><td><a href=\"javascript:WorkAround('wtv-1800:/LoginManager?account=$DirectoryX')\">$DirectoryX</a></td><td>$PreR</td></tr>\n";

}
$tosendout.="</table>";

$tosendout=<<"ERIC"
<html>
<head>
<title>Login Manager</title>
<script>
function WorkAround(a){
document.open("text/url");
document.write(a);
document.close();
}
</script>
</head>
<body bgcolor="#000033" text="#999999" link="#999999" vlink="#999999">
<center>
<h1>Login Manager</h1>
</center><p>
This page is used for box or viewer users to access accounts on this server.  Below is a list of all the accounts available.  Some may need a password, some are unlimited, and others access the UserDatabase and needs to have a registered account which can be done by <a href=\"wtv-box:/register\">going to regitration</a> .<p>

$tosendout

ERIC
    ;
}
print $clients "200 OK\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;