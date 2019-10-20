#!/usr/local/bin/perl
##############################################################################
# WWWBoard                      Version 2.0 ALPHA 2.1                        #
# Copyright 1996 Matt Wright    mattw@worldwidemart.com                      #
# Created 10/21/95              Last Modified 11/25/95                       #
# Security Patches/Bug Fixes:   January 07, 2000                             #
# Scripts Archive at:           http://www.worldwidemart.com/scripts/        #
##############################################################################
# COPYRIGHT NOTICE                                                           #
# Copyright 1996 Matthew M. Wright  All Rights Reserved.                     #
#                                                                            #
# WWWBoard may be used and modified free of charge by anyone so long as      #
# this copyright notice and the comments above remain intact.  By using this #
# code you agree to indemnify Matthew M. Wright from any liability that      #  
# might arise from it's use.                                                 #  
#                                                                            #
# Selling the code for this program without prior written consent is         #
# expressly forbidden.  In other words, please ask first before you try and  #
# make money off of my program.                                              #
#                                                                            #
# Obtain permission before redistributing this software over the Internet or #
# in any other medium.  In all cases copyright and header must remain intact.#
##############################################################################
# Define Variables

$basedir = "ServiceVault\/cgi-bin\/wwwboard";
$baseurl = "$ENV{DOCUMENT_PROTO}/wwwboard";
$cgi_url = "wwwboard.cgi";

$mesgdir = "messages";
$datafile = "data.txt";
$mesgfile = "wwwboard.html";
$faqfile = "faq.html";

$ext = "html";

$title = "WWWBoard Version 2.0 Test (WebTV Eulator 2.0.5)";

# Done
###########################################################################

###########################################################################
# Configure Options

$show_faq = 1;		# 1 - YES; 0 = NO
$allow_html = 1;	# 1 = YES; 0 = NO
$quote_text = 1;	# 1 = YES; 0 = NO
$subject_line = 0;	# 0 = Quote Subject Editable; 1 = Quote Subject 
			#   UnEditable; 2 = Don't Quote Subject, Editable.
$use_time = 1;		# 1 = YES; 0 = NO

$show_poster_ip = 1;    # 1 = Show the IP of every poster; 0 = Don't
$enforce_max_len = 0;   # 2 = YES, error; 1 = YES, truncate; 0 = NO
%max_len = ('name', 50, 
            'email', 70, 
            'subject', 80, 
            'url', 150, 
            'url_title', 80,
            'img', 150,
            'body', 3000,
            'origsubject', 80,
            'origname', 50,
            'origemail', 70,
            'origdate', 50);
# Done
###########################################################################

# Get the Data Number
&get_number;

# Get Form Information
&parse_form;

# Put items into nice variables
&get_variables;

# Open the new file and write information to it.
&new_file;

# Open the Main WWWBoard File to add link
&main_page;

# Now Add Thread to Individual Pages
if ($num_followups >= 1) {
   &thread_pages;
}

# Return the user HTML
&return_html;

# Increment Number
&increment_num;

############################
# Get Data Number Subroutine

sub get_number {
   open(NUMBER,"$basedir/$datafile");
   $num = <NUMBER>;
   close(NUMBER);
   if ($num == 999999 || $num !~ /^\d+$/)  {
      $num = "1";
   }
   else {
      $num++;
   }
}

#######################
# Parse Form Subroutine

sub parse_form {
   local($name,$value);

   # Get the input
$buffer=$ENV{CONTENT};

   # Split the name-value pairs
   @pairs = split(/&/, $buffer);

   foreach $pair (@pairs) {
      ($name, $value) = split(/=/, $pair);

      # Un-Webify plus signs and %-encoding
      $value =~ tr/+/ /;
      $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

      # Remove any NULL characters, Server Side Includes
      $value =~ s/\0//g;
      $value =~ s/<!--(.|\n)*-->//g;

      if ($allow_html != 1) {
         $value =~ s/<([^>]|\n)*>//g;
      }
      else {
         unless ($name eq 'body') {
	    $value =~ s/<([^>]|\n)*>//g;
         }
      }

      $FORM{$name} = $value;
   }

   # Make sure that message fields do not exceed allowed value
   if ($enforce_max_len) {
      foreach $name (keys %max_len) {
         if (length($FORM{$name}) > $max_len{$name}) {
            if ($enforce_max_len == 2) { &error('field_size'); }
            else { $FORM{$name} = sprintf("%.$max_len{$name}s",$FORM{$name}); }
         }
      }
   }
}

