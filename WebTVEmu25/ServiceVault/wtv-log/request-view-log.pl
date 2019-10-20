$logtypex="";
splice(@valueArray);
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
if($namem eq "logtype"){
$logtypex=$valuem;
}
}
chop($logtypex);
foreach $thethings (@headersforye) {
$countxz++;
if(lc(substr($thethings,0,index($thethings," "))) eq "wtv-ticket:"){
$ticketaccessz=substr($thethings,index($thethings," ")+1);
}
}

if(!($ticketaccess)){
if(open(FILEz,"< $RealDir/security/tricks.accessors")){
@stuffinherezzzz=<FILEz>;
close(FILEz);

foreach $lineazzzz (@stuffinherezzzz) {
chop($lineazzzz) if $_=~/\n/;
chop($lineazzzz) if $_=~/\r/;

if((substr($lineazzzz,0,1)) ne "#"){
($trkaddress,$trkaccesslevel,$trktime,$ssidx)=split(/\x01/,$lineazzzz);
if($trkaddress eq ($clienthost.":".$clientport) || ($userssid eq $ssidx)){
$ticketaccess=$trkaccesslevel;
}
}
}
}
}
if(1){

if($logtypex){
$tosendoutz=getUserFile($userssid,"ActivityLog/$logtypex.txt");
$tosendoutz=~s/\</\&lt\;/g;
$tosendoutz=~s/\>/\&gt\;/g;

@dung=split(/\n/,$tosendoutz);
$tosendoutz=join("<br>",@dung);
$tosendout=<<"ERIC"
<title>View $logtypex Logs</title>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<h1>View $logtypex Logs</h1>
<p>
$tosendoutz
<p>
<br>
<a href=wtv-log:/request-view-log>Go Back</a>
ERIC
    ;


}else{
$tosendout=<<"ERIC"
<title>View Logs</title>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<h1>View Logs</h1>
<p>
Welcome please click on the log you want to view!  Since the privacy policy says "There is no privacy here" I am not going to shut off your logs.  To lazy to change all the files now!<p>

<a href=wtv-log:/request-view-log?logtype=security>Printer</a><br>
<a href=wtv-log:/request-view-log?logtype=Chat>Chat</a><br>
<a href=wtv-log:/request-view-log?logtype=jellyscript>JellyScript</a><br>
<a href=wtv-log:/request-view-log?logtype=CrashLog>Chrash</a><br>
<a href=wtv-log:/request-view-log?logtype=error>Error</a><br>
<a href=wtv-log:/request-view-log?logtype=security>Security</a><br>
<a href=wtv-log:/request-view-log?logtype=TCPLog>TCP</a><br>
<a href=wtv-log:/request-view-log?logtype=PhoneLog>Phone</a><br>
ERIC
    ;
}

print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;
}else{
print "500 Access denied.";
}