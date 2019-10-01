splitq("$ENV{QUERY_STRING}&$ENV{CONTENT}");





if(!($qrs{'FlshURL'})){

$tosendout=<<"ERIC"
<!doctype html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title> Compile Flash Image </title>
</head>
<body bgcolor="#000033" text="#999999">
<center>
<h1>Compile Flash Image</h1>
</center>
<p>
Please input the redirect URL to be used then press enter so I can compile the Flash 4 image.  You mite want to use save as.<p>

<form>
URL: <input name="FlshURL" maxlength="200">

</body>
</html>
ERIC
    ;


print "200 OK.\n";
print "Content-length: ".length($tosendout)."\n";
print "Content-type: text/html\n\n";
print $tosendout;

}else{
$LengthChr=chr((56+length($qrs{'FlshURL'})));
$SectonChr1=chr(20+length($qrs{'FlshURL'}));
$SectonChr2=chr(2+length($qrs{'FlshURL'}));

$FlashImage="\x46\x57\x53\x04$LengthChr\x00\x00\x00\x78\x00\x05\x5F\x00\x00\x0F\xA0\x00\x00\x0C\x01\x00\x43\x02\xFF\xFF\xFF\x3F\x03$SectonChr1\x00\x00\x00\x96$SectonChr2\x00\x00$FlshURL\x00\x96\x07\x00\x00\x5F\x73\x65\x6C\x66\x00\x9A\x01\x00\x01\x00\x40\x00\x00\x00";


print "200 OK.\n";
print "Content-length: ".length($FlashImage)."\n";
print "Content-type: application/futuresplash\n\n";
print $FlashImage;
}