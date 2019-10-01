splice(@valueArray);
splice(@hist);
splice(@hist2);


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
$IPX=$valuem;
}
}


$ArrayH="<table><tr><th>#</th><th>URL</th><th>Action</th></tr>";
$ArrayH2="<table><tr><th>#</td><th>URL</th><th>Idle Time</td></tr>";
$count=0;
$count2=0;




chop($IPX) if $IPX=~/ /;

if(!($IPX)){
$IPX=$clienthost;
}

$MyLocC=matchInDB($IPX,1);
$userURLHhistX=getformDB($MyLocC,11);
$userURLHhist2X=getformDB($MyLocC,12);

@hist=split(/\n/,$userURLHhistX);


foreach  (@hist) {
$count++;
$ActionX=substr($_,index($_," "));
$_=substr($_,0,index($_," "));
if($count%2){
$ArrayH.="<tr><td>$count</td><td><a href=$_>$_</a></td><td>$ActionX</td></tr>\n";
}else{
$ArrayH.="<tr bgcolor='#000022'><td>$count</td><td><a href=$_>$_</a></td><td>$ActionX</td></tr>\n";

}
}
$ArrayH.="</table>";

splice(@hist);
@hist=split(/\n/,$userURLHhist2X);
foreach  (@hist) {
@hist2=split(/\;/,$_);
foreach $_2 (@hist2) {
if($_2){

if(substr($_2,0,1) eq " "){
$_2=substr($_2,1);
}
$DayX="";
$HourX="";
$MinX="";
$SecX="";
$count2++;
($timeX,$urlX)=split(/ /,$_2);
$FFF=$timeX;
if($timeX > 86400 || $timeX == 86400){
$dtmX=$timeX/86400;
$DayX=substr($dtmX,0,index($dtmX,"."));
$dtmX=$timeX%86400;
}else{
$dtmX=$timeX%86400;
}

if($dtmX > 3600 || $dtmX == 3600){
$dtmXX=$dtmX;
$dtmX=$dtmX/3600;
$HourX=substr($dtmX,0,index($dtmX,"."));
$dtmX=$dtmXX%3600;
}else{
$dtmX=$dtmX%3600;
}

if($dtmX > 60 || $dtmX == 60){
$dtmXX=$dtmX;
$dtmX=$dtmX/60;
$MinX=substr($dtmX,0,index($dtmX,"."));
$dtmX=$dtmXX%60;


}else{
$dtmX=$dtmX%60;
}


$SecX=$dtmX%60;

$timeX="<font size=1>";
if($DayX){

if($DayX == 1){
$timeX.="$DayX Day, ";
}else{
$timeX.="$DayX Days, ";
}

}
if($HourX){
if($HourX == 1){
$timeX.="$HourX Hour, ";
}else{
$timeX.="$HourX Hours, ";
}
}

if($MinX){
if($MinX == 1){
$timeX.="$MinX Minute, "; 
}else{
$timeX.="$MinX Minutes, "; 
}
}

if(length($timeX) > 13){
$timeX.="and ";
}

if($SecX == 1){
$timeX.="$SecX Second";
}else{
$timeX.="$SecX Seconds";
}



$urlX=substr($urlX,1,(length($urlX)-2));
if($count2%2){
$ArrayH2.="<tr><td>$count2</td><td><a href=$urlX>$urlX</a></td><td>$timeX</td></tr>\n";
}else{
$ArrayH2.="<tr bgcolor='#000022'><td>$count2</td><td><a href=$urlX>$urlX</a></td><td>$timeX</td></tr>\n";
}

}
}
}

$ArrayH2.="</table>";



$tosendout=<<"ERIC"
<html>
<body bgcolor="#000033" text="#999999" link="#FFFFFF" vlink="#FFFFFF">
<center>
<h1>Client URL History</h1>
</center>
<p>
This is the history that this client has been too.<p>
From this server log (You have been to $count pages in $time minutes).  Newest is first.<p>
$ArrayH
<p>
This is from the referer log.<p>
$ArrayH2
ERIC
    ;


print $clients "200 OK\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "wtv-expire-all: wtv-srvtrigger:/ClientHistory\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;