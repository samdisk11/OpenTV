#!/usr/local/bin/perl
##############################################################################
# TextCounter                   Version 1.2.1                                #
# Copyright 1996-98 Matt Wright mattw@worldwidemart.com                      #
# Created 3/14/96               Last Modified 6/24/98                        #
# Scripts Archive at:           http://www.worldwidemart.com/scripts/        #
##############################################################################
# COPYRIGHT NOTICE                                                           #
# Copyright 1996-98 Matthew M. Wright  All Rights Reserved.                  #
#                                                                            #
# TextCounter may be used and modified free of charge by anyone so long as   #
# this copyright notice and the comments above remain intact.  By using this #
# code you agree to indemnify Matthew M. Wright from any liability that      #
# might arise from its use.                                                  #  
#                                                                            #
# Selling the code for this program without prior written consent is         #
# expressly forbidden.  In other words, please ask first before you try and  #
# make money off of my program.                                              #
#                                                                            #
# Obtain permission before redistributing this software over the Internet or #
# in any other medium.  In all cases copyright and header must remain intact.#
##############################################################################
# Define Variables

# Data Dir is the directory on your server that you wish to store the 
# count files in.  Each page that has the counter on it will have it's own 
# file.  

$data_dir = "ServiceVault\/cgi-bin\/Data\/";

# Valid-URI allows you to set up the counter to only work under specific 
# directories on your server.  Include any of these directories as they 
# appear in a URI, into this array.  More information on URI's available in 
# README.

@valid_uri = ('.');
$uri_check=0;
# Invalid-URI allows the owner of this script to set up the counter so 
# that certain portions of the web server that may be included in Valid-URI 
# cannot use the program.  Leave this commented out if you wish not to 
# block out certain parts.

#@invalid_uri = ('.shtml/','.html/');

##############################################################################
# Set Options

# Show Link allows you to add a link around the counter to point to 
# either instructions explaining to users how to set this up on the system 
# (useful if a system administrator wants to allow anyone to set things up 
# themselves).  Setting it to 0 will make no link, otherwise put the URL
# you want linked to the count here.

$show_link = "http://www.worldwidemart.com/scripts/";

# When Auto-Create is enabled, users will be able to auto-create the 
# count on their home pages by simply imbedding the Server Side Includes 
# call.  Setting auto_create to 1 enables it, 0 will disable it. Only 
# users in @valid_uri will be allowed to auto create.

$auto_create = "1";

# Show Date will show the date of when the count began if you set this 
# option to 1.  It will appear in yor document as [Count] hits since [Date].
# Set this to 0 and it will simply return the [Count].

$show_date = "1";

# Lock Seconds will define the number of seconds the script should sit 
# and wait for the lock file to be gone before it will overwrite it if it 
# is still there.  Every now and then a user will interrupt a page, causing 
# the script to halt and leave a lock file in place before the lock file 
# could be removed.  This defines how long it waits.

$lock_sec = "3";

# Padding Size define how many numbers will be shown as your count.  For 
# instance, if you want your count to say 00065 and have the zeros padded 
# up to five digits, then set $pad_size = "5";  If the number goes higher 
# than the pad_size, don't worry, there just won't be any zero's tacked 
# onto the front.

$pad_size = "5";

##############################################################################

# Print Content Type Header For Browser
print "Content-type: text/html\n\n";

# Get the page location from the DOCUMENT_URI environment variable.
$count_page = "$ENV{'DOCUMENT_URI'}";

# Check Valid-URI to make sure user can use this program.
&check_uri;

# Chop off any trailing /'s
if ($count_page =~ /\/$/) {
   chop($count_page);
}

# Any characters that are not letters or numbers are turned into an underscore
$count_page =~ s/[^\w]/_/g;
$lock_file = "$count_page\.lock";

# Check to see if file is locked by program already in use.
&check_lock($lock_sec);

# If the file exists, get the date and count out of it.  Otherwise, if 
# auto_create is allowed, create a new account.  If neither of these are 
# true, return an error.

if (-e "$data_dir$count_page") {
   open(COUNT,"$data_dir$count_page");
   $line = <COUNT>;
   chop($line) if $line =~ /\n$/;
   close(COUNT);
   ($date,$count) = split(/\|\|/,$line);
}
elsif ($auto_create == 1) {
   &create; 
}
else {
   &error('page_not_found');
}

# Increment Count.
$count++;
$print_count = $count;

# Get Count Length for use in padding.
$count_length = length($count);

# Pad the number if it is smaller than $pad_size.
for ($i = $pad_size;$i > $count_length;$i--) {
   $print_count = "0$print_count";
}

# Print the Count, Link and Date depending on what user has specified 
# they wish to print.

if ($show_date == 1) {
   if ($show_link =~ /http:\/\//) {
      print "<a href=\"$show_link\">$print_count</a> hits since $date";
   }
   else {
      print "$print_count hits since $date";
   }
}
else {
   if ($show_link =~ /http:\/\//) {
      print "<a href=\"$show_link\">$print_count</a>";
   }
   else {
      print "$print_count";
   }
}

# Open the count file and write the new count that has been incremented.
open(COUNT,">$data_dir$count_page") || &error('could_not_increment');
print COUNT "$date\|\|$count";
close(COUNT);

# Remove Lock File for next time script is run on that HTML page.
&clean_up;

sub check_uri {
   $uri_check = "0";

   foreach $uri (@valid_uri) {
      if ($ENV{'DOCUMENT_URI'} =~ /$uri/) {
         $uri_check = "1";
         last;
      }
   }

   foreach $uri (@invalid_uri) {
      if ($ENV{'DOCUMENT_URI'} =~ /$uri/) {
         $uri_check = "0";
	 last;
      }
   }

   if ($uri_check == 0) {
      &error('bad_uri');
   }
}

sub create {
   ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
   @months = ("January","February","March","April","May","June","July",
	      "August","September","October","November","December");
   $year += 1900;
   $date = "$months[$mon] $mday, $year";
   $count = "0";
   open(COUNT,">$data_dir$count_page") || &error('count_not_created');
   print COUNT "$date\|\|$count";
   close(COUNT);
}

sub error {
   $error = shift(@_);

   if ($error eq 'page_not_found') {
      print "[TextCounter Fatal Error: This Page Not Found\; Auto-Create Option Disabled]";
   }
   elsif ($error eq 'bad_uri') {
      print "[TextCounter Fatal Error: This Page Not In Valid URI]";
   }
   elsif ($error eq 'count_not_created') {
      print "[TextCounter Fatal Error: Could Not Write to File $datadir$count_page]";
   }
   elsif ($error eq 'could_not_increment') {
      print "[TextCounter Fatal Error: Could Not Increment Counter]";
   }
   exit;
}

sub check_lock {
   $time = $_[0];

   for ($i = 1;$i <= $time; $i++) {
      if (-e "$data_dir$lock_file") {
         sleep 1;
      }
      else {
         open(LOCK,">$data_dir$lock_file");
         print LOCK "0";
         close(LOCK);
         last;
      }
   }
}

sub clean_up {
   unlink("$data_dir$lock_file");
}
