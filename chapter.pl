#!/usr/bin/perl

open EPS,"<$ARGV[0]";

while(my $line = <EPS>) {
    $line =~ s/__chapterxx__/$ARGV[1]/ig;
    print $line;
}


