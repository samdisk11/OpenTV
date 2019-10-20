$TCPlogcont="";
$countxz=0;
foreach $thethings (@headersforye) {
$countxz++;
if(lc(substr($thethings,0,index($thethings," "))) eq "content-length:"){
$pastcontenttype=1;
}
if($countxz eq ($#headersforye)+1 && $pastcontenttype){
$TCPlogcont=$thethings;
}
}
print $clients "500 There is no information in the item chosed.\n\n";

addToUserFile($userssid,"ActivityLog/TCPLog.txt","TCP Log for $formateddate ($clienthost):\n$TCPlogcont\n");