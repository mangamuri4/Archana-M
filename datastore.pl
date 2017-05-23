#!c:/apache/perl/bin/perl.exe

use strict;
use warnings;
use CGI qw(param);
use DBI;

my $add_dt=param("add_dt");
my $add_tm=param("add_tm");
my $add_txt=param("add_txt");
#my $sear=param("search");
#my $type=param("type");

#my $dbh=DBI->connect("DBI:mysql:myDB","test","test");
print "Content-type: text/html\n\n";
my $dbfile = 'C:\sqlite\company.db';      
my $dbh = DBI->connect("DBI:SQLite:dbname=$dbfile","","",{ RaiseError => 1 },) or die $DBI::errstr;
my $sth;
 $sth=$dbh->prepare("INSERT INTO apointments (date,time,description) values ('$add_dt','$add_tm','$add_txt')");
	$sth->execute();
	$sth->finish();
	
 print <<HTML;
 print " date $add_dt, timt $add_tm, txt $add_txt";

<html>
  <head>
    <title>Archana Form</title>
  </head>
  <body>Inserted
  </body>
</html>
HTML

