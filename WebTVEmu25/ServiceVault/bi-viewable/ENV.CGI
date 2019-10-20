#!/usr/local/bin/perl

print "Content-type: text/html\n\n";

print "<h1>Enviorment Variables for WE 2.0.5</h1>\n<table>\n";

foreach  (keys %ENV) {
print "<tr><td>$_</td><td>=</td><td>$ENV{$_}</td></tr>\n";
}


print "</table>";