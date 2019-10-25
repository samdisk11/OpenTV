##!C:/perl/bin/perl.exe -w
##########################################################################
#           WEBTV EMULATOR 2.0.5 MAIN MANIFOLD SOURCE CODE (CORE)        #
#                                                                        #
#                                                                        #
# This is a multiport/multiplexed or multithread server created by Eric  #
# MacDonald which is runned under the WE protocol version 2.0.5.  This 	 #
# server is written under the WHEU Licence and, as it says, you can      #
# modify the script but NOT create your own programs with the source     #
# code.  Most of the documentation on this server is within the help     #
# directory.                                                             #
#                                                                        #
##########################################################################




# Thanks for using WE 2.0.5.  I hope this tool is usefull to you.
# This script is made for both Linux and Win32 based Operating Systems...


#use Win32::Process;

use IO::Select;
use IO::Socket qw(INADDR_ANY);
use Cwd;
use Win32::Console;
use LWP::Simple;
#use strict;



($SIG{INT} = $SIG{TERM} = $SIG{QUIT}) = sub { InterpretMacro("close" , $_[0]); };
$starttim=time;


WE205: {

$RealDir = ($#ARGV > -1) ? $ARGV[0] : getcwd;


if($] < 5.0){
system('cls');
warn "Bad perl version, $]!\n\n";
print "This script is allowed on perl versions greater than 3.019 and less than 5.6...\nYou may now press <enter> to exit.\n";

<STDIN>;
exit;
}

$haltserver = 0;
$ServerOSENV="Win32 Frontend";
$OUT = new Win32::Console(STD_OUTPUT_HANDLE);


&startServer;
&serverInterval;





sub getvariables {
$lineazzzzc = "";
$bufferxzy = "";
$alrdgv = 1;

$Warning=$FG_RED;
$SAction=$FG_LIGHTBLUE;
$CAction=$FG_LIGHTGREEN;
$Message=$FG_LIGHTCYAN;
$Headers=$FG_LIGHTMAGENTA;
$TimeStampX=$FG_CYAN;

$OUT->Attr($FG_WHITE | 0 , 80*25);

open(FILE , "< $RealDir/Config.ini");


foreach $line (<FILE>) {

next if $line=~/^\#/;
next if $line=~/^\[/;

chomp($line);

@foo = ($line=~m/^(\S+)\s*=\s*(.*)/);

$foo[1]=substr($foo[1],0,index($foo[1],";"));

$foo[0]=lc($foo[0]);

next unless ($foo[0] && $foo[1]);


if ($foo[0] eq "serverip") {

printx("Server Address: $foo[1]\n") if ($nverbose);
$serveraddress = $foo[1];

} elsif ($foo[0] eq "logos") {

$OSh=$foo[1];

} elsif ($foo[0] eq "log") {

$log=$foo[1];

} elsif ($foo[0] eq "addpath") {

$ENV{PATH}.=";$foo[1]";


} elsif ($foo[0] eq "logc") {

$logc=$foo[1];


} elsif ($foo[0] eq "openv") {

$menc=$foo[1];

} elsif ($foo[0] eq "openv") {

$openv=$foo[1];

} elsif ($foo[0] eq "lemail") {

$LEmail=$foo[1];

} elsif ($foo[0] eq "lown") {

$LicencedOwner=$foo[1];

} elsif ($foo[0] eq "pathv") {
$pathv=$foo[1];

} elsif ($foo[0] eq "addetype") {


$exec=substr($foo[1],0,rindex($foo[1]," "));
$tv=substr($foo[1],rindex($foo[1]," ")+1);



foreach  (split(/,/,$tv)){
$HandleTypes{$_}=$exec;


}


} elsif ($foo[0] eq "addtype") {
$foo[1]=~m/(\S+)\s+(.*)/;

foreach  (split(/,/,$2)){
$contentTypes{$_}=$1;

}

} elsif ($foo[0] eq "htmessage") {

$htmessage=$foo[1];

} elsif ($foo[0] eq "listenport") {



printx("Port to listed on: $foo[1]\n") if ($nverbose);
$listenport = $foo[1];

} elsif ($foo[0] eq "maxclients") {

printx("Max Peer Sockets: $foo[1].\n") if ($nverbose);
$clientsconnectsionmax = $foo[1];

} elsif ($foo[0] eq "floodinten") {

printx("Flood Intensity: $foo[1].\n") if ($nverbose);
$FloodInten=$foo[1]*1;


} elsif ($foo[0] eq "intelstable") {

printx("Intelligent Flood Protection.\n") if ($nverbose);
$IntelStable = $foo[1];

} elsif ($foo[0] eq "defaults") {



printx("Default Service: $foo[1].\n") if ($nverbose);
$DefaultS = $foo[1];
$curmods  = $DefaultS
} elsif ($foo[0] eq "truefileserver") {

printx("True HTTP file server.\n") if ($nverbose);
$TrueFileServer = $foo[1];

} elsif ($foo[0] eq "title") {
$titlexx=$foo[1];
$OUT->Title($foo[1]);

} elsif ($foo[0] eq "verbose") {


$nverbose=($foo[1]*1);

} elsif ($foo[0] eq "timestamp") {

printx("Apending a timestamp to event draw.\n") if ($nverbose);
$timestamp = $foo[1];



} elsif ($foo[0] eq "warning"){  
$Warning=colorChart($foo[1]);
} elsif ($foo[0] eq "saction"){ 
$SAction=colorChart($foo[1]);
} elsif ($foo[0] eq "caction"){
$CAction=colorChart($foo[1]);
} elsif ($foo[0] eq "message"){ 
$Message=colorChart($foo[1]);
} elsif ($foo[0] eq "headers"){
$Headers=colorChart($foo[1]);
} elsif ($foo[0] eq "times"){
$TimeStampX=colorChart($foo[1]);
} elsif ($foo[0] eq "servicemaddy") {
printx("Psudo Mail Domain: $foo[1]\n") if ($nverbose);
$ServerMailaddress = $foo[1];

} elsif ($foo[0] eq "require") {

printx("Require: $foo[1]\n") if ($nverbose);
require $RealDir . "\\" . $foo[1];
 
} elsif ($foo[0] eq "htfile") {
printx("HTAccess File: $foo[1]\n") if ($nverbose);

$htfile=$foo[1];
} elsif ($foo[0] eq "debug") {
if($foo[1] eq "on"){
if (open(MACRO , "< $RealDir/MacroScripts/Debug.wtv")) {
sysread(MACRO,$bufferxzyc,-s MACRO,0);
close(MACRO);
$bufferxzy.="\n" . $bufferxzyc;
printx("Debugging is on...\n") if ($nverbose);

} else {
printx("Debugging is inable to be turned on...\n") if ($nverbose);

}

}
} elsif ($foo[0] eq "serviceversion") {

printx("File Service Version: $foo[1]\n") if ($nverbose);
$serviceversion = $foo[1];

} elsif ($foo[0] eq "useendpointtokens") {

printx("Empoint Token Enabled\n") if ($nverbose);
$useEndpointTokens = $foo[1];

} elsif ($foo[0] eq "script") {

printx("Loading Script File ($foo[1]).\n") if ($nverbose);
if (open(MACRO , "< $RealDir/$foo[1]")) {
sysread(MACRO,$bufferxzyc,-s MACRO,0);
close(MACRO);
$bufferxzy.="\n" . $bufferxzyc;
} else {
$OUT->Attr($Warning | 0 , 80*25);
printx("Couln't open macro file , $foo[1].\n") if ($nverbose);
$OUT->Attr($FG_WHITE | 0 , 80*25);

}

}


}
##############################################

close(FILE);




$OUT->Attr($Message | 0 , 80*25);



}


sub chopwhitespace {
$tobec=$_[0];
while (substr($tobec,0,1) eq " ") {
$tobec=substr($tobec,1);
}
return $tobec;

}





sub setvariable {

my ($variable , $value) = @_;

col() if ($timestamp);
$OUT->Attr($SAction | 0 , 80*25);
printx("Changing $variable to $value\n") if ($nverbose);
$OUT->Attr($Message | 0 , 80*25);

open(FILE , "< $RealDir/Config.ini");
@stuff = <FILE>;
close(FILE);


open(FILE , "> $RealDir/Config.ini");



foreach $line (@stuff) {
chop($line);
($variableb , $valueb) = split(/=/ , $line);

if ($variable eq $variableb) {
print FILE "$variable=$value\n";
} else {
print FILE "$line\n";
}
}
close(FILE);
&getvariables;

}




sub InterpretMacro {

foreach $keys (keys %macro) {

($tik,$per,$con)=split(/:/,$macro{$keys}[0]);

if(($tik eq "On" && doYouAgree($_[0],$keys)) or ($tik eq "Non" && !(doYouAgree($_[0],$keys)))){
$per=($per eq "local"  && ($clienthost eq $sochhost)) ?  "*" : $per;
$per=($per eq "remote" && ($clienthost ne $sockhost)) ?  "*" : $per;

if(eval($con) && doYouAgree($_[1],$per)){
eval($macro{$keys}[1]);
if($@){
col() if ($timestamp);
$OUT->Attr($Warning | 0 , 80*25);
printx("Eval error for macro \"$per:$keys:$con\": \"$@\"");
$OUT->Attr($Message | 0 , 80*25);

}
}


}
}
}


sub LoadMacro {


# macro    = space* ("On" | "Non") space* deciding:trailing
# deciding = perminable ":" command ":" condition
# trailing = ("{") PERL ("}")

$otherbuff="";
$maclast="";
foreach $line (split(/\n/,$bufferxzy)) {
chomp($line);
if($line=~/^\s*(On|Non)\s*(.+):(.+):(.+):(.*)/){


if($maclast){
$macro{$maclast}[1].=$otherbuff;
$maclast="";
$otherbuff="";
}


$otherbuff="";
$maclast=$3;
$macro{$3}[0] = "$1:$2:$4";
$macro{$3}[1] = $5;


}else{
$otherbuff.="$line\n";
}
}



if($maclast){
$macro{$maclast}[1].=$otherbuff;
$maclast="";
$otherbuff="";
}

}

sub doYouAgree {

$mainxxx = $_[0];
$keywordxxx = $_[1];
$returnvaluexxx = 1;


$lastxxx = 0;
@quadrium=();
if($keywordxxx=~/\*/){
return 1;
}else{


foreach $tokenxxx (split(/\*/ , $keywordxxx)) {
push(@quadrium , index($mainxxx , $tokenxxx));
}

foreach $linemensxxx (@quadrium) {
if ($returnvaluexxx) {
if ($linemensxxx >=  $lastxxx) {
$returnvaluexxx = 1;
} else {
$returnvaluexxx = 0;
}
$lastxxx = $linemensxxx;
}
}

return $returnvaluexxx;
}
}


sub processChange {
$returnvaluexx=$_[0];

$returnvaluexx=~s/\%\%\%//g;

$timesc = "$hours:$minutes";


$returnvaluexx =~s/%ip/$clienthost/g;
$returnvaluexx =~s/%port/$clientport/g;
$returnvaluexx =~s/%lip/$sockhost/g;
$returnvaluexx =~s/%lport/$sockport/g;
$returnvaluexx =~s/%url/$params/g;
$returnvaluexx =~s/%source/$sourcexaq/g;
$returnvaluexx =~s/%headers/$headerxaq/g;
$returnvaluexx =~s/%time/$timesc/g;
$returnvaluexx =~s/%sending/$returnvaluexx/g;
$returnvaluexxX=substr($returnvaluexx,index($returnvaluexx,"\x0D\x0A\x0D\x0A"));
$larglym=(length $returnvaluexxX)-4;
$returnvaluexx =~s/%bytes/$larglym/g;

return $returnvaluexx;
}


sub getTicket {

$IP=$_[0];
$URL=$_[1];


$sock = IO::Socket::INET->new(($IP=~/^.*?:\d*/) ? $IP : "$IP:1601") || return;

if ($URL){
printx("Getting Ticket from $URL\n");
print $sock "GET $URL\n\n";
}else{
printx("Getting Ticket from wtv-head-waiter:/login\n");
print $sock "GET wtv-head-waiter:/login\r\n\r\n";
}


while(<$sock>) {

chomp;


if(/^wtv-ticket\:/){

close($sock);
return $_;

}elsif(!($_)){

getTicket($IP,"wtv-head-waiter:/account-needs-redial") if !($URL);

}



}


return;
}

sub calcSubTime {
($aa , $bb , $cc , $dd , $ee , $ff) = @_;
if ($ff > $cc) {
$bb--;
$cc = $cc+60;
$secvalue = $cc-$ff;
} else {
$secvalue = $cc-$ff;
}
if ($ee > $bb) {
$aa--;
$bb = $bb+60;
$minvalue = $bb-$ee;
} else {
$minvalue = $bb-$ee;
}

$hrvalue = $aa-$dd;

return "$hrvalue hours $minvalue minutes $secvalue seconds";
}


}






sub startServer {




if(!($alrdgv)){
&getvariables;
&LoadMacro;
}

if(!($serveraddress)){
$serveraddress = INADDR_ANY;
}
#REMOTE_ADDR
#REMOTE_HOST
#AUTH_TYPE
#CONTENT_LENGTH
#CONTENT_TYPE
#PATH_INFO
#PATH_TRANSLATED
#QUERY_STRING
#REMOTE_IDENT
#REMOTE_USER
#REQUEST_METHOD
#SCRIPT_NAME

$ENV{SERVER_PORT}=$listenport;
$ENV{GATEWAY_INTERFACE}="CGI/1.1";
$ENV{SERVER_PROTOCOL}="WE (scom HTTP)";
$ENV{SERVER_SOFTWARE}="WebTV Protocol Emulator 2.0.5 (scom HTTP)";



$pickcli1=IO::Select->new;

foreach $listenport (split(/\,/,$listenport)) {

$server = IO::Socket::INET->new(Proto=>"tcp" , LocalPort=>$listenport , 
LocalAddr=>$serveraddress , Listen=>10 , Reuse=>1) || die "Socket init for $listenport: $!";;
push(@portarr,$listenport) if $server;
$pickcli1->add($server);
}



$pickcli2=IO::Select->new($pickcli1->handles);		

}


sub serverInterval {

#if($openv){

#Win32::Process::Create($WTV_V,$pathv,undef,0,NORMAL_PRIORITY_CLASS | CREATE_DEFAULT_ERROR_MODE,$RealDir);
#print "Opening \"$pathv\" on ".$WTV_V->GetProcessID()."\n";

#}


print "\n\n" if ($nverbose);;

$sockhost=$server->sockhost;
$sockport=$portarr[0];
$ENV{SERVER_NAME}=$sockhost;



InterpretMacro("open" , '*');
$OUT->Attr($Message | 0 , 80*25);
print "Welcome $LicencedOwner, we now have jettison!\n\n" if ($nverbose);
$OUT->Attr($Message | 0 , 80*25);
$rports=join(",",@portarr);
print "I got my ear on $sockhost:$rports\n\n" if ($nverbose);

print "The WebTV Emulator is now running on port(s) $rports on ".($LicencedOwner)."'s computer ($sockhost)." if !($nverbose);



while(1){
($secsq , $minutes , $hours , $days , $mounths , $years , $dow) = localtime(time);
$years+=1900;

$formateddate = localtime;	
$dow++;

$mounths++;
if($hours > 12){
$hours=($hours-12);
}

if (length("$minutes") == 1) {
$minutes="0$minutes";
}




foreach $clients ($pickcli2->can_read) {


if($pickcli1->can_read(0)){
foreach $servers ($pickcli1->can_read(0)) {
if($clients == $servers){
$add=$servers->accept;


$pickcli2->add($add);
$countg=$pickcli2->count;	# $count is used in IO::Select so im going to change this so I wont cause problems.


if ($countg > $clientsconnectsionmax) {
print $add "500 Server is closing your client due to quota limit!\n\n";
close $add;
col() if ($timestamp);
$OUT->Attr($Warning | 0 , 80*25);
printx("Server is closing a client due to quota limit\n") if ($nverbose);
$OUT->Attr($Message | 0 , 80*25);

} else {

InterpretMacro("connect" , $add->peerhost);
$clientlog{$add->peerhost.":".$add->peerport}=[("$hours:$minutes.$secsq",$servers->sockport,$count)];
col() if ($timestamp);
$OUT->Attr($CAction | 0 , 80*25);
printx("Peer Connect: ".$add->peerhost.":".$add->peerport." => (".$servers->sockport.") Total: $countg\n") if ($nverbose);
$OUT->Attr($Message | 0 , 80*25);

}



}
}


} else {

($clienthost = ($ENV{REMOTE_ADDR})) = $clients->peerhost;
($clientport = ($ENV{REMOTE_PORT})) = $clients->peerport;
$ENV{REMOTE_HOST} =  $clienthost;






if(sysread($clients , $headersv , 1024 , 0)){
$mode=4;



InterpretMacro("" , $clienthost);

$headersv="";
}else{
col() if ($timestamp);
$OUT->Attr($CAction | 0 , 80*25);
printx("Peer Disconnect: $clienthost:$clientport => (".$clientlog{"$clienthost:$clientport"}[1].")\n") if ($nverbose);
$OUT->Attr($Message | 0 , 80*25);
delete $clientlog{"$clienthost:$clientport"};
delete $wniserverinterval{$clients};
InterpretMacro('disconnect' , $clienthost);
$pickcli2->remove($clients);


}





}
}
}

}

sub Encrypt {
# Resources:

# http://secinf.net/
# http://netsecurity.about.com/
# http://www.hypersven.com/internet_security/glossary.html
# http://www.antibozo.net/ogata/security/overview/
# http://globecom.net/ietf/draft/draft-newman-auth-scram-03.html
# http://www.cubix.com/support/techinfo/manuals/wd/wd-c7.htm
# http://catalog.com/sft/encrypt.html
# http://vader.brad.ac.uk/tea/tea.shtml
# http://www.jjtc.com/Security/crypto.htm
# http://hotwired.lycos.com/webmonkey/programming/php/tutorials/tutorial1.html

$sd=length($RealDir);

srand((time^$$)-$sd);

$key=rand(rand(100+rand(100024)));


}


sub colorChart {
#BLACK        (1)
#BLUE         (2)
#LIGHTBLUE    (3)
#RED          (4)
#LIGHTRED     (5)
#GREEN        (6)
#LIGHTGREEN   (7)
#MAGENTA      (8)
#LIGHTMAGENTA (9)
#CYAN         (10)
#LIGHTCYAN    (11)
#BROWN        (12)
#YELLOW       (13)
#GRAY         (14)
#WHITE        (15)
$colorX=($_[0])*1;


if($colorX == 1){
return $FG_BLACK
}elsif($colorX == 2){
return $FG_BLUE
}elsif($colorX == 3){
return $FG_LIGHTBLUE
}elsif($colorX == 4){
return $FG_RED
}elsif($colorX == 5){
return $FG_LIGHTRED
}elsif($colorX == 6){
return $FG_GREEN
}elsif($colorX == 7){
return $FG_LIGHTGREEN
}elsif($colorX == 8){
return $FG_MAGENTA
}elsif($colorX == 9){
return $FG_LIGHTMAGENTA
}elsif($colorX == 10){
return $FG_CYAN
}elsif($colorX == 11){
return $FG_LIGHTCYAN
}elsif($colorX == 12){
return $FG_BROWN
}elsif($colorX == 13){
return $FG_YELLOW
}elsif($colorX == 14){
return $FG_GRAY
}elsif($colorX == 15){
return $FG_WHITE
}


}

sub calcTim {

$secs=0;
$min=0;
$hour=0;
$days=0;


$time=($_[1]*1);
if($_[0]){
$time=int(($_[1])/1000);
}

$secs=$time%60;
$min=int($time/60);

if($min > 60){
$hour=int($min/60);
$min=$min%60;


if($hour > 24){

$days=int($hour/24);
$hour=$hour%24;

}




}


$secs=!($secs) ? "" : (($secs > 1) && $secs) ? "$secs Seconds" : "$secs Second";
$min=!($min) ? "" : (($min > 1) && $min) ? "$min Minutes " : "$min Minute ";
$hour=!($hour) ? "" :(($hour > 1) && $hour) ? "$hour Hours " : "$hour Hour ";
$days=!($days) ? "" : (($days > 1) && $days) ? "$days Days " : "$days Day ";

return "$days$hour$min$secs";

}

sub printx {

if($linked){
foreach $vod (@linked) {
if($clients ne $vod){
print $vod $_[0]
}
}
}

print STDOUT $_[0];

}

sub col {

$OUT->Attr($TimeStampX | 0 , 80);
printx("{$hours:$minutes} ") if($nverbose);
$OUT->Attr($Message | 0 , 80*25);


}



__END__
