##                                                                                            ##
#  This is a URL listing program used to list the files in the ServiceVault or Service Module  #
##                                                                                            ##




splitq("$ENV{QUERY_STRING}&$ENV{CONTENT}");

if($qrs{'dir'}){
$tosendout="";

$qrs{'dir'}=~s/\\/\//g;
$dirv="";
$block=0;
foreach (reverse(split(/\//,$qrs{'dir'}))){
next unless $_;
if($_ eq ".."){
$block+=1;
}elsif($_ eq "."){

}else{
if($block){
$block--;
}else{
$dirv="$_/".$dirv;
}

}

}

$qrs{'dir'}=$dirv;


if($qrs{'dir'}){





opendir(DIR,$qrs{'dir'});
@sdir=readdir(DIR);
closedir(DIR);




$messg="";
foreach	(@sdir){
if(-f "$qrs{'dir'}$_"){
/(\S*)\.(\S*)/;
$name=$1;
$type=$2;
$cont=$contentTypes{$type};
$cont=$contentTypes{"default"} if !($cont);
$cont="HANDLE" if $HandleTypes{$type};


if($qrs{'dir'} eq "ServiceVault/" or $qrs{'dir'} eq "Modules/" or $qrs{'dir'} eq "Modules/$DefaultS"){
$link="javascript:alert('This is the primary directory there is no way you can access this file ($_) by client request.')"
}else{

$pathx="$qrs{'dir'}$_";
($v,$pathx)=($pathx=~/(ServiceVault|Modules\/$DefaultS)\/(.*)/);

($servicex,$pathx)=($pathx=~/(\S+)\/(.*)/);

$link="$servicex:/$pathx";
}


}elsif(-d "$qrs{'dir'}$_"){
$name=$_;
$type="DIR";
$cont="[ None ]";
$link="wtv-tricks:/URLlist?dir=$qrs{'dir'}$_/";
}else{
$name=$_;
$type="-??-";
$cont="-??-";
$link="javascript:alert('I don't know how to serve this unknown entity.')";
}





if($_ eq $htfile){
$messg="This directory and it's subdirectories are protected by HTAccess.";
}else{
$tosendout.="<tr><td><a href=\"$link\">$name</a></td><td>$type</td><td>$cont</td>\n";
}

}


$tosendout=<<"ERIC"
<html>
<head>
<title>Service Directory Index</title>
</head>
<body bgcolor="#000033" text="#999999" link="#999999" vlink="#999999">
<center>
<h1>Service Directory Index</h1>
</center>
<p>
<h4>Index for: <i>$qrs{'dir'}</i></h4>
<p>
$messg
<p>
<table><tr><th>Name</th><th>Type</th><th>Content</th></tr>
$tosendout
</table>
ERIC
    ;

}else{
$tosendout=<<"ERIC"
<html>
<head>
<title>Service Directory Index</title>
</head>
<body bgcolor="#000033" text="#999999" link="#999999" vlink="#999999">
<center>
<h1>Service Directory Index</h1>
</center>
<p>
ERROR!!!!  You are not allowed to pass the main directory!!!!!!!  Please don't try!

</body>
</html>
ERIC
    ;

}

}else{
$tosendout=<<"ERIC"
<html>
<head>
<title>Service Directory Index</title>
</head>
<body bgcolor="#000033" text="#999999" link="#999999" vlink="#999999">
<center>
<h1>Service Directory Index</h1>
</center>
<p>
<h4>Main Selection</h4>
<p>
<a href=wtv-tricks:/URLlist?dir=ServiceVault/>Service Vault (Default Directory)</a<br>
<a href=wtv-tricks:/URLlist?dir=Modules/$DefaultS/>$DefaultS Module</a><p>

</body>
</html>

ERIC
    ;

}



print "200 OK\n";
print "Content-length: ".length($tosendout)."\n";
print "Content-type: text/html\n\n";
print $tosendout;


