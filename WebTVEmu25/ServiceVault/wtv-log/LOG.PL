$countxz=0;
$script="";
$version="";
$action="";
$logwrite="";
$logtype="";
$logurl="";
$loglasturl="";
$caret="";
$logline="";
$pastcontenttype=0;
splice(@valueArray);
$thethings="";

foreach $thethings (@headersforye) {
$countxz++;
if(lc(substr($thethings,0,index($thethings," "))) eq "content-length:"){
$pastcontenttype=1;
}

if($countxz eq ($#headersforye)+1 && $pastcontenttype){
$logcont=$thethings;
}
}

@valueArray=split(/\&/,$qurey);

foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);

$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

if($namem eq "type"){
$logtype=$valuem;
}
if($namem eq "action"){
$action=$valuem;
}
if($namem eq "url"){
$logurl=$valuem;

}
if($namem eq "last"){
$loglasturl=$valuem;
}
if($namem eq "version"){
$version=$valuem;

}
if($namem eq "script"){
$script=$valuem;
}
if($namem eq "caret"){
$caret=$valuem;
}
if($namem eq "line"){

$logline=$valuem;
}


}


if(!($logtype)){
print $clients "500 No log type.\n\n";
}else{

$logwrite.="Date Box Logged: $formateddate ($clienthost)\n";
$logwrite.="A log of the type: $logtype\n";
$logwrite.="The action the box preformed: $action ($clienthost)\n" if $action;
$logwrite.="The page where the log triggered: $logurl\n" if $logurl;
$logwrite.="The page before the log triggered: $loglasturl\n" if $loglasturl;
$logwrite.="The box version: $version\n" if $version;
$logwrite.="Line where it had the problem: $logline\n" if $logline;
$logwrite.="JellyScript content target location: $caret\n" if $caret;
$logwrite.="JellyScript bad content: $script\n" if $script;
$logwrite.="Additional information is as follows: $logcont\n" if $logcont;


print $clients "400 There is no information in the item chosed.\n\n";

addToUserFile($userssid,"ActivityLog/$logtype.txt","$logwrite\n\n");
}


