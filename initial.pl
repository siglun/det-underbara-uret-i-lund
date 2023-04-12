#!/usr/bin/perl

my $text = $ARGV[0];

$text =~ s/\s+/_/g;

my @chars = split /\s*/,$text;
my $newstring=1;

$change=3;

print '\s-'.$change;
while(my $c=shift @chars) {

    if($c =~ m/\_/) {
	if($newstring) {
	    print ' ';
	} else {
	    print '\s+'.$change.' \s-'.$change;
	}
	$newstring=1;
    } else {
	if($c =~ m/[A-ZÅÄÖ]/) {
	    print '\s+'.$change.$c.'\s-'.$change;
	} else {
	    $c =~ tr /a-zåäö/A-ZÅÄÖ/;
	    print $c;
	}
	$newstring=0;
    }
}

print "\\s+$change\n";

