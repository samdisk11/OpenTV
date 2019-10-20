splitq("$ENV{QUERY_STRING}&$ENV{CONTENT}");


if($qrs{'BootLEDModify'}){
print "500 All set my lad!\n";
print "Content-length: 0\n";
print "wtv-boot-message-led-state: $qrs{'BootLEDModify'}\n\n";
}else{

$tosendout=<<"ERIC"
<title>Boot LED Setup</title>
<head>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<h1>Boot LED Setup</h1>
<p>
This tricks page is used to setup the box's boot LED.  The box seams to have a setting probably contained within the TellyScript variables that defines how the Boot led is controled.  Now you ask me what the boot LED is.  The Boot LED is the L.E.D. that flashes while your box prepares to establish a connection with the server.<p>


<table>
<tr><td>Flash Speed:&nbsp;&nbsp;</td><td>
<form>
<select name="BootLEDModify">
<option value="on">on-normal
<option value="off">Off
<option value="blinkSlow">Blinking Slow
<option value="blinkFast">Blinking Fast
</select>

</td></tr>
</table>
<p>
<input type=submit value="Get to It!">
ERIC
    ;


print "200 OK.\n";
print "Content-length: ".length($tosendout)."\n";
print "Content-type: text/html\n\n";
print $tosendout;

}