###############
# Get Variables

sub get_variables {

   if ($FORM{'followup'}) {
      $followup = "1";
      @followup_num = split(/,/,$FORM{'followup'});

      # Changes based in part on information contained in BugTraq archives
      # message 'WWWBoard Vulnerability' posted by Samuel Sparling Nov-09-1998.
      # Also requires that each followup number is in fact a number, to 
      # prevent message clobbering.

      local(%fcheck);
      foreach $fn (@followup_num) {
         if ($fn !~ /^\d+$/ || $fcheck{$fn}) { &error('followup_data'); }
         $fcheck{$fn} = 1;
      }
      @followup_num = keys %fcheck;

      $num_followups = @followups = @followup_num;
      $last_message = pop(@followups);
      $origdate = "$FORM{'origdate'}";
      $origname = "$FORM{'origname'}";
      $origsubject = "$FORM{'origsubject'}";
   }
   else {
      $followup = "0";
   }

   if ($FORM{'name'}) {
      $name = "$FORM{'name'}";
      $name =~ s/"//g;
      $name =~ s/<//g;
      $name =~ s/>//g;
      $name =~ s/\&//g;
   }
   else {
      &error(no_name);
   }

   if ($FORM{'email'} =~ /.*\@.*\..*/) {
      $email = "$FORM{'email'}";
   }

   if ($FORM{'subject'}) {
      $subject = "$FORM{'subject'}";
      $subject =~ s/\&/\&amp\;/g;
      $subject =~ s/"/\&quot\;/g;
   }
   else {
      &error(no_subject);
   }

   if ($FORM{'url'} =~ /.*\:.*\..*/ && $FORM{'url_title'}) {
      $message_url = "$FORM{'url'}";
      $message_url_title = "$FORM{'url_title'}";
   }

   if ($FORM{'img'} =~ /.*tp:\/\/.*\..*/) {
      $message_img = "$FORM{'img'}";
   }

   if ($FORM{'body'}) {
      $body = "$FORM{'body'}";
      $body =~ s/\cM//g;
      $body =~ s/\n\n/<p>/g;
      $body =~ s/\n/<br>/g;

      $body =~ s/&lt;/</g; 
      $body =~ s/&gt;/>/g; 
      $body =~ s/&quot;/"/g;
   }
   else {
      &error(no_body);
   }

   if ($quote_text == 1) {
      $hidden_body = "$body";
      $hidden_body =~ s/</&lt;/g;
      $hidden_body =~ s/>/&gt;/g;
      $hidden_body =~ s/"/&quot;/g;
   }

   ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);

   $month = ($mon + 1);

   @months = ("January","February","March","April","May","June","July","August","September","October","November","December");

   $year += 1900;
   $long_date = sprintf("%s %02d, %4d at %02d:%02d:%02d",$months[$mon],$mday,$year,$hour,$min,$sec);

   $year %= 100;
   if ($use_time == 1) {
      $date = sprintf("%02d:%02d:%02d %02d/%02d/%02d",$hour,$min,$sec,$month,$mday,$year);
   }
   else {
      $date = sprintf("%02d/%02d/%02d",$month,$mday,$year);
   }
}      

#####################
# New File Subroutine

