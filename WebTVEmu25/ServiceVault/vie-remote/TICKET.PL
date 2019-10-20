$mthod="";
$ticketX="";
$HIP="";
$extra="";
splice(@valueArray);
$countxz=0;
$pastcontenttype=0;

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



if($namem eq "method"){
$mthod=$valuem;
}


if($namem eq "HIP"){
$HIP=$valuem;
}

}

if($mthod){
if($HIP=~/209.240.194/){
$extra=" wtv-home, wtv-favorite, http"
}
if($mthod == 1){
$ticketX=getTicket($HIP);
print "500 Ticket is Set. wtv-head-waiter, wtv-flashrom$extra, and wtv-register are usable.\n";
print "wtv-service: name=wtv-head-waiter host=$HIP port=1601\n";
print "wtv-service: name=wtv-flashrom host=$HIP port=1618\n";
print "wtv-service: name=wtv-register host=$HIP port=1607\n";
if($extra){
print "wtv-service: name=wtv-home host=$HIP port=1612\n";
print "wtv-service: name=wtv-favorite host=$HIP port=1611\n";
print "wtv-service: name=http host=$HIP port=1650\n";
}
print "$ticketX\n\n";


}else{
$ticketX=getTicket($HIP);
print "500 Ticket is Set. wtv-head-waiter, wtv-flashrom, and wtv-register are usable.\n";
print "wtv-service: name=wtv-head-waiter host=$HIP port=1601\n";
if($extra){
print "wtv-service: name=wtv-home host=$HIP port=1612\n";
print "wtv-service: name=wtv-favorite host=$HIP port=1611\n";
print "wtv-service: name=http host=$HIP port=1650\n";
}
print "wtv-service: name=wtv-flashrom host=$HIP port=1618\n";
print "wtv-service: name=wtv-register host=$HIP port=1607\n";
print "Connection: Keep-Alive\n";
print "wtv-bypass-proxy: false\n";
print "$ticketX\n\n";
}

}else{


$tosendout=<<"ERIC"


<body bgcolor="#000033" text="#999999">

<center>
<h1>Ticket Debug</h1>
</center>
<p>
As I was noted by e2.  Ticket distribution on this server caused conflicts while loging in to the server.  However getting the ticket beforehand from /login didn't cause these conflicts.  This page is used to investigate what the actual problem is about.  Please eneter the IP of the head waiter serer and which method you want to establish the ticket.  wtv-head-waiter, wtv-flashrom, and wtv-register, wtv-home, wtv-favorite, http is setup for 209.240.194 services.  Only wtv-head-waiter, wtv-flashrom, and wtv-register is setup for other services.<p>
<form>
<table>
<tr>
<td>IP: </td><td><input name="HIP"></td>
</tr>
<tr><td>Reg Server: </td><td><input type="radio" name="method" value="1"></td></tr>
<tr><td>Emulator Server: </td><td><input type="radio" name="method" value="2"></td></tr>
<tr><td>&nbsp;</td><td><input type="submit"></td></tr>
</table>
ERIC
    ;


print "200 OK.\n";
print "wtv-service: name=wtv-1800 host=$sockhost port=$sockport flags=0x04\n";
print "wtv-service: name=wtv-tricks host=$sockhost port=$sockport flags=0x04\n";
print "wtv-service: name=wtv-help host=$sockhost port=$sockport flags=0x04\n";
print "wtv-service: name=wtv-star host=$sockhost port=$sockport flags=0x04\n";
print "wtv-service: name=wtv-debug host=$sockhost port=$sockport flags=0x04 connections=3\n";
print "wtv-service: name=wtv-help host=$sockhost port=$sockport flags=0x04\n";
print "wtv-service: name=wtv-SrvTrigger host=$sockhost port=$sockport flags=0x04\n";
print "Content-length: ".length($tosendout)."\n";
print "Content-type: text/html\n\n";
print $tosendout;

}