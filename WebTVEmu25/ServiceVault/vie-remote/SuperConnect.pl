splitq("$ENV{QUERY_STRING}&$ENV{CONTENT}");
$sticket="";
$beginL=0;
# This will be overrided if one of these services are needed on the other end.

$sSuperSized="wtv-service: name=wtv-1800 host=$sockhost port=$sockport flags=0x04\n";
$sSuperSized.="wtv-service: name=wtv-tricks host=$sockhost port=$sockport flags=04\n";

$beginL=length($sSuperSized);

$sLinks="";



foreach (keys %qrs){
($shost,$sport)=split(/\:/,$qrs{$_});;


if($_ eq "wtv-head-waiter"){
$sticket=getTicket($shost);
$sSuperSized.="wtv-service: name=wtv-head-waiter host=$shost port=$sport\n";;

$temp="";
$temp=$NonToks{"wtv-head-waiter"};
$temp=~s/(.*?),/\<a href=javascript:Workarnd\(\'$1\'\)\>$1<\/a\><br>\n/g;
$sLinks.=$temp;

}elsif($shost && $sport){
$temp="";

if($temp=$NonToks{$_}){
$temp=~s/(.*?),/\<a href=javascript:Workarnd\(\'$1\'\)\>$1<\/a\><br>\n/g;
$sLinks.=$temp;
}

$sSuperSized.="wtv-service: name=$_ host=$shost port=$sport\n";;
}
}

if(length($sSuperSized) != $beginL){
if(!($sticket)){
print "500 ticket not available.  Please choose another head-waiter service.\n\n";
}else{

$tosendout=<<"ERIC"
<html>
<head>
<script>
function Workarnd(a){
document.open("text/url");
document.write(a);
document.close();
}
</script>

<title> Service is setup </title>
</head>
<body bgcolor="#000033" text="#999999" vlink="#999999" link="#999999" fontsize="small">
<center>
<h1>Service is setup</h1>
</center>
<p>
The service list is now setup with the appropriate ticket.<p>
<hr noshade><p>$sLinks<p>
<pre><font size=1>
$sSuperSized
</font>
</pre>
</body>
</html>


ERIC
    ;


print "200 OK\n";
print "wtv-service: reset\n";
print "$sSuperSized";
print "$sticket\n";
print "Content-length: ".length($tosendout)."\n";
print "Content-Type: text/html\n\n";
print $tosendout;


}


}else{

$stufftosendout=<<"ERIC"
<html>
<head>
<title>Super Connections</title>
<script>

function SFfill(){

a=document.a.Rhyzopoda2.options[document.a.Rhyzopoda2.selectedIndex].value
b=document.a.Rhyzopoda2.options[document.a.Rhyzopoda2.selectedIndex].text

if(!(a)){

document.a.SFS.value=b;

}



}


function TTWH(){



var SF=document.a.SFS.value;
document.b.elements[0].value=SF;
document.b.elements[3].value=SF;
document.b.elements[4].value=SF;
document.b.elements[5].value=SF;
document.b.elements[7].value=SF;
document.b.elements[9].value=SF;
document.b.elements[12].value=SF;
document.b.elements[17].value=SF;
document.b.elements[20].value=SF;
document.b.elements[24].value=SF;
document.b.elements[25].value=SF;
document.b.elements[33].value=SF;

var SL=document.a.SLS.value;
document.b.elements[1].value=SL
document.b.elements[6].value=SL
document.b.elements[10].value=SL
document.b.elements[14].value=SL
document.b.elements[18].value=SL
document.b.elements[19].value=SL
document.b.elements[20].value=SL
document.b.elements[21].value=SL
document.b.elements[25].value=SL
document.b.elements[26].value=SL
document.b.elements[27].value=SL
document.b.elements[28].value=SL
document.b.elements[32].value=SL

var CS=document.a.CS.value;
document.b.elements[13].value=CS

var NS=document.a.NS.value;
document.b.elements[15].value=NS

var PS=document.a.PS.value;
document.b.elements[31].value=PS

var SS=document.a.SS.value;
document.b.elements[2].value=SS

var BS=document.a.PBS.value;
document.b.elements[29].value=BS





}

function teardown(){
var SF=document.a.SFS.value;
if(SF){

document.a.SLS.value=SF;
document.a.CS.value=SF;
document.a.NS.value=SF;
document.a.PS.value=SF;
document.a.SS.value=SF;
document.a.PBS.value=SF;
}else{
alert("No storefull service!");
}
}

function setFastCon(){
var SF=document.a.SFS.value;
var SL=document.a.SLS.value;
var CS=document.a.CS.value;
var NS=document.a.NS.value;
var PS=document.a.PS.value;
var SS=document.a.SS.value;
var BS=document.a.PBS.value;


A="wtv-head-waiter="+SF+":1601&news="+SF+":1605&wtv-news="+SF+":1605&wtv-forum="+SF+":1605&wtv-register="+SF+":1607&wtv-mail="+SF+":1608&mailto="+SF+":1608&wtv-favorite="+SF+":1611&wtv-setup="+SF+":1613&wtv-flashrom="+SF+":1618&wtv-explore="+SF+":1625&wtv-explore2="+SF+":1625&wtv-chat="+SF+":1630&wtvchat="+SF+":1630&wtv-disk="+SF+":1635&wtv-tutorial="+SF+":1636&wtv-music="+SF+":1656&wtv-tricks="+SL+":1602&wtv-log="+SL+":1609&wtv-guide="+SL+":1621&wtv-intro="+SL+":1621&wtv-content="+SL+":1629&wtv-smartcard="+SL+":1632&wtv-center="+SL+":1639&wtv-home="+SL+":1612&wtv-spot="+SL+":1642&wtv-passport="+SL+":1654&wtv-cookie="+CS+":1619&wtv-notices="+NS+":1621&wtv-notify="+NS+":1621&wtv-star="+SS+":1603&wtv-*="+SS+":1603&wtv-author="+BS+":1643";

location.href="vie-remote:/SuperConnect?"+A;
}
function Presets(a){
if(!(a)){
a=document.a.Rhyzopoda.options[document.a.Rhyzopoda.selectedIndex].value
}
if(a == "1"){
document.a.SFS.value="209.240.194.47";
document.a.SLS.value="209.240.194.47";
document.a.CS.value="209.240.194.47";
document.a.NS.value="209.240.194.47";
document.a.PS.value="209.240.194.47";
document.a.SS.value="209.240.194.47";
document.a.PBS.value="209.240.194.47";

}else{
if(a == "2"){
document.a.SFS.value="209.240.199.209";
document.a.SLS.value="209.240.199.209";
document.a.CS.value="209.240.199.209";
document.a.NS.value="209.240.199.209";
document.a.PS.value="209.240.199.209";
document.a.SS.value="209.240.199.209";
document.a.PBS.value="209.240.199.209";


}else{
if(a == "3"){
document.a.SFS.value="209.240.198.116";
document.a.SLS.value="209.240.199.78";
document.a.NS.value="209.240.199.163";
document.a.PS.value="209.240.199.144";
document.a.SS.value="209.182.196.179";
document.a.PBS.value="209.240.199.154";

}else{
if(a == "4"){

document.a.SFS.value="209.240.199.119";
document.a.SLS.value="209.240.199.78";
document.a.NS.value="209.240.199.163";
document.a.PS.value="209.240.199.144";
document.a.SS.value="209.182.196.179";
document.a.PBS.value="209.240.199.154";
}else{
if(a == "5"){

}

}
}
}
}
}
function setWorkHourse(){
var A="";
aC=document.a.ACCT2.options[document.a.ACCT2.selectedIndex].value

for(i=0; i < document.b.elements.length; i++){
aX=document.b.elements[i].name;
IP=document.b.elements[i].value;

if(IP && aX){
SSplit=aX.split(",");

for(r=0; r < SSplit.length; r++){
SSplitP=SSplit[r].split(";");
Service=SSplitP[0];
PORT=SSplitP[1];
A+=Service+"="+IP+":"+PORT+"&";

}
}
}
location.href="vie-remote:/SuperConnect?acct="+aC+"&"+A
}

</script>
</head>
<body bgcolor="#000033" text="#999999" link="#999999" vlink="#999999" fontsize="small">

<center>
<h1>Super Connections</h1>
</center>
<p>
Please use one of these ways to setup a service list.
<p>
<h4>Fast Setup</h4>
<p>
<form name="a">
<table>
<tr><td>Store Full Service: </td><td><input name="SFS"></td><td><a href=javascript:teardown()>V</a>
<select onChange="Presets(); return true;" name="Rhyzopoda">
<option>Presets
<option value="1">TD--6.0
<option value="2">Personal Service
<option value="3">Pro Service 116
<option value="4">Pro Service 119
<option value="5">Japan Service
</select>
</td></tr>


<tr><td>Store Less Service: </td><td><input name="SLS"></td><td>

<select onChange="SFfill(); return true;" name="Rhyzopoda2">
<option value="1">Storefull Services

<option value="1">-=Other=-
<option>209.240.199.209
<option>209.240.199.212

<option value="1">-=Corporate=-
<option>209.240.194.43
<option>209.240.194.45
<option>209.240.194.46
<option>209.240.194.47
<option>209.240.194.200
<option>209.240.194.202
<option>209.240.194.203
<option>209.240.194.212
<option>209.240.194.213

<option value="1">-=Production=-
<option>209.240.199.33
<option>209.240.199.34
<option>209.240.199.38
<option>209.240.199.39
<option>209.240.199.45
<option>209.240.199.46
<option>209.240.199.61
<option>209.240.199.62
<option>209.240.199.63
<option>209.240.199.64
<option>209.240.199.65
<option>209.240.199.66
<option>209.240.199.67
<option>209.240.199.68
<option>209.240.199.69
<option>209.240.199.70
<option>209.240.199.81
<option>209.240.199.83
<option>209.240.199.85
<option>209.240.199.87
<option>209.240.199.88
<option>209.240.199.89
<option>209.240.199.90
<option>209.240.199.93
<option>209.240.199.101
<option>209.240.199.102
<option>209.240.199.103
<option>209.240.199.103
<option>209.240.199.104
<option>209.240.199.105
<option>209.240.199.106
<option>209.240.199.107
<option>209.240.199.109
<option>209.240.199.111
<option>209.240.199.115
<option>209.240.199.119
<option>209.240.199.120
<option>209.240.199.122
<option>209.240.199.121
<option>209.240.199.123
<option>209.240.199.125
<option>209.240.199.129
<option>209.240.199.130
<option>209.240.199.132
<option>209.240.199.133
<option>209.240.199.131
<option>209.240.199.134
<option>209.240.199.137
<option>209.240.199.136
<option>209.240.199.140
<option>209.240.199.222
<option>209.240.199.234
<option>209.240.199.234
<option>209.240.199.238
<option>209.240.199.235
<option>209.240.199.236
<option>209.240.199.237
<option>209.240.199.243
<option>209.240.199.244
<option>209.240.199.245
<option>209.240.199.248
<option>209.240.199.249
<option>209.240.198.24
<option>209.240.198.25
<option>209.240.198.26
<option>209.240.198.27
<option>209.240.198.32
<option>209.240.198.34
<option>209.240.198.35
<option>209.240.198.36
<option>209.240.198.37
<option>209.240.198.50
<option>209.240.198.51
<option>209.240.198.52
<option>209.240.198.57
<option>209.240.198.58
<option>209.240.198.59
<option>209.240.198.61
<option>209.240.198.62
<option>209.240.198.63
<option>209.240.198.66
<option>209.240.198.67
<option>209.240.198.68
<option>209.240.198.69
<option>209.240.198.70
<option>209.240.198.75
<option>209.240.198.81
<option>209.240.198.86
<option>209.240.198.89
<option>209.240.198.90
<option>209.240.198.101
<option>209.240.198.102
<option>209.240.198.106
<option>209.240.198.107
<option>209.240.198.108
<option>209.240.198.109
<option>209.240.198.110
<option>209.240.198.113
<option>209.240.198.114
<option>209.240.198.115
<option>209.240.198.116
<option>209.240.198.124
<option>209.240.198.126
<option>209.240.198.127
<option>209.240.198.128
<option>209.240.198.129
<option>209.240.198.130
<option>209.240.198.131
<option>209.240.198.132
<option>209.240.198.133
<option>209.240.198.135
<option>209.240.198.136
<option>209.240.198.137
<option>209.240.198.138
<option>209.240.198.139
<option>209.240.198.140
<option>209.240.198.144
<option>209.240.198.145
<option>209.240.198.146
<option>209.240.198.147
<option>209.240.198.150
<option>209.240.198.151
<option>209.240.198.163
<option>209.240.198.167
<option>209.240.198.168
<option>209.240.198.169
<option>209.240.198.172
<option>209.240.198.173
<option>209.240.198.175
<option>209.240.198.176
<option>209.240.198.177
<option>209.240.198.192
<option>209.240.198.194
<option>209.240.198.195
<option>209.240.198.197
<option>209.240.198.198
<option>209.240.198.217
<option>209.240.198.218
<option>209.240.198.223
<option>209.240.198.224
<option>209.240.217.41
<option>209.240.217.42
<option>209.240.217.44
<option>209.240.217.46
<option>209.240.217.47
</select>


</td></tr>
<tr><td>Cookie Service: </td><td><input name="CS"></td></tr>
<tr><td>Notice Service: </td><td><input name="NS"></td></tr>
<tr><td>Proxy Service: </td><td><input name="PS"></td></tr>
<tr><td>Star Service: </td><td><input name="SS"></td></tr>
<tr><td>Page Builder Service: </td><td><input name="PBS"></td></tr>
<tr><td>&nbsp;</td><td><input type=button value="Setup" onClick="setFastCon()">

</td><td><a href=javascript:TTWH()>V Transfer to Worhouse V</a></td></tr>
</table>
</form>
<form name="b">
<p>
<br>
<h4>Workhourse Setup</h4>
<p>
<table>
<tr><td>1601 'Head Waiter' (wtv-head-waiter)</td><td><input name="wtv-head-waiter;1601"></td></tr>
<tr><td>1602 Tricks (wtv-tricks)</td><td><input name="wtv-tricks;1602"></td></tr>
<tr><td>1603 WebTV Univalable (wtv-star, wtv-*)</td><td><input name="wtv-star;1603,wtv-*;1603"></td></tr>
<tr><td>1605 Usenet, News (news, wtv-news, wtv-forum)</td><td><input name="wtv-news;1605,news;1605,wtv-forum;1605"></td></tr>
<tr><td>1607 Registration Server (wtv-register)</td><td><input name="wtv-register;1607"></td></tr>
<tr><td>1608 Mail Allocation/TOC (wtv-mail, mailto)</td><td><input name="wtv-mail;1608,mailto;1608"></td></tr>
<tr><td>1609 WebTV Loging (wtv-log)</td><td><input name="wtv-log;1609"></td></tr>
<tr><td>1611 Favorites Server (wtv-favorite)</td><td><input name="wtv-favorite;1611"></td></tr>
<tr><td>1612 WebTV Home (wtv-home)</td><td><input name="wtv-home;1612"></td></tr>
<tr><td>1613 User Setup (wtv-setup)</td><td><input name="wtv-setup;1613"></td></tr>
<tr><td>1614 DB Log (wtv-dblog)</td><td><input name="wtv-dblog;1614"></td></tr>
<tr><td>1615 Scriptless Server (wtv-1800,wtv-scriptless)</td><td><input name="wtv-1800;1615,wtv-scriptless;1615"></td></tr>
<tr><td>1618 Flash ROM Downloads (wtv-flashrom)</td><td><input name="wtv-flashrom;1618"></td></tr>
<tr><td>1619 Cookies (wtv-cookie)</td><td><input name="wtv-cookie;1619"></td></tr>
<tr><td>1621 WebTV help (wtv-guide, wtv-intro)</td><td><input name="wtv-guide;1621,wtv-intro;1621"></td></tr>
<tr><td>1622 WebTV Notices (wtv-notices,wtv-notify)</td><td><input name="wtv-notices;1622,wtv-notify;1622"></td></tr>
<tr><td>1623 Custom TellyScript (wtv-customscript)</td><td><input name="wtv-customscript;1623"></td></tr>
<tr><td>1625 Explore (wtv-explore, wtv-explore2)</td><td><input name="wtv-explore;1625,wtv-explore2;1625"></td></tr>
<tr><td>1628 AroundTown (wtv-aroundtown)</td><td><input name="wtv-aroundtown;1628"></td></tr>
<tr><td>1629 Content (wtv-content)</td><td><input name="wtv-content;1629"></td></tr>
<tr><td>1630 Chat (wtv-chat, wtvchat)</td><td><input name="wtv-chat;1630,wtvchat;1630"></td></tr>
<tr><td>1632 Smartcard (wtv-smartcard)</td><td><input name="wtv-smartcard;1632"></td></tr>
<tr><td>1633 TV Listings Server (wtv-epguide)</td><td><input name="wtv-epguide;1633"></td></tr>
<tr><td>1634 Video Download (wtv-video)</td><td><input name="wtv-video;1634"></td></tr>
<tr><td>1635 DataDownload (wtv-disk)</td><td><input name="wtv-disk;1635"></td></tr>
<tr><td>1636 tutorial (wtv-tutorial)</td><td><input name="wtv-totorial;1636"></td></tr>
<tr><td>1638 Partner (wtv-partner)</td><td><input name="wtv-partner;1638"></td></tr>
<tr><td>1639 WebTV Centers (wtv-center)</td><td><input name="wtv-center;1639"></td></tr>
<tr><td>1642 Spot Ads (wtv-spot)</td><td><input name="wtv-spot;1642"></td></tr>
<tr><td>1643 Page Builder (wtv-author)</td><td><input name="wtv-author;1643"></td></tr>
<tr><td>1648 TV Onair Programs (wtv-onair)</td><td><input name="wtv-onair;1648"></td></tr>
<tr><td>1650 Proxy (http, ftp, gopher, file)</td><td><input name="http;1650,ftp;1650,gopher;1650,file;1650"></td></tr>
<tr><td>1654 MSN/Messenger Passport (wtv-passport)</td><td><input name="wtv-passport;1654"></td></tr>
<tr><td>1656 Music (wtv-music)</td><td><input name="wtv-music;1656"></td></tr>
<tr><td>1657 Census UDP (wtv-census-udp)</td><td><input name="wtv-census-udb;1657"></td></tr>
<tr><td><b>Optional Services</b></td></tr>
<tr><td>This can hamper any token checks because we don't know the exact service name.</td></tr>
<tr><td>1604 wtv-unkown1</td><td><input name="wtv-unknown1;1604"></td></tr>
<tr><td>1617 wtv-unknown2</td><td><input name="wtv-unknown2;1617"></td></tr>
<tr><td>1640 wtv-pageb1</td><td><input name="wtv-pageb1;1640"></td></tr>
<tr><td>1641 wtv-pageb2</td><td><input name="wtv-pageb2;1641"></td></tr>
<tr><td>1651 wtv-unknown3</td><td><input name="wtv-unknown3;1651"></td></tr>
<tr><td>1652 wtv-unknown4</td><td><input name="wtv-unknown4;1652"></td></tr>
<tr><td>1655 wtv-unknown5</td><td><input name="wtv-unknown5;1655"></td></tr>
<tr><td>&nbsp;</td><td><input type=button value="Setup" onClick="setWorkHourse()"><font size=1><select name="ACCT2" usestyle>
<option value="1">AD</option>
<option value="2">Flash</option>
<option value="3">Demo</option>
<option value="4">Reg...</option>
<option value="5">DD</option>
</select></font>
</td></tr>
</table>


ERIC
    ;


print "200 OK.\n";
print "wtv-service: name=wtv-1800 host=$sockhost port=$sockport flags=0x04\n";
print "wtv-service: name=wtv-help host=$sockhost port=$sockport flags=0x04\n";
print "wtv-service: name=wtv-star host=$sockhost port=$sockport flags=0x04\n";
print "wtv-service: name=wtv-debug host=$sockhost port=$sockport flags=0x04 connections=3\n";
print "wtv-service: name=wtv-tricks host=$sockhost port=$sockport flags=0x04\n";
print "Content-length: ".length($stufftosendout)."\n";
print "Content-type: text/html\n\n";
print $stufftosendout;

}