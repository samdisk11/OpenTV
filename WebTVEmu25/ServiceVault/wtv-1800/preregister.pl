# Thank you eMac for the great boxAPI. it really helps to identify box types.

#generic trickery used by mattman to get DC/new boxes to work
#note to github: get this to work without windows
$speed3=Win32::GetTickCount();

$dectime=(time)/86.4;
$dectime=substr($dectime,5,7);

$speed=(($speed3)-($speed1));

#help im in perl-hell, this is workaround
$perlhell = index($par,"?ethernet");
#perform the checking of the box


if ($perlhell == 21){ 
  #Newer Client found, give new loader
  chop($url) if $url=~/ /;
  $lenc=length($tosendout);

#OK headers
print <<SAM;
300 Moved.
Content-length: 0
Location: wtv-1800:/preregister_otherclients

SAM
    ;
$lenc=0;
}else{
#Unknown/Older client found, give wTV loader.

#OK headers
print <<SAM;
300 Moved.
Content-length: 0
Location: wtv-1800:/preregister_webtv

SAM
    ;
}