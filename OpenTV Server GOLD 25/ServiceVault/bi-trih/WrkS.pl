

splitq("$ENV{QUERY_STRING}&$ENV{CONTENT}");

if($qrs{'URL'} && !($qrs{'NoToken'})){

if($sockC=IO::Socket::INET->new("209.240.199.78:1639")){
print $sockC "GET wtv-center:/change-city?redirect=$qrs{'URL'}\n";
print $sockC "Referer: file://rom/HTMLs/Connecting.html\n";
print $sockC "wtv-request-type: primary\n";
print $sockC "wtv-system-sysconfig: $usersysconfig\n";
print $sockC "wtv-system-cpuspeed: $usercpuspeed\n";
print $sockC "wtv-incarnation: 19\n";
print $sockC "Accept-Language: en\n";
print $sockC "wtv-ticket: 1i2G9EYsDHjoGzsX17zztxScr4e9Z5WseZLwwgsU8io7ETT6gf9YTsXcUA1x+m7qzviXhGEUUZ/sWZOzF4F9npnDR3AuWgOcWxXDMbhQe8iMhzUln/q9O+38jvxBrZiUDr1248BiIxd1nJlEuduSYNTLMyYJ0lPsxHZekqGlHFL92JxKDk4eusPKON5gjCStc/K+e0afz/wtuS4e3lZnOyJmx5SaLXpCXm5wuvwvBdJAfflexhYDmehYhwq5oze8CV5cONEhV5RRtDDT7ucFI/86UJ3PBF40zTCR2yN+d/hk7fDOXxV0jm+UYlN/0vuc+dVBMgVgwL1YZ3eXlIM+gYKTwWgR6enngfP/uIW91721QlgmVo52WdbIaHViFYfIMIoQ0JtvyMS9f9S7kUMuCSoWsNg+HxScrbGLDTewXLi9Kt4QxXsC7IGpmuZRtR4nV4GRGzfaft2vuw/ql92iB0sae7VRVwqSRODPoVjcKFxxb8R0331YDfnNPnhqs0Zn0iptxCxDrfuS76jg8XYAD4pz0uQG6hGCcG2I8+ECwoqjR4IHBfmNaUyrXOw6p0Ekr9jqUHT5YHneYDI0eIhlRpZicQ1LJTXbc6kXRWAz55OnXfEjPs7bfI+hN1ARW6dHDzPrfC7HpCx+KfxSsjNRdxG6DAHVDiuh6LrzgzrnQwR18II4/XvoZwdmnOrHUxo4HOxAZLSO68irWJsmVSD1avhSl9bf3cDPZHHtD8NOEXnnx0YTnis24ZCOJjcHpWPbpsNItuSGE52xgJuuyyllmL1WJcmj6EosOObVZCzfw986H8N29wwapjHIdAmVx7X87Kxzt33DzDtXSBIwShdfZQ10zkZNN9G7pKUTHhzJQz3JCIAtCgua6IUa9JtUvnYzu6D7LFl0qOHITz6yjLy3vV8dv0xQ7qphOwEKSATqZXbx/1eVLX1ylgLq4ZAb0Hkte58xSz3jhStHOhRwd3is0o7JadTIyJuc5H1OsDQNuRVBr6Cikf8RvIzkcQzhUyD2N3CPUkeeQwDZOiXr8k01GMDLYV56UEg0cbzCkTMrwpb90cc9OglyCEdjaVXVebwS/Qmwq+m42QWtnHGQUHn2z9LAMDl/cQQ8MWwet4xXRn1hPssYUU+FdV6zv5/ejtfPrhV4463GKJpIUo5L+L81jRqISEIcf8fXPn13xBkueQTLhZblYy7ucl2hJ4O7mB+lH+AaiJzkZYBEBGALljAoUSdF1sB+TdMtwVLjp23XFpoQmVOZz0AgZ4dxHTlvy81ZOkb122MgTHFGMterKBqbI+jhpby0zQb77UUs/hxLCvXmDgBaa6uVmNNL0VcjveGLKyxRlYAnOVYZ2/7WloMLaMHQbA+zD4qeuEK0Up3G+B9KMK8SghIEyeB66yAsXL36zQAaYuXFedwH04fIS5QoluBTdaNDyNmaLcNJjcLebV6gU2aZ7+oSNFGfHisv1s3jDyrEnr1oLxadhhE/qf84lWKDXg790qMkHcbfGIbkS5BbB1WxsNkEW/LaHwyqMsGniEmD+si8Bi9kEnGLd/wnGgqKkymf6COtJ7EVzlSCfRleaA7IJ3ffYfuCk37n2TNZtNzLVWR13thE94hKrMBLKO+9lMcYgNevNI9TF89yZIqL6sZEZi+KEmA2/+UBX60GOd8UOg4+OoooNmmb+8uPY59NaN9+P/qyf9KFWRmI7XVNu+5NWuyNujW1ENDjhVhf9/nM++LBF5nXXW1NuG3+NR8tz73TP6ieY7NhyvMLHK9NF/HcpMqf6OikcO9hoP75\n";
print $sockC "wtv-connect-session-id: ba208d02\n";
print $sockC "wtv-system-version: $userclientbuild\n";
print $sockC "wtv-client-serial-number: $userssid\n";
print $sockC "wtv-system-chipversion: $userchipversion\n";
print $sockC "wtv-client-bootrom-version: $userbootromversion\n";
print $sockC "wtv-client-rom-type: $userromtype\n";
print $sockC "wtv-encryption: true\n";
print $sockC "wtv-capability-flags: 1bd9afcf\n";
print $sockC "wtv-script-id: 0\n";
print $sockC "wtv-script-mod: 0\n\n";

while($buff=<$sockC>){
if(substr($buff,0,9) eq "Location:"){
$URLX=substr($buff,10)
}
if(substr($buff,0,1) eq "\n"){
close($sockC);
}



}
}else{
close($sockC);
}
}

