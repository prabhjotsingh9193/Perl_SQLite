#!/usr/bin/perl

use DBI;
use strict;

my $driver   = "SQLite"; 
my $database = "Users.db";
my $dsn = "DBI:$driver:$database";
my $userid = "";
my $password = "";
my $dbh = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) 
   or die $DBI::errstr;
print "Opened database successfully\n";

my $stmt = qq(SELECT ID, FirstName, LastName, Home from UserDetails;);
my $sth = $dbh->prepare( $stmt );
my $rv = $sth->execute() or die $DBI::errstr;

if($rv < 0) {
   print $DBI::errstr;
}

while(my @row = $sth->fetchrow_array()) {
      print "ID = ". $row[0] . "\n";
      print "First Name = ". $row[1] ."\n";
      print "Last Name = ". $row[2] ."\n";
      print "Home =  ". $row[3] ."\n\n";
}
print "Operation done successfully\n";
$dbh->disconnect();