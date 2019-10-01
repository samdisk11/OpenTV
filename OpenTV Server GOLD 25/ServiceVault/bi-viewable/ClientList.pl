splice(@valueArray);
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

if($namem eq "Reset"){
$Reset=$valuem;
}



}

if($Reset){
splice(@DummyArray);
}

if($clienthost eq $sockhost){


$tosendout="<body bgcolor=#000033 text=#999999 link=#999999 vlink=#999999><center><h1>Client List</h1></center><p>There are only $clientcount client(s) for this session.<p><form method=POST><input type=submit name=Reset value='Reset Entire DB'><p><table><tr><td></td><th>IP</th><th align=centet>Setup</th></tr>";
$clientcount=0;
foreach  (@DummyArray) {
($x,$clientIP)=split(/\x01/,$_);

$fffff="<td>$clientIP</td>";
if(!($tosendout=~/$fffff/) && ($clientIP)){
$clientcount++;
if($clientIP eq $sockhost){
$tosendout.="<tr bgcolor=\"#000022\"><td>$fffff</td><td><table><tr><td><a href=wtv-Srvtrigger:/ConnectionHistory>Connection History</a></td><td><a href=wtv-Srvtrigger:/ClientHistory>URL Histroy</a></td><td><a href=wtv-Srvtrigger:/SendInfo>Data Base Variables</a></td></tr></table></td></tr>\n";
}else{
$tosendout.="<tr><td>$fffff<td><table><tr><td><a href=wtv-Srvtrigger:/ConnectionHistory?IP=$clientIP>Connection History</a></td><td><a href=wtv-Srvtrigger:/ClientHistory?IP=$clientIP>URL Histroy</a></td><td><a href=wtv-Srvtrigger:/SendInfo?IP=$clientIP>Data Base Variables</a></td></tr></table></td></tr>\n";
}
}
}
$tosendout.="</table>";
print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;

}else{
print $clients "500 Access Denied.\n\n";
}