# OPEN


%NonToks=(
"wtv-tricks"      => "wtv-tricks:/tricks,wtv-tricks:/info,wtv-tricks:/demo,",
"wtv-home"        => "wtv-home:/home,wtv-home:/community,",
"wtv-head-waiter" => "wtv-head-waiter:/login,wtv-head-waiter:/account-needs-redial,wtv-head-waiter:/indirect-login-DDD,",
"wtv-mail"        => "wtv-mail:/listmail,wtv-mail:/addressbook?camefrom=inbox,",
"wtv-favorite"    => "wtv-favorite:/favorite,",
"wtv-setup"       => "wtv-setup:/setup,",
"wtv-register"   => "wtv-register:/ValidateSplash,",
"news"            => "news:alt.discuss.webtv.hacking,",
"wtv-news"        => "wtv-news:/lobby,wtv-news:/search,wtv-news:/search?search=1,"
);


sub splitq {

%qrs=();

foreach (split(/\&/,$_[0])){
/(\S*)\=(\S*)/;

$nnn=$2;
$nnnx=$1;
$nnn=~tr/+/ /;
$nnn=~s/%([a-fA-F0-9][a-fA-F0-9])/chr(hex($1))/eg;

$qrs{$nnnx}=$nnn;
}
}


sub parseCommandsx {

$speed1=Win32::GetTickCount();
# Now parse headers.  Answer to request if correct.




@h=split(/\n/,$ENV{CONTENT_HEADERS});

$rcmd=shift(@h);

$unpcm="";
$hcomadd="";
foreach (@h){
($cmd, $prm)=/(\S+)\s(.*)/;


if(     $cmd eq "wtv-system-cpuspeed:"          ){	#1
$clientdb{$clients}[0] = $usercpuspeed = $prm
}elsif( $cmd eq "http-executive-console:"         ){	#2
$hcomadd=$prm
}elsif( $cmd eq "wtv-system-sysconfig:"         ){	#2
($clientdb{$clients}[1] = $usersysconfig)   = $prm
}elsif( $cmd eq "wtv-system-chipversion:"       ){	#3
$clientdb{$clients}[2] = $userchipversion = $prm

}elsif( $cmd eq "authorization:"           ){	#4
$prm=(split(/\s+/,$prm))[1];
$unpcm=&BASE64_decode($prm);

}elsif( $cmd eq "wtv-client-serial-number:"     ){	#4
$ENV{CLIENT_SSID} = $clientdb{$clients}[3] = $userssid = $prm
}elsif( $cmd eq "wtv-system-version:"           ){	#5
$ENV{CLIENT_VERSION} = $clientdb{$clients}[4] = $userclientbuild = $prm
}elsif( $cmd eq "wtv-client-bootrom-version:"   ){	#6
$clientdb{$clients}[5] = $userbootromversion = $prm
}elsif( $cmd eq "wtv-client-rom-type:"          ){	#7
$clientdb{$clients}[6] = $userromtype = $prm
}elsif( $cmd eq "wtv-capability-flags:"         ){	#8
$clientdb{$clients}[7]	= $prm
}elsif( $cmd eq "wtv-tourist-enabled:"          ){	#9
$clientdb{$clients}[8]	= $prm
}elsif( $cmd eq "wtv-request-type:"             ){	#-
$ENV{CLIENT_REQUEST_TYPE} = $userrequesttype = $prm;
}elsif( $cmd eq "wtv-incarnation:"              ){	#-
$userincarnation        = $prm;
}elsif( $cmd eq "wtv-ticket:"                   ){	#- 
$ENV{CLIENT_TICKET} = $ticket                 = $params;
}elsif( $cmd eq "pragma:"                       ){	#-
$userpragma             = $prm;
}elsif( $cmd eq "wtv-capability-flags:"         ){	#10
($clientdb{$clients}[9] = $usercapabilities)   = $prm
}elsif( $cmd eq "wtv-show-time-record:"         ){	#11
$clientdb{$clients}[10] = $prm
}elsif( $cmd eq "wtv-script-id:"                ){	#12
$clientdb{$clients}[11]	= $prm
}elsif( $cmd eq "wtv-demo-enabled:"             ){	#13
$clientdb{$clients}[12]	= $prm
}elsif( $cmd eq "wtv-disk-size:"                ){	#14
$clientdb{$clients}[13]	= $prm
}elsif( $cmd eq "wtv-disk-first-error:"         ){	#15
$clientdb{$clients}[14]	= $prm
}elsif( $cmd eq "wtv-my-disk-sucks-sucks-sucks:"){	#16
$clientdb{$clients}[15]	= $prm
}elsif( $cmd eq "wtv-user-requested-upgrade:"   ){	#17
$clientdb{$clients}[16]	= $prm
}elsif( $cmd eq "wtv-system-cpuprid:"           ){	#18
$clientdb{$clients}[17]	= $prm
}elsif($cmd eq "Referer:" || $cmd eq "referer:"){
$ENV{HTTP_REFERER}=$prm;
$referer = $prm;
}



}





if(AnswerRequest("$rcmd",$nverbose)){
if(!($status)){
$status="200 OK";
}
$speed=0;

print $clients "$status\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients $headerstosend;
print $clients "Content-type: $mime\n\n";
print $clients $tosendout;

$tosendout="";
$status="";
}


$mime="";
$file="";
$ext="";
$tosendout="";
@data=();

if($disconnectd){
$pickcli2->remove($clients);
close($clients);
}





}


