$phonelogcont="";
$countxz=0;
foreach $thethings (@headersforye) {
$countxz++;
if(lc(substr($thethings,0,index($thethings," "))) eq "content-length:"){
$pastcontenttype=1;
}
if($countxz eq ($#headersforye)+1 && $pastcontenttype){
$phonelogcont=$thethings;
}
}
print $clients "200 There is no information in the item chosed.\n\n";

addToUserFile($userssid,"ActivityLog/PhoneLog.txt","Phone Log for $formateddate ($clienthost) $mounths/$days/$years\n$phonelogcont\n\n");