sub new_file {

   open(NEWFILE,">$basedir/$mesgdir/$num\.$ext");
   print NEWFILE "<html>\n";
   print NEWFILE "  <head>\n";
   print NEWFILE "    <title>$subject</title>\n";
   print NEWFILE "  </head>\n";
   print NEWFILE "  <body>\n";
   print NEWFILE "    <center>\n";
   print NEWFILE "      <h1>$subject</h1>\n";
   print NEWFILE "    </center>\n";
   print NEWFILE "<hr size=7 width=75%>\n";
   if ($show_faq == 1) {
      print NEWFILE "<center>[ <a href=\"#followups\">Follow Ups</a> ] [ <a href=\"#postfp\">Post Followup</a> ] [ <a href=\"$baseurl/$mesgfile\">$title</a> ] [ <a href=\"$baseurl/$faqfile\">FAQ</a> ]</center>\n";
   }
   else {
      print NEWFILE "<center>[ <a href=\"#followups\">Follow Ups</a> ] [ <a href=\"#postfp\">Post Followup</a> ] [ <a href=\"$baseurl/$mesgfile\">$title</a> ]</center>\n";
   }
   print NEWFILE "<hr size=7 width=75%><p>\n";

   print NEWFILE "Posted by ";

   if ($email) {
      print NEWFILE "<a href=\"mailto:$email\">$name</a> ";
   }
   else {
      print NEWFILE "$name \n";
   }
   if ($show_poster_ip) { print NEWFILE "($ENV{'REMOTE_ADDR'}) "; }
   print NEWFILE "on $long_date:<p>\n";

   if ($followup == 1) {
      print NEWFILE "In Reply to: <a href=\"$last_message\.$ext\">$origsubject</a> posted by ";

      if ($origemail) {
         print NEWFILE "<a href=\"$origemail\">$origname</a> on $origdate:<p>\n";
      }
      else {
         print NEWFILE "$origname on $origdate:<p>\n";
      }
   }

   if ($message_img) {
      print NEWFILE "<center><img src=\"$message_img\"></center><p>\n";
   }
   print NEWFILE "$body\n";
   print NEWFILE "<br>\n";
   if ($message_url) {
      print NEWFILE "<ul><li><a href=\"$message_url\">$message_url_title</a></ul>\n";
   }
   print NEWFILE "<br><hr size=7 width=75%><p>\n";
   print NEWFILE "<a name=\"followups\">Follow Ups:</a><br>\n";
   print NEWFILE "<ul><!--insert: $num-->\n";
   print NEWFILE "</ul><!--end: $num-->\n";
   print NEWFILE "<br><hr size=7 width=75%><p>\n";
   print NEWFILE "<a name=\"postfp\">Post a Followup</a><p>\n";
   print NEWFILE "<form method=POST action=\"$cgi_url\">\n";
   print NEWFILE "<input type=hidden name=\"followup\" value=\"";
   if ($followup == 1) {
      foreach $followup_num (@followup_num) {
         print NEWFILE "$followup_num,";
      }
   }
   print NEWFILE "$num\">\n";
   print NEWFILE "<input type=hidden name=\"origname\" value=\"$name\">\n";
   if ($email) {
      print NEWFILE "<input type=hidden name=\"origemail\" value=\"$email\">\n";
   }
   print NEWFILE "<input type=hidden name=\"origsubject\" value=\"$subject\">\n";
   print NEWFILE "<input type=hidden name=\"origdate\" value=\"$long_date\">\n";
   print NEWFILE "Name: <input type=text name=\"name\" size=50><br>\n";
   print NEWFILE "E-Mail: <input type=text name=\"email\" size=50><p>\n";
   if ($subject_line == 1) {
      if ($subject_line =~ /^Re:/) {
         print NEWFILE "<input type=hidden name=\"subject\" value=\"$subject\">\n";
         print NEWFILE "Subject: <b>$subject</b><p>\n";
      }
      else {
         print NEWFILE "<input type=hidden name=\"subject\" value=\"Re: $subject\">\n";
         print NEWFILE "Subject: <b>Re: $subject</b><p>\n";
      }
   } 
   elsif ($subject_line == 2) {
      print NEWFILE "Subject: <input type=text name=\"subject\" size=50><p>\n";
   }
   else {
      if ($subject =~ /^Re:/) {
         print NEWFILE "Subject: <input type=text name=\"subject\"value=\"$subject\" size=50><p>\n";
      }
      else {
         print NEWFILE "Subject: <input type=text name=\"subject\" value=\"Re: $subject\" size=50><p>\n";
      }
   }
   print NEWFILE "Comments:<br>\n";
   print NEWFILE "<textarea name=\"body\" COLS=50 ROWS=10>\n";
   if ($quote_text == 1) {
      @chunks_of_body = split(/\&lt\;p\&gt\;/,$hidden_body);
      foreach $chunk_of_body (@chunks_of_body) {
         @lines_of_body = split(/\&lt\;br\&gt\;/,$chunk_of_body);
         foreach $line_of_body (@lines_of_body) {
            print NEWFILE ": $line_of_body\n";
         }
         print NEWFILE "\n";
      }
   }
   print NEWFILE "</textarea>\n";
   print NEWFILE "<p>\n";
   print NEWFILE "Optional Link URL: <input type=text name=\"url\" size=50><br>\n";
   print NEWFILE "Link Title: <input type=text name=\"url_title\" size=48><br>\n";
   print NEWFILE "Optional Image URL: <input type=text name=\"img\" size=49><p>\n";
   print NEWFILE "<input type=submit value=\"Submit Follow Up\"> <input type=reset>\n";
   print NEWFILE "<p><hr size=7 width=75%>\n";
   if ($show_faq == 1) {
      print NEWFILE "<center>[ <a href=\"#followups\">Follow Ups</a> ] [ <a href=\"#postfp\">Post Followup</a> ] [ <a href=\"$baseurl/$mesgfile\">$title</a> ] [ <a href=\"$baseurl/$faqfile\">FAQ</a> ]</center>\n";
   }
   else {
      print NEWFILE "<center>[ <a href=\"#followups\">Follow Ups</a> ] [ <a href=\"#postfp\">Post Followup</a> ] [ <a href=\"$baseurl/$mesgfile\">$title</a> ]</center>\n";
   }
   print NEWFILE "</body></html>\n";
   close(NEWFILE);
}

