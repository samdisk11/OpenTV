###################################################################
#!/usr/bin/perl
#
# RFC 1421 6bit (BASE64) encoding
#
# 22-May-96 Darrin M. Gorski <dgorski@server.webbernet.net>
#
# NOTICE: This code can be freely distributed provided
# this notice remains intact.

package BASE64;

# set up encoding arrays...

@EBASE64 = ( 'A'..'Z','a'..'z','0'..'9','+','/' );
$DBASE64{'='} = -1;
$X = 0;
foreach(@EBASE64) {
        $DBASE64{"$_"} = $X;
        ++$X;
}


sub main'BASE64_decode
{
	$_ = $_[0];	
	s/(....)/&BASE64'decode_sub($1)/ge;
	$_;
}

sub decode_sub
{
        local(@n) = split(//, $_[0]);
        local(@m);
        foreach(0..$#n) { 
                $n[$_] = $DBASE64{$n[$_]};
	}
        $m[0] = ($n[0] << 2) | ($n[1] >> 4);
        $m[1] = (($n[1] & 0xf) << 4) | ($n[2] >> 2) if $n[2] >= 0;
        $m[2] = (($n[2] & 0x3) << 6) | $n[3] if $n[3] >= 0;
        pack("C*", @m);
}

sub main'BASE64_encode
{
	$_ = $_[0];
	s/((.|\n){1,3})/&BASE64'encode_sub($1)/ge;
	$_;
}

sub encode_sub
{
	local(@m) = split(//, $_[0]);
	local(@n);
        foreach(0..$#m) { 
                $m[$_] = ord($m[$_]);
	}
	$n[0] = ( $m[0] >> 2 );
	$n[1] = (((($m[0] & 0x3) << 6) | (($m[1] & 0xF0) >> 2)) >> 2);
	$n[2] = (((($m[1] & 0xF) << 4) | (($m[2] >> 6) << 2)) >> 2);
	$n[3] = ($m[2] & 0x3F);
	local($encstr) = "";
        foreach(0..3) {
                $encstr .= $EBASE64[$n[$_]];
	}
	if ( length($_[0]) < 3 ) {	# need padding?
		if ( length($_[0]) == 2 ) {
			substr($encstr,3,1) = "=";
		} elsif ( length($_[0]) == 1 ) {
			substr($encstr,2,2) = "==";
		} else {
			$encstr = "";
		}
	}
	substr($encstr,0,4);
}

1;

