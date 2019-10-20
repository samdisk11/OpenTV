splitq("$ENV{QUERY_STRING}&$ENV{CONTENT}");





$tosendout=<<"ERIC"

<!--- *=* Copyright 1998 WebTV Networks, Inc. All rights reserved. --->
<html>

<title>Set the Clock</title>

<display nostatus skipback>

<body bgcolor="#111111" text="#44bb55" link=#dddddd nohtilebg fontsize=medium>

<br><h1>Set the Clock<hr></h1>

<p>The time is <clock></p>
<p>Server time is $formateddate</p>

<p>Example new time: <font color=00c0c0>Wed, 19 Jul 2000 10:13:26 GMT</font></p>

<p>The time zone is required.</p>

<form action="wtv-tricks:/SetClock" method="POST">

<p>New time: <input type=text name=time size=40 value="$timeX"></p>

<input 
	type=submit 
	value="Set Clock" 
	usestyle>
</form>


</body>
ERIC
    ;



print "200 OK.\n";
if($qrs{'time'}){
print "wtv-client-date: $qrs{'time'}\n";
}
print "Content-length: ".length($tosendout)."\n";
print "Content-type: text/html\n\n";
print $tosendout;