###############################
# Main WWWBoard Page Subroutine

sub main_page {
   open(MAIN,"$basedir/$mesgfile") || die $!;
   @main = <MAIN>;
   close(MAIN);

   open(MAIN,">$basedir/$mesgfile") || die $!;
   if ($followup == 0) {
      foreach $main_line (@main) {
         if ($main_line =~ /<!--begin-->/) {
            print MAIN "<!--begin-->\n";
	    print MAIN "<!--top: $num--><li><a href=\"$mesgdir/$num\.$ext\">$subject</a> - <b>$name</b> <i>$date</i>\n";
            print MAIN "(<!--responses: $num-->0)\n";
            print MAIN "<ul><!--insert: $num-->\n";
            print MAIN "</ul><!--end: $num-->\n";
         }
         else {
            print MAIN "$main_line";
         }
      }
   }
   else {
      foreach $main_line (@main) {
	 $work = 0;
         if ($main_line =~ /<ul><!--insert: $last_message-->/) {
            print MAIN "<ul><!--insert: $last_message-->\n";
            print MAIN "<!--top: $num--><li><a href=\"$mesgdir/$num\.$ext\">$subject</a> - <b>$name</b> <i>$date</i>\n";
            print MAIN "(<!--responses: $num-->0)\n";
            print MAIN "<ul><!--insert: $num-->\n";
            print MAIN "</ul><!--end: $num-->\n";
         }
         elsif ($main_line =~ /\(<!--responses: (.*)-->(.*)\)/) {
            $response_num = $1;
            $num_responses = $2;
            $num_responses++;
            foreach $followup_num (@followup_num) {
               if ($followup_num == $response_num) {
                  print MAIN "(<!--responses: $followup_num-->$num_responses)\n";
		  $work = 1;
               }
            }
            if ($work != 1) {
               print MAIN "$main_line";
            }
         }
         else {
            print MAIN "$main_line";
         }
      }
   }
   close(MAIN);
}

