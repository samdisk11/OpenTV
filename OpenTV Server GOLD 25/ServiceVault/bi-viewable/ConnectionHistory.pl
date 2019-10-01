splice(@valueArray);
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
$IPX2=$valuem;
}
}
chop($IPX) if $IPX2=~/ /;
if(!($IPX2)){
$IPX2=$clienthost
}
$AHX="<table>";
foreach (@clientlog){
($clientaddrz,$timelogedin)=split(/\x01/,$_);

($IPX,$portX)=split(/\:/,$clientaddrz);

if($IPX eq $IPX2){
$AHX.="<tr><td>Client connected on $timelogedin with port $portX</td></tr>";


}
}
$AHX.="</table>";
$AHX=<<"ERIC"
<html>
<head>
<title>Server Client log $IPX2</title>
</head>

<body bgcolor="#000033" text="#999999">
<center>
<h1>Server Client log $IPX2</h1>
</center>
This is the connection log this server.  This is the time and port your client has connected to this server.
<p>
$AHX
ERIC
    ;



print $clients "200 OK\n";
print $clients "Content-length: ".length($AHX)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $AHX;