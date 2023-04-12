#!/usr/bin/perl

my $rcsid='$Id: catbodies.pl,v 1.3 2001/07/20 15:42:13 siglun Exp siglun $';

my $log= <<'END';

  $Log: catbodies.pl,v $
  Revision 1.3  2001/07/20 15:42:13  siglun
  Fixat så att programmet fungerar även som CIG

  Revision 1.2  2001/07/05 08:51:38  siglun
  Fixed revision log


END

# Am I running as CGI

if($ENV{'REQUEST_METHOD'}) {
   print "Content-Type: text/html\n\n";

#   print "<pre>\n";
#   while( my ($key,$val) = each %ENV) {
#      print "$key $val\n";
#   }
#   print "</pre>\n";

}

my $path='/usr/local/bin/';
my $sgrep = $path.'sgrep -i -g xml -w a-zA-Z1-9 ';

my $query;
my $headtags  = "stag(\"head\") __ etag(\"head\")";
my $bodytags  = "stag(\"body\") __ etag(\"body\")";

my $htbody = "$sgrep ' $bodytags  containing $word '";
my $htbody = "$sgrep ' $bodytags '";

my $hthead = "$sgrep ' $headtags  containing $word '";
my $hthead = "$sgrep ' $headtags  '";

my $html = '';

my @files = split /\n/,`ls kapitel-??.html`;

while (my $file = shift @files) {
    $file =~ /\.html/;
    my $anchor = $`;
    $html .= '<p align="right"><a name="'.$anchor.'" href="Struktur.html">Tillbaka till innehållsförteckningen</a></p>'."\n" if($ENV{'REQUEST_METHOD'});
    $html .= `$hthead $file`."\n";
    $html .= `$htbody $file`."\n";
#    $html .= '.PSPIC krans.eps 6.0c 6.0c'."\n" unless($ENV{'REQUEST_METHOD'});
    $html .= '.bp'."\n" unless($ENV{'REQUEST_METHOD'});
}


print <<'END';
<?xml version='1.0' encoding="ISO-8859-1" ?>
<html>
<head>

<link rel="stylesheet" type="text/css" media="screen" href="SCRIPTS/report.css" />  

<title>Boken</title>
</head>
<body>
END


    print $html;

print "</body></html>\n";
