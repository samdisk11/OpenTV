


splitq("$ENV{QUERY_STRING}&$ENV{CONTENT}");
$SL="";
$TL="";
$activate="";
$servList="";
$servTick="";
$bURL="";
$TLs="";
$SLs="";
$bTS="";
$addOn="";
$IPP="";


foreach (keys %qrs){


if($_ eq "activate"){
$activate=$qrs{$_};
}elsif($_ eq "addOn"){
$addOn=$qrs{$_};
}elsif($_ eq "servList"){
$servList=$qrs{$_};
}elsif($_ eq "servTick"){
$servTick=$qrs{$_};
}elsif($_ eq "IPP"){
$IPP=$qrs{$_};
}elsif($_ eq "bTS"){
$bTS=$qrs{$_};
}elsif($_ eq "bURL"){
$bURL=$qrs{$_};
}
}


if(($activate) && ($servList) && ($bURL)){

if(open(FILE,"< ServiceDB/ServiceLists/$servList")){
sysread(FILE,$services,-s FILE);

$servTick=~m/(.*?)\:(.*)/;

$ticket=$1;
$Svcook=$2;

if(!($ticket) && !($IPP)){
print "500 No ticket or IP given.\n\n";
}elsif(!($ticket) && ($IPP)){
$ticket=getTicket($IPP);
}


if($ticket){

$addOn="Content-type: text/html\nContent-length: 0\n" if !($addOn);

print "200 OK\n";
print "wtv-ticket: $ticket\n";
print "wtv-service-cookie: $Scook\n" if ($Svcook);
print "$services\n" if ($services);
print "$addOn\n";
print "wtv-visit: $bURL\n\n";
}else{

print "500 I have no ticket!\n\n";


}





}else{

print "500 Couldn't open service list file \"\$EMU_ROOT/ServiceDB/ServiceLists/$servList\"\n\n";

}


}else{

open(FILE,"ServiceDB/ServiceLists.txt");
$num=0;
while(<FILE>){
chomp;
if($_){

/^(\S*)\:(.*?)\:(.*)/;
$SL.="<option value='$3'>$1\n";
$SLs.="SL[$num]=\"$2\";\n";
$num++;
}
}
close(FILE);


if(!($addOn)){
open(FILE,"ServiceDB/DefaultAddON.txt");
sysread(FILE,$addOn,-s FILE);
close(FILE);
}

open(FILE,"ServiceDB/Tickets.txt");
$num=1;
while(<FILE>){
chomp;

if($_){
/^(\S*)\:(.*?)\:(.*?)\:(.*)/;
$TL.="<option value='$3--$4'>$1\n";
$TLs.="TL[$num]=\"$2\";\n";
$num++;
}
}
close(FILE);

$tosendout=<<"ERIC"	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> Service Menu </TITLE>
<script>
document.forms[0].activate=0;

SL=new Array();
$SLs
TL=new Array();
TL[0]="Auto Retrieve"
$TLs


function checkForm(){

if((document.forms[0].servList.selectedIndex > -1) && (document.forms[0].servTick.selectedIndex > -1) && (document.forms[0].bURL.value)){
document.forms[0].activate.value=1;
return true;
}else{
alert('The whole form was not compleated to my needs.');
return false;
}

}

function checkF(a,b,c){
document.forms[0].infoWin.value="Ticket:  "+TL[b]+"\\n\\nService List:  "+SL[a];

if(c && (b == 0)){

document.forms[0].A.readonly=0;
document.forms[0].IPP.readonly=0;
document.forms[0].A.value="IP:PORT"
document.forms[0].IPP.focus();
}else{

if(b > 0){
document.forms[0].A.readonly=1;
document.forms[0].IPP.readonly=1;
document.forms[0].IPP.blur();

document.forms[0].A.value="";
document.forms[0].IPP.value="";
}
}
}
</script>
</HEAD>
<body bgcolor="#000922" text="#CCCCCC" link="#AAAAAA" vlink="#999999" alink="#777777" fontsize="small">

<center>
<h1>Service Menu</h1>
</center>
<p>&nbsp;
<p>
This is the service menu this tool is used to connect to WebTV services very quickly with verry little thinking.
<p>
<form>

<input type="hidden" name="activate" value=0>

<b>Service List</b>:<p>

<select name="servList" size=6 width=220 showempty onChange="checkF(this.selectedIndex,servTick.selectedIndex)">
$SL
</select>
<p>
<b>Service Tickets</b>:<p>

<table><tr><td></td><td><font color="#CCCCCC"><b><input type="text" name="A" bgcolor="#000922" value="" nohighlight border=0 readonly usestyle></b></td><tr><td>
<select name="servTick" size=6 width=220 showempty  onChange="checkF(servList.selectedIndex,this.selectedIndex,1)">

<option>Find AD Ticket for IP:
$TL
</select>
</td><td valign="top"><input type="text" name="IPP" bgcolor="#000922" value="$IPP" nohighlight border=0 text="#CCCCCC" readonly></td></tr></table>
<p>

<b>Information Window</b>:<p>
<textarea name="infoWin" cols="100%" bgcolor="#000922" nohighlight border=0 growable text="#CCCCCC" readonly>
No information at this time.
</textarea>
<p>
<hr noshade>
<p>
<table cellspacing=3><tr><td>
<b>Boot URL</b>:</td><td bgcolor="#000000"><input type="text" name="bURL"  value="$bURL" bgcolor="#000922" text="#CCCCCC" nohighlight border=0></td></tr>
<td><b>Boot TS</b></td><td><input type="checkbox" name="bTS" checked="$bTS"></td></tr>
</table>
<p>
<input type="submit" onClick="checkForm()" value="Setup">
<p>
<table cellspacing=3 width="100%"><tr><td valign="top">
<b>Add-on Headers</b>:<p></td><td bgcolor="#000000">
<font size="1" color="#CCCCCC">
<textarea cols="100%" rows="10%" name="addOn" bgcolor="#000922" nohighlight border=0 growable usestyle>$addOn</textarea>
</font>
</td></tr>
</table>
<p>
<input type="submit" onClick="checkForm()"  value="Setup">




</BODY>
</HTML>
ERIC
    ;


print "200 OK.\n";
print "Content-length: ".length($tosendout)."\n";
print "Content-type: text/html\n\n";
print $tosendout;
}