sub ParseSSL {


$tosendoutx="";

$cnt=0;
$noend=0;
foreach (split(/<|>/,$tosendout)) {

$cnt++;

if(/^[\!--]()[--]/ && !($nogo)){
$noend=1;


foreach $a (keys %pars) {
delete $pars{$a};
}


$SSI=substr($_,3);
$SSI=substr($SSI,0,-2);
$SSI=~m/^\#(\S*)\s*(.*)/;

$cm=$1;
if($2=~/(\w+)\s*=\s*\"(.*?)\"/){
$pars{$1}=$2;
}


if($cm eq 'val'){
$tosendoutx.=eval($pars{'var'});

}elsif($cm eq 'echo'){
$tosendoutx.=$ENV{$pars{'vars'}};

}elsif($cm eq 'include'){
$htfile="ht.access";
if($pars{'file'}){
$pars{'file'}="ServiceVault/".$pars{'file'};
if($pars{'file'}=~/(\S+).pl$/ or $pars{'file'}=~/(\S+).shtml$/ or $pars{'file'}=~/(\S+).cgi$/ or $pars{'file'}=~/($htfile)$/){
$tosendoutx.="[File open not supported for file \"$pars{'file'}\"]";
}else{
open(FILE,"< $RealDir/$pars{'file'}") or next;
sysread(FILE,$pars{'file'},-s FILE,0);
$tosendoutx.=$pars{'file'};
close(FILE);
}
}elsif($pars{'virtual'}){

$pathx=$1 if $pathx=~/^\/(.*)/;

$tosendout=AnswerRequest("GET $pars{'virtual'}",1,$pathx,$service);

$tosendoutx.=$tosendout;
}
}else{
$tosendoutx.="[Could not process this directive]";
}
}else{
/(\S+)\s*(.*)/;

if($1 eq 'if'){

if(!(eval($2))){
$nogo=1;
}

}elsif($1 eq 'else'){

$nogo=0 if $nogo;

}elsif($1 eq 'endif'){
$nogo=0;
}elsif($1 eq 'elsif'){

if(!(eval($2)) || !($nogo)){
$nogo=1;
}else{
$nogo=0;
}

}elsif(!($nogo)){



$vctcm="";
if(!($noend) && ($cnt != 1)){
if($cnt%2){
$vctcm=">";
}else{
$vctcm="<";
}
}
$noend=0;

$tosendoutx.="$vctcm$_";
}
}
}

return $tosendoutx;
}