############################################
# Add Followup Threading to Individual Pages
sub thread_pages {

   foreach $followup_num (@followup_num) {
      open(FOLLOWUP,"$basedir/$mesgdir/$followup_num\.$ext");
      @followup_lines = <FOLLOWUP>;
      close(FOLLOWUP);

      open(FOLLOWUP,">$basedir/$mesgdir/$followup_num\.$ext");
      foreach $followup_line (@followup_lines) {
         $work = 0;
         if ($followup_line =~ /<ul><!--insert: $last_message-->/) {
	    print FOLLOWUP "<ul><!--insert: $last_message-->\n";
            print FOLLOWUP "<!--top: $num--><li><a href=\"$num\.$ext\">$subject</a> <b>$name</b> <i>$date</i>\n";
            print FOLLOWUP "(<!--responses: $num-->0)\n";
            print FOLLOWUP "<ul><!--insert: $num-->\n";
            print FOLLOWUP "</ul><!--end: $num-->\n";
         }
         elsif ($followup_line =~ /\(<!--responses: (.*)-->(.*)\)/) {
            $response_num = $1;
            $num_responses = $2;
            $num_responses++;
            foreach $followup_num (@followup_num) {
               if ($followup_num == $response_num) {
                  print FOLLOWUP "(<!--responses: $followup_num-->$num_responses)\n";
                  $work = 1;
               }
            }
            if ($work != 1) {
               print FOLLOWUP "$followup_line";
            }
         }
         else {
            print FOLLOWUP "$followup_line";
         }
      }
      close(FOLLOWUP);
   }
}

sub return_html {
   print "Content-type: text/html\n\n";
   print "<html><head><title>Message Added: $subject</title></head>\n";
   print "<body><center><h1>Message Added: $subject</h1></center>\n";
   print "The following information was added to the message board:<p><hr size=7 width=75%><p>\n";
   print "<b>Name:</b> $name<br>\n";
   print "<b>E-Mail:</b> $email<br>\n";
   print "<b>Subject:</b> $subject<br>\n";
   print "<b>Body of Message:</b><p>\n";
   print "$body<p>\n";
   if ($message_url) {
      print "<b>Link:</b> <a href=\"$message_url\">$message_url_title</a><br>\n";
   }
   if ($message_img) {
      print "<b>Image:</b> <img src=\"$message_img\"><br>\n";
   }
   print "<b>Added on Date:</b> $date<p>\n";
   print "<hr size=7 width=75%>\n";
   print "<center>[ <a href=\"$baseurl/$mesgdir/$num\.$ext\">Go to Your Message</a> ] [ <a href=\"$baseurl/$mesgfile\">$title</a> ]</center>\n";
   print "</body></html>\n";
}

sub increment_num {
   open(NUM,">$basedir/$datafile") || die $!;
   print NUM "$num";
   close(NUM);
}

