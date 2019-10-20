splitq("$ENV{QUERY_STRING}&$ENV{CONTENT}");

if(($qrs{'host'}) && ($qrs{'port'}) && ($qrs{'url'})){

print "300 OK\n";
print "wtv-service: reset\n";
print "wtv-service: name=http host=$qrs{'host'} port=$qrs{'port'}\n";
print "Content-type: text/html\n";
print "Content-lenght: 0\n";
print "Location: $qrs{'url'}\n\n";

}else{
$tosendout=<<"ERIC"
<head>
<title>Proxy Setup</title>
</head>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<h1>Proxy Setup</h1>
<p>
Please type in the proxy IP and port along with the HTTP url to go.
<p>
<form>
<table cellspacing="5" cellpadding="5">
<tr><th>Host</th><th>Port</th></tr>
<tr><td><input name="host" size="14" bgcolor="#191919" border=0 text=#44cc55 nohighlight></td><td><input name="port" value="1650" size=5 maxlength=5 bgcolor="#191919" border=0 text=#44cc55 nohighlight></td></tr>
</table>
<p>
HTTP URL: &nbsp; <input name="url" bgcolor="#191919" border=0 text=#44cc55 nohighlight> 
<p>
<input type="submit" value="Go!">
ERIC
    ;


print "200 OK.\n";
print "Content-length: ".length($tosendout)."\n";
print "Content-type: text/html\n\n";
print $tosendout;

}


