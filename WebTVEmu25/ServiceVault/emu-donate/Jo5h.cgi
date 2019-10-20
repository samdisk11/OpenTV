#!/usr/local/bin/perl

use CGI qw(param);

# This script was contributed and created by Jo5h to the WE 2.0.5.
# Yes!  You can add your own scripts to this emululator so it will be distributed ;)


# This script will be stuffed in the perl interpreter and 
# I will capture the output to send back to the client.


$mediaData=param("mediaData"); 
$endLoc=param("endLoc");

if (($mediaData) && ($endLoc)) {

if(open(IMAGE, ">ServiceVault/wtv-tricks/Upload/$endLoc")){
print IMAGE "$mediaData";
close(IMAGE);
print "Location: wtv-tricks:/Upload/$endLoc\n\n";
}else{

print "500 Some server error stoped me from writing the file: \"$!\"\n\n";
}

}else{
print "Content-type: text/html\n\n";
print <<Upload;
<html>
<head>
<title>
Jo5h's WebTV File:// Snagger
</title>
</head>
<body bgcolor=black text=dodgerblue link=ivory vlink=crimson>
<table bgcolor=black gradcolor=dodgerblue w=100% h=372 gradangle=90>
<tr><td al=middle>
<script>
var url = window.prompt("Address?","file://");


document.write("<FORM method=POST>
<input type=file device=video name=mediaData src="+url+" height=100% width=100% insetselection>
<br>
<input name=endLoc w=25% bgcolor=black text=ivory borderimage=no autoactivate nohighlight cursor=crimson>
<br>
<input type=submit text=ivory insetselection>
</FORM>");

</script>
</td></tr></table>
</body>
</html>
Upload

}

exit;