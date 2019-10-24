splice(@valueArray);
$countxz=0;
$pastcontenttype=0;
$MessageX="";
$buildX="";
$totalPartsX="";
$pathX="";
$CurPartX="";
$NextPartX="";
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
$Lagt=$valuem;
$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

if($namem eq "path"){
$pathX=$valuem;
}

if($namem eq "totalParts"){
$totalPartsX=$valuem;
}

if($namem eq "build"){
$buildX=$valuem;
}

if($namem eq "Message"){
$MessageX=$valuem;
$LagtX=$Lagt;
chop($LagtX) if $LagtX=~/ /;
}

if($namem eq "CurPart"){
$CurPartX=$valuem;
}

}


if(!($CurPartX)){
$CurPartX="1";
$CurPartXC=$CurPartX;
$CurPartXC*=1;
$CurPartXC--;
$NextPartX="2";

}else{


$CurPartXC=$CurPartX;
$CurPartXC*=1;
$CurPartXC--;
$NextPartX=$CurPartX;
$NextPartX*=1;
$NextPartX++;
}

if($totalPartsX == $CurPartX){
$URLFlash="wtv-flashrom:/lc2-download-done?path=$pathX/$CurPartX.rom";
$lastOne="true";
$MessageX="Last one!!! Have a excellent day.";
}else{
$URLFlash="wtv-build:/get-flash-start?path=$pathX&totalParts=$totalPartsX&build=$buildX&Message=$LagtX&CurPart=$NextPartX";
$lastOne="false";
$MessageX="$buildX $MessageX";
$MessageX=~s/\$CurPartX/$CurPartX/g;

}



$tosendout=<<"ERIC"	
<html>
<head>
<title>
Updating
</title>
<display switchtowebmode transition=none nostatus nooptions skipback clearback>
</head>
<body noscroll bgcolor="#191919" text="#42CC55" link="36d5ff"
hspace=0 vspace=0 fontsize="large">
<table cellspacing=0 cellpadding=0>
<tr>
<td width=104 height=74 valign=middle align=center bgcolor="3B3A4D">
<img src="wtv-build:/ROMCache/WebTVLogoJewel.gif" width=86 height=64>
<td width=20 valign=top align=left bgcolor="3B3A4D">
<img src="wtv-build:/ROMCache/Spacer.gif" width=1 height=1>
<td colspan=10 width=436 valign=middle align=left bgcolor="3B3A4D">
<font color="D6DFD0" size="+2">
<blackface>
<shadow>
<img src="wtv-build:/ROMCache/Spacer.gif" width=1 height=4>
<br>
Updating now
</shadow>
</blackface>
</font>
<tr>
<td colspan=12 width=560 height=10 valign=top align=left>
<img src="wtv-build:/ROMCache/S40H1.gif" width=560 height=6>
<tr>
<td width=104 height=10 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=68 valign=top align=left>
<td width=20 valign=top align=left>
<form action="client:poweroff">
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=9 width=100 height=258 valign=top align=left>
<font size=+1>
Your Internet terminal
is being<br>updated automatically.
<p> <font size=+1>
This will take about 23 minutes and<br>then you can use WebTV again.
</font>
<br><br><br><br><br>


<upgradeblock width=280 height=15
nexturl="$URLFlash"
errorurl="wtv-build:/lc2-download-failed?path=$pathX&last-part=$NextPartX"
blockurl="wtv-build:/$pathX/$CurPartXC.rom"
lastblock="$lastOne"
curblock="$CurPartX"
totalblocks="$totalPartsX">
<font size="-1" color="#D6DFD0">
<br>
<img src="wtv-build:/ROMCache/Spacer.gif" width=2 height=10><br>
$MessageX
<br><br>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=10 height=2 valign=middle align=center bgcolor="#191919">
<img src="wtv-build:/ROMCache/Spacer.gif" width=436 height=1>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=9 height=1 valign=top align=left>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=10 height=2 valign=top align=left bgcolor="#191919">
<img src="wtv-build:/ROMCache/Spacer.gif" width=436 height=1>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=9 height=4 valign=top align=left>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=9 width=416 valign=top align=left>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=306 valign=top align=left>
<font size="-1"><i>
</i></font><td width=112 valign=top align=right>
<font size="-1" color="#191919">
</font>
</form>
</table>
<td width=20 valign=middle align=center>
</table>
</body>
</html>

ERIC
    ;
if($httpREQ){
$tosendout=~s/wtv-build:/\/wtv-build/g;
}

print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;