$tosendout=<<"ERIC"
<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title> WebTV Workshed </title>
<script>
TokenAllow="true";
SourceAllow="false";
TokenURL="wtv-center:/ChangeCity?redirect=";

function applyToken(A){
location.href="wtv-1800:/WrkS?URL="+escape(A);
}


function preloadURL(A) {
document.clientArea.document.open("text/html");
document.clientArea.document.write("<body bgcolor=#000033 text=#999999><p>Pleloading '"+A+"'<p><link href='"+A+"' rel=next>");
document.clientArea.document.close();

}


function sourceConfirm(A) {
if(SourceAllow && (SourceAllow != "false")){
document.clientArea.document.write("<body bgcolor='#000033' text='#999999'>Source for '"+A+"':<p><wtvchattranscript src="+A+" type='text/plain'>")
}else{
location.href="wtv-1800:/SourceMe?URL="+escape(A);

}
}

function embedURL(A) {
document.clientArea.document.open("text/html");
document.clientArea.document.write("<hr noshade><form>Javascript: clientArea.<input bgcolor='#000033' text='#999999' border=0 nohighlight onChange=txt.value=eval('top.document.clientArea.document.HEY.'+this.value) width='60%'><br>Return Code: <textarea growable name='txt' cols='50%' bgcolor='#000033' text='#999999' border=0 nohighlight></textarea></form><hr noshade><body bgcolor='#000033' text='#999999'><p><wtvchattranscript src='"+A+"' name=HEY>");
document.clientArea.document.close();


}


function accessDirect(A) {
if(SourceAllow && (SourceAllow != "false")){

document.open("text/url");
document.write(TokenURL+A);
document.close()

}else{
document.open("text/url");
document.write(A);
document.close()
}
      
}