sub error {
   $error = $_[0];

   print "Content-type: text/html\n\n";

   if ($error eq 'no_name') {
      print "<html><head><title>$title ERROR: No Name</title></head>\n";
      print "<body><center><h1>ERROR: No Name</h1></center>\n";
      print "You forgot to fill in the 'Name' field in your posting.  Correct it below and re-submit.  The necessary fields are: Name, Subject and Message.<p><hr size=7 width=75%><p>\n";
      &rest_of_form;
   }
   elsif ($error eq 'no_subject') {
      print "<html><head><title>$title ERROR: No Subject</title></head>\n";
      print "<body><center><h1>ERROR: No Subject</h1></center>\n";
      print "You forgot to fill in the 'Subject' field in your posting.  Correct it below and re-submit.  The necessary fields are: Name, Subject and Message.<p><hr size=7 width=75%><p>\n";
      &rest_of_form;
   }
   elsif ($error eq 'no_body') {
      print "<html><head><title>$title ERROR: No Message</title></head>\n";
      print "<body><center><h1>ERROR: No Message</h1></center>\n";
      print "You forgot to fill in the 'Message' field in your posting.  Correct it below and re-submit.  The necessary fields are: Name, Subject and Message.<p><hr size=7 width=75%><p>\n";
      &rest_of_form;
   }
   elsif ($error eq 'field_size') {
      printf "<html><head><title>$title ERROR: Field too Long</title></head>\n";
      print "<body><center><h1>ERROR: Field too Long</h1></center>\n";
      print "One of the form fields in the message submission was too long.  The following are the limits on the size of each field (in characters):<p><ul>\n";
      print "<li>Name: $max_len{'name'}\n";
      print "<li>E-Mail: $max_len{'email'}\n";
      print "<li>Subject: $max_len{'subject'}\n";
      print "<li>Body: $max_len{'body'}\n";
      print "<li>URL: $max_len{'url'}\n";
      print "<li>URL Title: $max_len{'url_title'}\n";
      print "<li>Image URL: $max_len{'img'}\n";
      print "</ul>Please modify the form data and resubmit.<p><hr size=7 width=75%><p>\n";
      &rest_of_form;
   }
   else {
      print "ERROR!  Undefined.\n";
   }
   exit;
}

sub rest_of_form {

   print "<form method=POST action=\"$cgi_url\">\n";

   if ($followup == 1) {
      print "<input type=hidden name=\"origsubject\" value=\"$FORM{'origsubject'}\">\n";
      print "<input type=hidden name=\"origname\" value=\"$FORM{'origname'}\">\n";
      print "<input type=hidden name=\"origemail\" value=\"$FORM{'origemail'}\">\n";
      print "<input type=hidden name=\"origdate\" value=\"$FORM{'origdate'}\">\n";
      print "<input type=hidden name=\"followup\" value=\"$FORM{'followup'}\">\n";
   }
   print "Name: <input type=text name=\"name\" value=\"$FORM{'name'}\" size=50><br>\n";
   print "E-Mail: <input type=text name=\"email\" value=\"$FORM{'email'}\" size=50><p>\n";
   if ($subject_line == 1) {
      print "<input type=hidden name=\"subject\" value=\"$FORM{'subject'}\">\n";
      print "Subject: <b>$FORM{'subject'}</b><p>\n";
   } 
   else {
      print "Subject: <input type=text name=\"subject\" value=\"$FORM{'subject'}\" size=50><p>\n";
   }
   print "Message:<br>\n";
   print "<textarea COLS=50 ROWS=10 name=\"body\">\n";
   $FORM{'body'} =~ s/</&lt;/g;
   $FORM{'body'} =~ s/>/&gt;/g;
   $FORM{'body'} =~ s/"/&quot;/g;
   print "$FORM{'body'}\n";
   print "</textarea><p>\n";
   print "Optional Link URL: <input type=text name=\"url\" value=\"$FORM{'url'}\" size=45><br>\n";
   print "Link Title: <input type=text name=\"url_title\" value=\"$FORM{'url_title'}\" size=50><br>\n";
   print "Optional Image URL: <input type=text name=\"img\" value=\"$FORM{'img'}\" size=45><p>\n";
   print "<input type=submit value=\"Post Message\"> <input type=reset>\n";
   print "</form>\n";
   print "<br><hr size=7 width=75%>\n";
   if ($show_faq == 1) {
      print "<center>[ <a href=\"#followups\">Follow Ups</a> ] [ <a href=\"#postfp\">Post Followup</a> ] [ <a href=\"$baseurl/$mesgfile\">$title</a> ] [ <a href=\"$baseurl/$faqfile\">FAQ</a> ]</center>\n";
   }
   else {
      print "<center>[ <a href=\"#followups\">Follow Ups</a> ] [ <a href=\"#postfp\">Post Followup</a> ] [ <a href=\"$baseurl/$mesgfile\">$title</a> ]</center>\n";
   }
   print "</body></html>\n";
}
