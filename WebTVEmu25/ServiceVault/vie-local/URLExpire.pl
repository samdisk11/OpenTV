splitq("$ENV{QUERY_STRING}&$ENV{CONTENT}");



if($qrs{'search'}){
$extraXC="A header was sent out for \"$qrs{'search'}\"";
}

$tosendout=<<"ERIC"
<title>Cached URL Expire Setup</title>
<head>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<h1>Cached URL Expire Setup</h1>
<p>
Within the box's RAM there is the service buffer, back list, internal cache, and the browser image.  The black list is what is used to tell the box which page to go when you press back.  The internal cache comes in three forms.  The internal browser cache contains the ASCII part of a HTML document (all the text that you see once parsed), the actual HTML code and the thumbnail image.  The internal browser cache also contains the cache: pages.  WNI developers has defined 3 important headers that control internal cache and the back list.  One function is the ability to forget a cache entry and expire it.  Another is to reload a cache entry and still be able to remember it is still there.  The third is to delete a back entry.  These functions work on a search.  For example if I type "wtv-" all pages that have a wtv- in it will be cleared or reloaded.  There is also a loop that takes place in the box which validates the cache to see if it has all the pages organized correctly and it also checks to see if there is a entry missing that needs to be there if the box is logged in.  These pages include the cookie list, favorite list, address list ect.  Since the expire makes the box forget the entry is there then the page will be requested again and reloaded into cache.  This page uses these three headers so you can control cache and back list entries.
<p>
$extraXC
<p>

<table>
<tr><td>Operation:&nbsp;&nbsp;</td><td>
<form method="POST">

<select name="RetireCachePage">
<option value="1">Expire all pages that match this
<option value="2">Clear all back pages that match this
<option value="3">Reload all pages that match this
</select>
</td></tr>
<tr><td>URL Search</td><td><input bgcolor="#191919" text="#44cc55" value="$search" name="search" select nohighlight border=0>
</td></tr>
</table>
<p>
<input type=submit value="Demolish">




ERIC
    ;


print "200 OK.\n";
print "wtv-expire-all: wtv-tricks\n";

if($qrs{'RetireCachePage'} eq "1"){
print "wtv-expire-all: $qrs{'search'}\n"
}elsif($qrs{'RetireCachePage'} eq "2"){
print "wtv-noback-all: $qrs{'search'}\n"
}else{
print "wtv-reload-all: $qrs{'search'}\n"
}

print "Content-length: ".length($tosendout)."\n";
print "Content-type: text/html\n\n";
print $tosendout;





