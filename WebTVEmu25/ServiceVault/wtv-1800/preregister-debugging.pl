# Thank you eMac for the great boxAPI. it really helps to identify box types.

#generic trickery used by mattman to get DC/new boxes to work
#note to github: get this to work without windows
$speed3=Win32::GetTickCount();

$dectime=(time)/86.4;
$dectime=substr($dectime,5,7);

$speed=(($speed3)-($speed1));


#perform the checking of the box
if( find("?ethernet",$par); ){
   #Newer Client found, give new loader
   print <<SAM;
   300 Moved.
   Content-length: 0
   Location: preregister_otherclients

SAM
    ;
};
