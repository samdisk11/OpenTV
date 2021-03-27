$tosendout=<<"ERIC"
<body bgcolor="#000033" text="#999999" link="#AAAAAA" vlink="#AAAAAA">
<center>
<h1>Welcome to Extreamly Small Willie's</h1> 
<h1>Flash ROM Download Center!</h1>
</center>
<p>
Choose from any of our fine flash images! 
<p>
<hr>
Your ROM type is: $userromtype<br>
Your current build is: $userclientbuild<br>
Your bootrom build is: $userbootromversion<br>
<hr>
<p>
<b>US-LC2-0MB-8MB Plus Builds</b><p>

<table><tr><th>Build</th><th>Title</th><th>Size</th></tr>
<tr><td>2046</td><td href="wtv-build:/get-flash-start?path=0&totalParts=32&build=2046&Message=weekly-nondebug%20(part%20\$CurPartX%20of%2032)">weekly-nondebug</td><td>(32-solo Parts)</td></tr>
<tr><td>3454</td><td href="wtv-build:/get-flash-start?path=1&totalParts=41&build=3454&Message=weekly-nondebug%20(part%20\$CurPartX%20of%2041)">weekly-nondebug</td><td>(41 Parts)</td></tr>
<tr><td>3452</td><td href="wtv-build:/get-flash-start?path=3&totalParts=44&build=3452&Message=daily-debug%20(part%20\$CurPartX%20of%2044)">daily-debug</td><td>(44 Parts)</td></tr>
<tr><td>3203</td><td href="wtv-build:/get-flash-start?path=4&totalParts=28&build=3203&Message=export-nondebug%20(part%20\$CurPartX%20of%2028)">export-nondebug</td><td>(28 Parts)</td></tr>
</table><p>			
<hr>

<p>
<b>bf0app Classic Builds</b><p><p>
These are used as experimental purposes.  If downloaded please use caution.<p>
<table><tr><th>Build</th><th>Title</th><th>Size</th></tr>
<tr><td>110</td><td href="wtv-build:/get-flash-start?path=2&build=110&totalParts=16&Message=production-external%20(Part%20\$CurPartX%20of%2016)">production-external</td><td>(16 Parts)</td></tr>
<tr><td>1047.1</td><td href="wtv-build:/get-flash-start?path=5&build=1047.1&totalParts=16&Message=nondebug-weekly%20(Part%20\$CurPartX%20of%2016)">nondebug-weekly</td><td>(16 Parts)</td></tr>
<tr><td>253</td><td href="wtv-build:/get-flash-start?path=6&build=253&totalParts=16&Message=nondebug-internal%20(Part%20\$CurPartX%20of%2016)">nondebug-internal</td><td>(16 Parts)</td></tr>
</table>
ERIC
    ;

if($httpREQ){
$tosendout=~s/wtv-build:/\/wtv-build/g;
}

print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;



