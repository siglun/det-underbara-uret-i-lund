#!/usr/bin/perl -w

use strict;

my $tempfile = '/tmp/lengths'.$$.'.tmp';
my $wtotal = 0;
my $ctotal = 0;

print "\n-------  Omfattning  ---------\n";
print "Kapitel\t\tOrd\tTecken\n";
print   "------------------------------\n";

while(my $file = <kapitel-*.xml>) {
    print $file."\t";
    open(FIL,"<$file") or die "Cannot open $file";
    open(TEMP,">$tempfile") or die "Cannot open $tempfile";

    my $text = '';
    while(<FIL>) {
	chomp;
	$text .= ' '.$_;
    }

    $text =~ s/<[^>]*>/ /g;
    $text =~ s/<\!--.*?-->/ /g;
    $text =~ s/\s+/ /g;

    print TEMP $text;

    my $wsize = `wc -w $tempfile`;
    $wsize =~ s|\s+(\d+)\s+/.*\n|$1|;
    $wtotal += $wsize;

    my $csize = `wc -c $tempfile`;
    $csize =~ s|\s+(\d+)\s+/.*\n|$1|;
    $ctotal += $csize;


    print $wsize."\t".$csize."\n";
    close TEMP
	
}

unlink $tempfile;

print "------------------------------\n";
print "Total\t\t$wtotal\t$ctotal\n\n";