function ShowSetup(){

if(TokenAllow && (TokenAllow != "false")){
TokenString=" checked=true ";
}else{
TokenString="";
}


if(SourceAllow && (SourceAllow != "false")){
SouceString=" checked=1 "
}else{
SouceString="";
}
if(!(TokenURL)){
TokenURL="wtv-center:/ChangeCity?redirect="
}

document.clientArea.document.open("text/html");
document.clientArea.document.write("<body bgcolor='#000033' text='#999999'><center><h1>Work Shed Setup</h1></center><p><form><table><tr><td>Automatic Token on access: </td><td><input type='checkbox' onClick='top.Setup(1,1)' "+TokenString+"></td></tr><tr><td>Source using embed tag: </td><td><input type='checkbox' onClick='top.Setup(2,1)' "+SouceString+"></td><tr><td>Token URL: </td><td><input type='text' value='"+TokenURL+"' onChange='top.Setup(3,this.value)' bgcolor='#000033' text='#999999' border=0 nohighlight></td></tr></html>")
document.clientArea.document.close();
}

function applyEscape(A){
Qur1=A.substring(0,A.indexOf("?"));
Qur=A.substring(A.indexOf("?"));
Result="";

QurSplit=Qur.split("&");
for(i=0; i < QurSplit.length; i++){

Result+=QurSplit[i].substring(0,QurSplit[i].indexOf("="))+"="+escape(QurSplit[i].substring(QurSplit[i].indexOf("=")))+"&";

}

ATar.value=Qur1+Result

}



function Setup(A,B){

if(A == 1)
TokenAllow=document.clientArea.document.forms[0].elements[0].checked;
else
if(A == 2)
SourceAllow=document.clientArea.document.forms[0].elements[1].checked
else
if(A == 3)
TokenURL=document.clientArea.document.forms[0].elements[2].value

}