sub AnswerRequest {


$com=(index($_[0]," ") > -1) ? lc(substr($_[0],0,index($_[0]," "))) : lc($_[0]);
$par=(index($_[0]," ") > -1) ? substr($_[0],index($_[0]," ")+1) : "";



$httpver="";
(($par=$1) && ($httpver=$2)) if $par=~/^(.*)\s*HTTP\/(.*)$/;

################################################
# GET/POST /wtv-service/DIR	  Relitive URL

# -OR-

# GET/POST http://HOST:PORT/wtv-service/DIR	  Absolute URL

# TO

# GET/POST wtv-service:/DIR

$proc="";
$disconnectd=0;
$proto="";

# This changes the backslashes to slashes.
$par=~s/\\/\//g;

if($par=~/^\/(.*)/){
($proc)=$1;

}elsif($par=~/^http:\/\//){
$proc=substr($par,8);
$proc=substr($proc,index($proc,"/")+1);


}


if($proc){
$disconnectd=1;

$par=substr($proc,0,index($proc,"/")).":/".substr($proc,index($proc,"/")+1);
print $clients "HTTP/1.1 ";
$proto="/".substr($proc,0,index($proc,"/"));
}
##################################################################################








$help="";


if(!($nogov)){

if($com eq "get" || $com eq "post"){

&SearchHTAccess($parm,$_[1],$_[4]);

$ENV{REQUEST_METHOD}=$com;


# Split URL into sections, if this URL is correct.
if($par=~m/^(\S+)\:\/(\S*)/ or $par=~m/^(\S+):(\S*)/){

$path=$2;
$service=$1;
$args="";

$proto="$service:" if !($proto);
$ENV{DOCUMENT_PROTO}=$proto;

(($args=$2) && ($path=$1)) if ($path=~/(\S*)\?(.*)/);


$args="&" if !($args);
$ENV{QUERY_STRING}=$args;


return "[ Disallowed ]" if (($path eq $_[2]) && ($service eq $_[3]));
col() if ($timestamp && ($_[1]));
$OUT->Attr($CAction | 0 , 80*25);
printx("Asked for \"$service:/$path\" ") if (($_[1]));


printx("\"$unpcm\" ") if ($unpcm && (($_[1]) || $_[2]));
$OUT->Attr($Message | 0 , 80*25);

# Check to see if service directory is actualy here.
$pointerx="";

if((opendir(DIR,"$RealDir/ServiceVault/$service") && ($pointerx="ServiceVault")) || (opendir(DIR,"$RealDir/Modules/$curmods/$service") && ($pointerx="Modules/$curmods"))){
closedir(DIR);

$path="/$path" if !($path=~/^\//);



# Get the file and back path.
$pathx=$path;
$file=(split(/\//,$path))[-1];
$path=substr($path,0,rindex($path,"/")+1);

(($file = $1) && ($ext = $2)) if $file=~/^(\S*)\.(\S*)$/;

($ext)=FileSearch("$RealDir/$pointerx/$service$path",$file) if(!($ext));


if(($log && !($_[1]) || ($_[4])) && open(LOG,">> $RealDir/LOGs/Service-Sends/$service.txt")){
print LOG uc("Log for ($clienthost:$clientport) on $formateddate").":\n$ENV{CONTENT_HEADERS}";
print LOG "CONTENT: $content" if($content);
print LOG "\n\n";
close(LOG);
}



$mime=($contentTypes{$ext}) ? $contentTypes{$ext} : $contentTypes{'default'};




if(open(F,"$RealDir/$pointerx/$service$path$file.$ext") || open(F,"$RealDir/ServiceVault/ROMCache$path$file.$ext")){


$ENV{DATE_LOCAL}=$formateddate;
$ENV{DOCUMENT_URI}="$file.$ext";


$speed2=Win32::GetTickCount();

$speed=($speed2-$speed1);
if($mime eq "application/x-perl"){

$OUT->Attr($CAction | 0 , 80*25);
printx("(PERL) -$clienthost-\n") if (($_[1]) || ($_[4]));


select($clients);


sysread(F,$tosendoutx,-s F,0);
close(F);
if(!(eval($tosendoutx))){
$error="There was a error while parsing the CGI file \"ServiceVault/$service$path$file.$ext\".  The error is as follows:\n<p><br>\n$!<p>$@";
if(!($_[1])){
print "200 OK\n";
print "Content-length: ".length($error)."\n";
print "Content-type: text/html\n\n";
print $error;
}




}



$|=1;
select(STDOUT);

}elsif($mime eq "text/parse"){

sysread(F,$tosendout,-s F,0);
close(F);

$OUT->Attr($CAction | 0 , 80*25);
printx("(Parser txt) -$clienthost-\n") if (($_[1]) || ($_[4]));
$tosendout=processChange($tosendout);

if(!($tosendout)){
print $clients "500 No data to parse.  I can't use this to send unless there is some information availavle for file \"$par\".\n\n";
}else{
print $clients $tosendout;
}



}elsif($HandleTypes{$ext}){

close(F);

$OUT->Attr($CAction | 0 , 80*25);
printx("(HANDLE-$ext) -$clienthost-\n") if (($_[1]) or ($_[4]));


#GET cgi-bin:/TestSSI.shtml
$ruun=$HandleTypes{$ext};
$ruun=~s/\%L/$RealDir\/ServiceVault\/$service$path$file.$ext/g;
$ruun=~s/\%A/$ENV{QUERY_STRING}/g;

if($ruun=~s/^:(.*)/$1/){

$ruun="&$ruun" if !($ruun=~m/^&/);

eval($ruun);

if($@){

@data=(
"Content-Type: text/html\n\n",
"Couldn't execute function correctly because:<p><br> $@"
);

}

}else{

@data=`$ruun`;
print "*@data*";
$ruun="";
}

$headerstosend="";
$headersi=0;
$tosendout="";
$status="200 OK";
$mime="";

# How to parse the @data variable.

# If CGI file begins with "http/x " then bypass header check.
# If CGI file begins with "nnn TEXT" then bypass header check.
# Get Content-Type 
# Get content-lenth if needed
# If Location: add to headers and change status to "300 Location"

if(($data[0]=~m/\d\d\d (.*)/) || ($data[0]=~m/HTTP\/(.*)/)){
print $clients join("\n",@data);
return 0;
}


foreach  (@data) {

if(!($headersi)){
chomp;
$status="300 Location" if m/location: (.*)/i;
if(!($_)){
$headersi=1;

}elsif(m/content-type: (.*)/i){

$mime=$1;

}else{
$headerstosend.=$_;
}

}else{

$tosendout.=$_;
}

}

if($mime eq ""){
$tosendout = $headerstosend . $tosendout;
$headerstosend = "";
$mime = "text/html";

}


if(($headerstosend) && !($tosendout)){

print $clients "$status\n";
print $clients "$headerstosend\n\n";
print $clients "Content-length: 0\n";
print $clients "Content-type: $mime\n";


}elsif($status && !($tosendout)){
if(substr($status,0,1) eq "2"){
print $clients "500 The emulator ran into a technical problem.  Please edit the CGI script \"\" and then try again (I only got a OK status line and this is not OK!)\n\n";

}else{
print $clients "$status\n";
}
}

return $tosendout;




}elsif($mime eq "text/x-server-parsed-html"){

$OUT->Attr($CAction | 0 , 80*25);
printx("(SSI) -$clienthost-\n") if (($_[1]) || ($_[4]));


sysread(F,$tosendout,-s F,0);
close(F);

$tosendoutx=ParseSSL("ServiceVault/$service/$path$file.$ext");

$tosendout=$tosendoutx;
$tosendoutx="";

return $tosendout;

}elsif($mime eq "application/cgi"){
close(F);

$OUT->Attr($CAction | 0 , 80*25);
printx("(CEXE) -$clienthost-\n") if (($_[1]) || ($_[4]));



@data=`ServiceVault/$service$path$file.$ext $ENV{QUERY_STRING}`;

 

$headerstosend="";
$headersi=0;
$tosendout="";
$status="200 OK";
$mime="text/html";

# How to parse the @data variable.

# If CGI file begins with "http/x " then bypass header check.
# If CGI file begins with "nnn TEXT" then bypass header check.
# Get Content-Type 
# Get content-lenth if needed
# If Location: add to headers and change status to "300 Location"
if(($data[0]=~m/\d\d\d (.*)/) || ($data[0]=~m/HTTP\/(.*)/)){
print $clients join("\n",@data);
return 0;
}

foreach  (@data) {

if(!($headersi)){
chomp;

$status="300 Location" if m/location: (.*)/i;



if(!($_)){
$headersi=1;
}elsif(m/content-type: (.*)/i){

$mime=$1;

}else{
$headerstosend.=$_;
}

}else{

$tosendout.=$_;
}
}

if(($headerstosend) && !($tosendout)){

print $clients "$status\n";
print $clients "$headerstosend\n\n";
print $clients "Content-length: 0\n";
print $clients "Content-type: $mime\n";



}elsif($status && !($tosendout)){
if(substr($status,0,1) eq "2"){
print $clients "500 The emulator ran into a technical problem.  Please edit the CGI script \"\" and then try again (I only got a OK status line and this is not OK!)\n\n";


}else{
print $clients "$status\n\n";
}
}

return $tosendout;





}elsif($mime eq "ht/auth"){
close(F);
if(!($_[1]) or ($_[4])){

$OUT->Attr($CAction | 0 , 80*25);
printx("(AUTH) -$clienthost-\n") if(($nverbose));

sysread(F,$tosendout,-s F,0);


if(HTAccess("$RealDir/ServiceVault/$service$path$file.$ext")){
return $tosendout;
}
}
}else{

$OUT->Attr($CAction | 0 , 80*25);
printx("($ext) -$clienthost-\n") if (($_[1]) or ($_[4]));

binmode(F);
sysread(F,$tosendout,-s F,0);
close(F);


return $tosendout;

}
}else{
close(F);

if(($file ne "default") and AnswerRequest("GET $proto/default",0,0,0,1)){
return $tosendout;
}



if(!($_[1])){

$OUT->Attr($CAction | 0 , 80*25);
printx("(404) -$clienthost-\n") if(($nverbose));
print $clients "404 WebTV ran into a technical problem.  Please try again.\n\n";
}


}

}else{
# Service is not available for process.
$mime="text/html";

$OUT->Attr($CAction | 0 , 80*25);
printx(" (Unavailable) -$clienthost-\n") if (($_[1]));

if($LEmail eq "YataByte\@hotmail.com"){
$message="I'm sorry to inform you but the service \"$service\" is not reachable at this time.  Place contact YataByte\@hotmail.com about this problem.";
}else{
$message="I'm sorry to inform you but the service \"$service\" is not reachable at this time.  Please contact YataByte\@hotmail.com of this issue if you know that this service should be reachable.  Otherwise contact the owner, $LicencedOwner at $LEmail and communicate to him/her about putting this service into effect.";
}

$tosendout=<<"ERIC"
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title> Service Not Available </title>
</head>
<body bgcolor="#000922" text="#CCCCCC" link="#AAAAAA" vlink="#999999" alink="#777777" fontsize="small">

<center>
<h1>Service Not Available</h1>
</center>
$message

</body>
</html>
ERIC
    ;

return $tosendout;
}



}else{

print $clients "400 Bad URL received (\"$par\").\n\n" if ($_[1]);

}


}elsif($com eq "help"){



$help=<<"HELPC"
Commands Are:\r
\r
GET/POST\r
HELP\r
CAC\r
HALT\r
RESTART\r
REHASH\r
LINK\r
UNLINK\r
TIME\r
GETINFO\r
$hcomadd

HELPC
     ;



print $clients "200 OK\r\n";
print $clients "Connection: Keep-Alive\r\n";
print $clients "Server: $serviceversion\r\n";
print $clients "Content-length: ".length($help)."\r\n";
print $clients "Content-type: text/html\r\n\r\n";
print $clients $help;


}elsif($com eq "cac"){
$help="";
@temp=$pickcli2->handles;
foreach  (@temp) {

$phst=$_->peerhost;
$pprt=($_->peerport)*1;

if(($phst && $pprt) && (!($pprt == ($clientport)*1) || ($phst ne $clienthost))){
$help.="The host ".($_->peerhost).":".($_->peerport)." has been disconnected\n";
$pickcli2->remove($_);
close($_);
}
}
$help="You are the only client connected!\n" if(!($help));


print $clients "200 OK\r\n";
print $clients "Connection: Keep-Alive\r\n";
print $clients "Server: $serviceversion\r\n";
print $clients "Content-length: ".length($help)."\r\n";
print $clients "Content-type: text/html\r\n\r\n";
print $clients $help;

}elsif($com eq "halt"){
if(($clienthost eq $serverhost) || ($clienthost eq $halthost)){
$halthost="";
$haltserver=0;
$help="Server resumed.\n";
}else{
$halthost=$clienthost;
$haltserver=1;
$help="Server halted.\n";
}


print $clients "200 OK\r\n";
print $clients "Connection: Keep-Alive\r\n";
print $clients "Server: $serviceversion\r\n";
print $clients "Content-length: ".length($help)."\r\n";
print $clients "Content-type: text/html\r\n\r\n";
print $clients $help;

}elsif($com eq "rehash"){

&getvariables;

$help="Server Rehashed\n";

print $clients "200 OK\r\n";
print $clients "Connection: Keep-Alive\r\n";
print $clients "Server: $serviceversion\r\n";
print $clients "Content-length: ".length($help)."\r\n";
print $clients "Content-type: text/html\r\n\r\n";
print $clients $help;


}elsif($com eq "unlink"){
@temp=();
$help="";

foreach $vod (@linked) {

if($vod eq $clients){
$help="Your are now unlinked.\n\n";
}else{
push(@temp,$vod);
}

}

if(!($help)){
$help="You are not linked?  How can I unlink you?\n";
}else{
if($#temp == 0){


$linked=0;

}else{
@linked=();
@linked=@temp;
@temp=();
}
}

print $clients "200 OK\r\n";
print $clients "Connection: Keep-Alive\r\n";
print $clients "Server: $serviceversion\r\n";
print $clients "Content-length: ".length($help)."\r\n";
print $clients "Content-type: text/html\r\n\r\n";
print $clients $help;

}elsif($com eq "link"){
$help="";
foreach $vod (@linked) {
if($vod eq $clients){
$help="Your already linked.\n\n";
}
}

if(!($help)){
$help="Linking the client $clienthost:$clientport\n";
$linked=1;
push(@linked,$clients);
}
print $clients "200 OK\r\n";
print $clients "Connection: Keep-Alive\r\n";
print $clients "Server: $serviceversion\r\n";
print $clients "Content-length: ".length($help)."\r\n";
print $clients "Content-type: text/html\r\n\r\n";
print $clients $help;


}elsif($com eq "time"){

$help="The current server time is ".localtime().".  This server has been up since ".localtime($starttim)." (".calcTim(0,(time-($starttim))).") and the machine uptime is ".calcTim(1,Win32::GetTickCount())."\n";

print $clients "200 OK\r\n";
print $clients "Connection: Keep-Alive\r\n";
print $clients "Server: $serviceversion\r\n";
print $clients "Content-length: ".length($help)."\r\n";
print $clients "Content-type: text/html\r\n\r\n";
print $clients $help;


}elsif($com eq "getinfo"){
foreach  (keys %contentTypes) {
$mimes.="$_ -- $contentTypes{$_}\r\n";
}foreach  (keys %ENV) {
$envsc.="$_ -- $ENV{$_}\r\n";
}


$help=<<"HELPC"
Server Software, $titlexx Information\r 

Running on: $sockhost:$rports\r
Servicing: $serviceversion\r
Server Owner: $LicencedOwner\r
Client Quota: $clientsconnectsionmax\r
Owner Contact: $LEmail\r

Supportive MIME Types:\r
$mimes

ENV Variables:\r
$envsc	

HELPC
     ;

print $clients "200 OK\r\n";
print $clients "Connection: Keep-Alive\r\n";
print $clients "Server: $serviceversion\r\n";
print $clients "Content-length: ".length($help)."\r\n";
print $clients "Content-type: text/html\r\n\r\n";
print $clients $help;

$mimes="";
$envsc="";

}elsif(($hcomadd) && ($com eq lc($hcomadd))){

$help="The client side command '$hcomadd' responce.  Server prepared for you next move.\n";

print $clients "200 OK\r\n";
print $clients "Connection: Keep-Alive\r\n";
print $clients "Server-PID: $$\r\n";
print $clients "Server-Time: ".time."\r\n";
print $clients "Server-clients: $countg < $clientsconnectsionmax\r\n";
print $clients "Server: $serviceversion\r\n";
print $clients "Content-length: ".length($help)."\r\n";
print $clients "Content-type: text/html\r\n\r\n";
print $clients $help;


}elsif($com eq "restart"){

$REHASH=1;
reset 'a-z';
system("cls");
&startServer;
&serverInterval;


}else{


print $clients "402 Unknown command \"$com\".\n";

}
}


return 0;
}

sub SearchHTAccess {

$nogov=0;
$deny=0;
$AuthUserFile="";
$AuthType="";
$AuthName="";
$GroupFile="";

if($par=~m/^(\S+)\:\/(.*)/ or $par=~m/^(\S+)\:(.*)/){
$path="$1/$2";
$path=substr($path,0,rindex($path,"/"));
$path="$RealDir/ServiceVault/$path";
}else{
$path="$RealDir/ServiceVault";
}


@ar=split(/\//,$path);

while(($path) && !($nogov)){
$path=join("/",@ar);

if(open(FILE,"$path/$htfile")){
@lines=<FILE>;
close(FILE);
foreach  (@lines) {
chomp;
next unless $_;
next if $_=~/^\#/;


if($buffer){



if($_ eq "%>"){
$buffer=0;
eval($bufff);



}elsif($_ eq "</Limit>"){
HTread(split(/\n/,$buffer));

}else{

$bufff.="$_\n";
}
}elsif($_ eq "<%perl"){

$buffer=1;

}elsif(substr($_,0,6) eq "<Limit"){
$dummy=substr($_,6);
$dummy=substr($dummy,0,index($dummy,">"));

LIM: foreach (split(/\s+/,$dummy)){
if($_ eq $com){
last LIM;
$buffer=1;
}
}



}else{
HTread($_);
}

} 
 

if($deny){
$nogov=1;
$OUT->Attr($CAction | 0 , 80*25);
printx("Unathorized \"$par\"\n") if (($_[1]) || $_[2]);
print $clients "401 Authorization is required for $ENV{REMOTE_ADDR}\n\n";


}elsif(($AuthUserFile) && ($AuthName)){

if($unpcm){
($x1,$y1)=split(/\:/,$unpcm);

open(FILE,$AuthUserFile);
foreach  (<FILE>) {
chomp;
next unless $_;

($x2,$y2)=split(/\:/,$_);


if(($x2 eq $x1) && ($y2 eq crypt($y1,substr($y2,0,2)))){
$nogov=0;
return 1;
}
}
close(FILE);


$nogov=1;


$OUT->Attr($Warning | 0 , 80*25);
printx("Password Invalid: ($par) \"$unpcm\"\n") if (($_[1]) || $_[2]);
$htmessagex=eval($htmessage);
print $clients "401 WebTV ran into a technical problem. Please try again.\n";
print $clients "Connection: Keep-Alive\n";
print $clients "WWW-Authenticate: $AuthType realm=$AuthName\n";
print $clients "Content-length: ".length($htmessagex)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $htmessagex;

}else{
if(!($AuthType)){
$AuthType="Basic";
}
$nogov=1;

$OUT->Attr($Warning | 0 , 80*25);
printx("Password Invalid: ($par) \"$unpcm\"\n") if (($_[1]) || $_[2]);
$htmessagex=eval($htmessage);
print $clients "401 WebTV ran into a technical problem. Please try again.\n";
print $clients "Connection: Keep-Alive\n";
print $clients "WWW-Authenticate: $AuthType realm=$AuthName\n";
print $clients "Content-length: ".length($htmessagex)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $htmessagex;

}
}
}


pop(@ar);
}

$OUT->Attr($Message | 0 , 80*25);

return 0;
}


sub HTread {



#if(ref($_[0]) eq "ARRAY"){

foreach  (($_[0])) {
chomp;
/(\S+)\s+(.*)/;


if($1 eq "AuthUserFile"){
$AuthUserFile=$2;
}elsif($1 eq "AuthType"){
$AuthType=$2;
}elsif($1 eq "AuthName"){
$AuthName=$2;
}elsif($1 eq "AuthGroupFile"){
$GroupFile=$2;
}elsif($1 eq "allow"){

$2=~/(\S+)\s+(.*)/;

if($1 eq "all"){
$deny=0;
}elsif($1 eq "from"){
foreach (split(/,/,$2)){
if(doYouAgree($clienthost,$_)){
$deny=0;
}
}
}elsif($1 eq "ssid"){
foreach (split(/,/,$2)){
if($userssid eq $_){
$deny=0;
}
}
}elsif($1 eq "user"){
foreach (split(/,/,$2)){
if($curuser eq $_){
$deny=0;
}
}
}



}elsif($1 eq "deny"){
$2=~/(\S+)\s+(.*)/;


if($1 eq "all"){
$deny=1;
}elsif($1 eq "from"){
foreach (split(/,/,$2)){

if(doYouAgree($clienthost,$_)){
$deny=1;
}
}
}elsif($1 eq "ssid"){
foreach (split(/,/,$2)){
if($userssid eq $_){
$deny=1;
}
}
}elsif($1 eq "user"){
foreach (split(/,/,$2)){
if($curuser eq $_){
$deny=1;
}
}
}



}elsif($1 eq "LoggedIn"){
if(!($curuser)){
$deny=1;
}

}
}



}

sub FileSearch {

if(opendir(DIR,$_[0])){
@file = grep { /^$_[1]/i && -f "$_[0]/$_" } readdir(DIR) if ($_[1]);
closedir(DIR);
}

($xddd,$ext) = ($file[0]=~/^(.*?)\.(.*)$/i);

return $ext;
}



sub checkWNIServerInterval {


$headers="";
$looklen=1;
$reqtype="";
$content="";
$lenfound=0;
$onpost=0;
$dcount=0;
$ENV{CONTENT_HEADERS}="";

# If the entire message is here process request.
foreach $cli_line (split(/\n/,$wniserverinterval{$clients})){
$dcount++;

chop($cli_line) if ($cli_line=~/\r/);
($com,$par)=($cli_line=~m/^(\S+)\s(.*)/);

if(length($cli_line) == 0){
if($reqtype eq "POST"){
if($lenfound){
$onpost=1;
}else{
print $clients "409 No content length specified for POST request.  Request discharged.\n\n";
$wniserverinterval{$clients}="";
}
}else{
$wniserverinterval{$clients}="";
$ENV{CONTENT_HEADERS}=$headers;
parseCommandsx();
}





}else{


if($onpost){


$content.=$cli_line;

if(length($content) == $lenfound){
$ENV{CONTENT_HEADERS}=$headers;
$wniserverinterval{$clients}="";
$ENV{CONTENT}=$content;
$ENV{CONTENT_LENGTH}=length($content);
parseCommandsx();
}



}else{

$headers.="$cli_line\n";

if($com eq "POST" && ($dcount == 1)){
$reqtype="POST";
$looklen=1;
}elsif(lc($com) eq "content-length:" && ($looklen)){
if($par=~/^(\d+)/){
$lenfound=$1;
$looklen=0;
}
}
}
}
}






}


return 1;