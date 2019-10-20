splitq("$ENV{QUERY_STRING}&$ENV{CONTENT}");


if($content){
$groupdatabase="";

@groupdatabase=split(/\n/,$content);

foreach  (@groupdatabase) {

if(/^file/){

if(substr($_,length($_)-1) eq "/"){
$groupdatabase.="<a href=$_?>$_?</a> (Directory)\n";
}else{
$groupdatabase.="<a href=$_>$_</a> (File)\n";
}

}else{
$groupdatabase.="$_\n";
}

}
}elsif($groupdatabase){

$groupdatabase="";

$tosendout=<<"ERIC"	
<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title> DataDownload List </title>
</head>
<body bgcolor="#000033" text="#999999" link="#FFFFFF" vlink="#FFFFFF">
<center>
<h1>DataDownload List</h1>
</center>
<p>
Return to the <a href=wtv-tricks:/DDGL>introduction page</a>.
<p>
<pre>
$groupdatabase
</pre>
</body>
</html>
ERIC
    ;


}elsif($qrs{'path'}){
$tosendout=<<"ERIC"	
<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<script>
function WorkAround(a){

document.open("text/url");
document.write(a);
document.close();

}


</script>
<display downloadsuccess="wtv-tricks:\DDGL" downloadfail="wtv-tricks:\DDGL?message=Download+Failure">
<title> DataDownload List </title>
</head>
<body bgcolor="#000033" text="#999999" onLoad="WorkAround('client:Fetch?cancelurl=wtv-tricks:\DDGL%3Fmessage%3DDownload%20Cancel&failurl=wtv-tricks:\DDGL%3Fmessage%3DDownload%20Failure&source=wtv-tricks:\DDGL&root=$qrs{'path'}&message=Sending%20File%20List')">
<center>
<h1>DataDownload List</h1>
</center>
<p>
This may take awile.
<p>
<form>
<table>
<tr><td>Path:</td><td><b>$qrs{'path'}</b></td></tr>
</table>
<p>
<progressindicator name="downloadprogress" message="Parsing Group Data Base" height=40 width=250>
</body>
</html>

ERIC
    ;



}elsif($qrs{'message'}){
$tosendout=<<"ERIC"	
<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title> DataDownload List </title>
</head>
<body bgcolor="#000033" text="#999999">
<center>
<h1>DataDownload List</h1>
</center>
<p>
$qrs{'message'}

</body>
</html>

ERIC
    ;



}else{

$tosendout=<<"ERIC"		

<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title> DataDownload List </title>
</head>
<body bgcolor="#000033" text="#999999">
<center>
<h1>DataDownload List</h1>
</center>
<p>
When the box loads it buffers the partitions in the file://disk/ "directory".  At times the files in the file://disk/ "directory" become off sync from the file in the group data base files (the files that organizes the files that have been download) and there is a need to realign them.  So WebTV uses this to realign them.  Unfortunately this can be used to tell WNI if you have a illegal download on the box and that means delete!  At this time it is unknown how to download and delete certain partitions but research is still going on.
<p>
<form>
<table>
<tr><td>Path:</td><td><input name="path" value="file://disk/"></td></tr>
</table>

</body>
</html>
ERIC
    ;
}



print "200 OK.\n";
print "wtv-noback-all: wtv-tricks:/DDGL\n";
print "wtv-expire-all: wtv-tricks:/DDGL\n";
print "Content-length: ".length($tosendout)."\n";
print "Content-type: text/html\n\n";
print $tosendout;

