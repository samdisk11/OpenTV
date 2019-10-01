
if($ServerOSENV ne "Linux Frontend"){
$e=Win32::GetTickCount();
$e="$e Miliseconds";

$g=Win32::GetCwd();
$f=Win32::GetLastError();
$d=Win32::LoginName();
$c=Win32::BuildNumber();
$b=Win32::GetChipName();
($x,$x,$x,$a,$a2)=Win32::GetOSVersion();



if($a2 == 0){
$a2="Win32 OS";
}elsif($a2 == 1){
$a2="Windows 9X";
}elsif($a2 == 2){
$a2="Windows NT";
}


$tosendout=<<"ERIC"	
<body bgcolor="#000033" text="#999999">
<center>
<h1>Server Enviormemt</h1>
</center><p>
<table>

<tr><td>Operating System:</td><td>$a2 (Build: $a)</td></tr>
<tr><td>Server Type:</td><td>$ServerOSENV</td></tr>
<tr><td>CPU Type:</td><td>$b</td></tr>
<tr><td>Active Perl Build:</td><td>$c</td></tr>
<tr><td>User Name:</td><td>$d</td></tr>
<tr><td>UpTime:</td><td>$e</td></tr>
<tr><td>Last Error:</td><td>$f</td></tr>
<tr><td>CWD:</td><td>$g</td></tr>
</table>

ERIC
    ;

}else{

$aD=`uptime`; 
$aC=`users`; 


if(!($aC)){
$aC="[None]";
}

$tosendout=<<"ERIC"	
<body bgcolor="#000033" text="#999999" fontsize="small">
<center>
<h1>Server Enviormemt</h1>
</center><p>
<table>

<tr><td>Operating System:</td><td>Linux</td></tr>
<tr><td>Server Type:</td><td>$ServerOSENV</td></tr>
<tr><td>User Name(s):</td><td>$aC</td></tr>
<tr><td>UpTime:</td><td>$aD</td></tr>
<tr><td>CWD:</td><td>$RealDir</td></tr>
</table>

ERIC
    ;

$aF="";
$aE="";
$aD="";
$aC="";

}
print $clients "200 OK.\n";
print $clients "wtv-service: name=wtv-1800 host=$sockhost port=$sockport flags=0x04\n";
print $clients "wtv-service: name=wtv-tricks host=$sockhost port=$sockport flags=0x04\n";
print $clients "wtv-service: name=wtv-help host=$sockhost port=$sockport flags=0x04\n";
print $clients "wtv-service: name=wtv-star host=$sockhost port=$sockport flags=0x04\n";
print $clients "wtv-service: name=wtv-debug host=$sockhost port=$sockport flags=0x04 connections=3\n";
print $clients "wtv-service: name=wtv-help host=$sockhost port=$sockport flags=0x04\n";
print $clients "wtv-service: name=wtv-SrvTrigger host=$sockhost port=$sockport flags=0x04\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;