function uselessInfo(A) {
Proto=A.substring(0,A.indexOf(":/"));
Targ=A.substring((A.indexOf(":/")+2));

if(Targ.substring(0,1) == "/"){
Targ=Targ.substring(1);

}
if((Targ) && (Proto) && (Targ != Proto.substring(1))){

GoingToWrite="The protocol to this URL is '"+Proto+"' and it is going to target '"+Targ+"' further information is as follows:<p>"

if(Proto == "wtv-home")
GoingToWrite+="This is the home service. This service is used to help as a starting point linking to other parts of the network.  The primary use of this service is used for the home page which is on the wtv-home:/home URL.  The port that this service is hosted on is 1612."
else
if(Proto == "wtv-center")
GoingToWrite+="This is the center service.  This service is used as places where people would populate to search for information.  This service is normaly linked from the home service.  "
else
if(Proto == "wtv-1800" || Proto == "wtv-scriptless")
GoingToWrite+="This is the scriptless service. This service is used to provice a tellyscript and a key to know how responcd the challenge from login in a challenge/responce security feature.  This service is normaly firewalled and is only accessed from a WebTV toll free POP.  The standard port to this service is 1615."
else
if(Proto == "wtv-register")
GoingToWrite+="This service is used to setup or manipulate a main user account on WebTV's registry database.  This service registeres a new main user account, unregisters a main user account and transfers a main user account from one box to another."
else
if(Proto == "wtv-news" || Proto == "news" || Proto == "wtv-forum")
GoingToWrite+="This is the news service.  This service is used to index alt.discuss and usenet news groups postings.  This service also allows you to search, and post to news groups.  The standard port for this service is 1605."
else
if(Proto == "wtv-mail" || Proto == "mailto")
GoingToWrite+="This service is the mail service.  This service indexes mail for WebTV subscribers.  This service has five common index folders which are outbox for saving unsent mail, inbox for sent mail that has been recived by the current user, mbox which is used to index the saved mail, sent which is used to index already sent mail by the user, and trash which is used to index discared mail.  The standard port to this service is 1608."
else
if(Proto == "wtv-notice" || Proto == "wtv-notify")
GoingToWrite+="This is the notify service.  This service purpose is not compleatly known.  But under theory this service is used to tell the box when new mail has come in.  This service may also be used notify the box on other issues."
else
if(Proto == "wtv-help" || Proto == "wtv-turorial" || Proto == "wtv-intro")
GoingToWrite+="This service is used to guide a WebTV user to using WebTV tools and pages.  This service is probably the one service WNI hates to program!  It is large and must be written to a village idiot towards WebTV."
else
if(Proto == "wtv-cookie")
GoingToWrite+="This is the cookie service.  This service is used to store and send and delete cookies for a box on a WebTV user account.  This service is first contacted at login to get the list of available domains that the box can request the cookie from."
else
if(Proto == "wtv-log" || Proto == "wtv-dblog")
GoingToWrite+="This is the log service for WebTV.  This service not only has a good purpose but can log things from you that are inapropriate to log such as printed pages with NO error."
else
if(Proto == "wtv-star" || Proto == "wtv-*")
GoingToWrite+="This is the star service.  This service is connected with the unavailable message you get when a server is slow or inaccesable."
else
if(Proto == "wtv-head-waiter" || Proto == "wtv-h-w")
GoingToWrite+="This is the head waiter service.  This service name comes after the head waiter at a resteraunt which basicly looks after the waiters.  It is more properly said as a 'manager'.  This service is what is used to maintain a login and user name."
else
if(Proto == "wtv-flashrom")
GoingToWrite+="This is the flashrom service.  This service is used to store builds for both AppROM and BootROM.  This is basicly used to upgrade the production box and to maintain builds to the production box."
else
if(Proto == "http")
GoingToWrite+="This is the http service.  This on a WebTV box is used to store a proxy service which is used to speed up the process of page request.  On the https service the proxy is bypassed."


if(Proto == "file"){
GoingToWrite+="This is the file protocol.  This is service is used to grab local indexed files in the box's ROM or HD.";

if(Targ.substring(0,4) == "disk"){
FFF=navigator.haveLocalResource(A);
if((FFF) && FFF != undefinded){
GoingToWrite+="<p> Since this is a disk file url we checked to see if it existed localy.  Yet it does."; 
}else{
GoingToWrite+="<p> Since this is a disk file url we checked to see if it existed localy.  Yet it doesn't.";
}
}
}



}else{
GoingToWrite="What you have entered is not a propper URL.  Please not that tv: or lid: are NOT considered URLs."
}

document.clientArea.document.open("text/html");
document.clientArea.document.write("<body bgcolor='#000033' text='#999999'><p>"+GoingToWrite+"");
document.clientArea.document.close();

}


</script>
</head>
<body bgcolor="#000033" text="#99999" link="#AAAAAA" vlink="#AAAAAA" fontsize="small" onLoad="ATar=document.A.A">
<center>
<h1>WebTV Work shed</h1>
</center>
<p>
This is used to manipulate and test a URL that pertains to WebTV Networks.  Unfortunately this does not comply with the philosophy of this server.
<p> 
<form name="A">
<table>
<tr><th>URL: </th><td><table bgcolor="#000022"><tr><td><input bgcolor="#000033" text="#999999" border=0 nohighlight name="A" value="$URLX"></td></tr></table></td><td>
<table>
<tr><th href="javascript:sourceConfirm(ATar.value)">Source</th><th href="javascript:accessDirect(ATar.value)">Access</th><th href="javascript:uselessInfo(ATar.value)">Information</th><th href="javascript:ShowSetup()">Setup</th></tr>

<tr><th href="javascript:preloadURL(ATar.value)">Preload</th><th href="javascript:embedURL(ATar.value)">Embed</th><th href="javascript:applyToken(ATar.value)">Apply Token</th><th href="javascript:applyEscape(ATar.value)">Apply Esc</th></tr>
</table>

</td></tr>
</table>
<p>
<wtvchattranscript src="wtv-1800:/empty2.html" name="clientArea">
</body>
</html>

ERIC
    ;


print $clients "200 OK\n";
print $clients "wtv-service: name=wtv-cookie host=$sockhost port=$sockport\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;