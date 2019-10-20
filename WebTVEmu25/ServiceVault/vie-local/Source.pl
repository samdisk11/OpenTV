$SourceThis="";
$Ctyp="";
$url_S="";
$SourceNow="";
splice(@valueArray);
$countxz=0;
$pastcontenttype=0;
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

$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
if($namem eq "SourceThis"){
$SourceThis=$valuem;
}


if($namem eq "Ctyp"){
$Ctyp=$valuem;
}
if($namem eq "SourceNow"){
$SourceNow=$valuem;
}
if($namem eq "URL"){
$url_S=$valuem;
}

}




if($SourceNow){
if($SourceThis){
print "200 OK\n";
print "Content-length: ".length($SourceThis)."\n";
print "Content-type: $Ctyp\n\n";
print $SourceThis;
$H=((rand(10000)/rand(10000))*360)+rand(10000);
$url_S=substr($url_S,index($url_S,":")+1);

open(FILE,"> ServiceVault/wtv-cache/$url_S---$H-[$hours-$minutes-$secsq-{$mounths\_$days}].dat");
print FILE $SourceThis;
close(FILE);
}else{

print "500 There is no information on this cache page to viewer OR the cache page you have entered does not exist.\n\n";
}
}elsif($Ctyp && $url_S){
$tosendout=<<"ERIC"
<html>
<head>
<title>WebTV Page Source</title>
</head>

<body bgcolor="#000033" text="#999999">
<center>
<h1>WebTV Page Source</h1>
</center>
<p>
What is happening now is that the page is being loaded into cache.  Please select submit at a propper time.
<form>
<input type="hidden" value="$Ctyp" name="Ctyp">
<input type="hidden" value="true" name="SourceNow">
<input type="hidden" value="$url_S" name="URL">
<input type=file device=TunerVideo name=SourceThis width=100% height=100% invisible src="$url_S">
<p>
<input type="submit">
ERIC
    ;



print "200 OK\n";
print "Content-length: ".length($tosendout)."\n";
print "Content-type: text/html\n\n";
print $tosendout;

}else{


$tosendout=<<"ERIC"
<html>
<head>
<title>WebTV Cache Source</title>
<script>
function crange(){
a=document.a.AD.options[document.a.AD.selectedIndex].value;
document.a.URL.value=a;
}
</script>
</head>

<body bgcolor="#000033" text="#999999">
<center>
<h1>WebTV Cache Source</h1>
</center>
<p>
Please enter the page to URL.  Then enter the format you want the source to be in.<p>

Presets in order of the cache image.<p>
<form name="a">
<table><tr><td>Presets: </td>
<td>
<select onChange="crange()" name="AD">
<option value="cache:locked">cache:locked
<option value="cache:full">cache:full
<option value="cache:cachebuffer1dc07bc">cache:cachebuffer1dc07bc
<option value="cache:wtv-challenge-response">cache:wtv-challenge-response
<option value="cache:network-status">cache:network-status
<option value="cache:wtv-ticket">cache:wtv-ticket
<option value="cache:wtv-service-cookie">cache:wtv-service-cookie
<option value="cache:TVLog">cache:TVLog
<option value="cache:AlertWindow.html">cache:AlertWindow.html
<option value="cache:ChatPanel.html">cache:ChatPanel.html
<option value="cache:FindPanel.html">cache:FindPanel.html
<option value="cache:AddressPanel.html">cache:AddressPanel.html
<option value="cache:GotoPanel.html">cache:GotoPanel.html
<option value="cache:JSPromptPanel.html">cache:JSPromptPanel.html
<option value="cache:InfoPanel.html">cache:InfoPanel.html
<option value="cache:LoginPanel.html">cache:LoginPanel.html
<option value="cache:OptionsPanel.html">cache:OptionsPanel.html
<option value="cache:cachebuffer1f65de8">cache:cachebuffer1f65de8
<option value="cache:cachebuffer1f65dec">cache:cachebuffer1f65dec
<option value="cache:cachebuffer1f65df0">cache:cachebuffer1f65df0
<option value="cache:RecentPanel.html">cache:RecentPanel.html
<option value="cache:SavePanel.html">cache:SavePanel.html
<option value="cache:SplashWindow.html">cache:SplashWindow.html
<option value="cache:SendPanel.html">cache:SendPanel.html
<option value="cache:StatusIndicator.html">cache:StatusIndicator.html
<option value="cache:AudioCapturePanel.html">cache:AudioCapturePanel.html
<option value="cache:VideoCapturePanel.html">cache:VideoCapturePanel.html
<option value="cache:cachebuffer1f6997c">cache:cachebuffer1f6997c
<option value="cache:cachebuffer1f699c0">cache:cachebuffer1f699c0
<option value="cache:cachebuffer1f69a04">cache:cachebuffer1f69a04
<option value="cache:cachebuffer1f69a48">cache:cachebuffer1f69a48
<option value="cache:cachebuffer1f69a6c">cache:cachebuffer1f69a6c
<option value="cache:cachebuffer1f69a78">cache:cachebuffer1f69a78
<option value="cache:cachebuffer1f69b24">cache:cachebuffer1f69b24
<option value="cache:cachebuffer1f69b28">cache:cachebuffer1f69b28
<option value="cache:cachebuffer1f69b2c">cache:cachebuffer1f69b2c
<option value="cache:cachebuffer1f69b30">cache:cachebuffer1f69b30
<option value="cache:cachebuffer1f69b34">cache:cachebuffer1f69b34
<option value="cache:cachebuffer1f69b3c">cache:cachebuffer1f69b3c
<option value="cache:cachebuffer1f68948">cache:cachebuffer1f68948
<option value="cache:">cache:
<option value="cache:StatusIndicator.html.0.text">cache:StatusIndicator.html.0.text
<option value="cache:OptionsPanel.html.1.text">cache:OptionsPanel.html.1.text
<option value="cache:file://rom/HTMLs/PhilipsLogo.html.2.text">cache:file://rom/HTMLs/PhilipsLogo.html.2.text
<option value="cache:disk-cache-0">cache:disk-cache-0
</select>
</td></table>
<p>

<table>
<tr><td>URL:</td><td><input name="URL"></td></tr>
<tr><td>Content-type:</td><td> 
<select name="Ctyp">
<option value="text/html">text/html
<option value="text/plain">text/plain
<option value="application/futuresplash">application/futuresplash
<option value="application/gzip">application/gzip
<option value="application/gzip-compressed">application/gzip-compressed 
<option value="application/gzipped">application/gzipped
<option value="application/java-vm">application/java-vm
<option value="application/midi">application/midi
<option value="application/netcdf">application/netcdf
<option value="application/rmf">application/rmf
<option value="application/shockwave-flash">application/shockwave-flash
<option value="application/vocaltec-media-format">application/vocaltec-media-format
<option value="application/www-form-urlencoded">application/www-form-urlencoded
<option value="application/zip">application/zip
<option value="application/zip-compressed">application/zip-compressed
<option value="application/zipped-mod">application/zipped-mod
<option value="audio/aif">audio/aif
<option value="audio/aifc">audio/aifc
<option value="audio/aiff">audio/aiff
<option value="audio/au">audio/au 
<option value="audio/basic">audio/basic
<option value="audio/gsm">audio/gsm
<option value="audio/karaoke">audio/karaoke
<option value="audio/microsoft-wave">audio/microsoft-wave
<option value="audio/mid">audio/mid
<option value="audio/midi">audio/midi
<option value="audio/rmf">audio/rmf
<option value="audio/mod">audio/mod
<option value="audio/mpeg">audio/mpeg
<option value="audio/swa">audio/swa
<option value="audio/mpegurl">audio/mpegurl
<option value="audio/next">audio/next
<option value="audio/pn-realaudio">audio/pn-realaudio
<option value="audio/pn-realaudio-plugin">audio/pn-realaudio-plugin
<option value="audio/wav">audio/wav
<option value="audio/wave">audio/wave
<option value="audio/zipped-mod"audio/zipped-mod
<option value="binary/wtv-bootrom">binary/wtv-bootrom
<option value="binary/wtv-flashblock">binary/wtv-flashblock
<option value="image/fido">image/fido
<option value="image/gif">image/gif
<option value="image/jpeg">image/jpeg
<option value="image/jpg">image/jpg
<option value="image/pjpeg">image/pjpeg
<option value="image/wtv-bitmap">image/wtv-bitmap
<option value="image/xbitmap">image/xbitmap
<option value="image/xbm">image/xbm
<option value="image">image
<option value="message/rfc822">message/rfc822
<option value="midi/mid">midi/mid
<option value="multipart/form-data">multipart/form-data
<option value="text/tellyscript">text/tellyscript
<option value="text/url">text/url
<option value="text">text
<option value="video/mpeg">video/mpeg
<option value="wtv/addresses">wtv/addresses
<option value="wtv/animation">wtv/animation
<option value="wtv/bitmap">wtv/bitmap
<option value="wtv/bootrom">wtv/bootrom
<option value="wtv/download-list">wtv/download-list
<option value="wtv/flashblock">wtv/flashblock
<option value="wtv/notice">wtv/notice
<option value="wtv/qats">wtv/qats
<option value="wtv/tv-channels">wtv/tv-channels
<option value="wtv/tv-listings">wtv/tv-listings
<option value="wtv/tv-smartlinks">wtv/tv-smartlinks
<option value="(null)/*">(null)/*
</select>
</td></tr>
</table>
<p>
<input type="submit">

ERIC
    ;

print "200 OK\n";
print "Content-length: ".length($tosendout)."\n";
print "Content-type: text/html\n\n";
print $tosendout;


}