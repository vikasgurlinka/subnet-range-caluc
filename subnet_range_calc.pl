#!/usr/bin/perl
use 5.010;

require "C:/Users/vikasgurlinka/Downloads/perl/subnet_range_func.pl";

use Spreadsheet::Read qw(ReadData);
use Excel::Writer::XLSX;

$book = ReadData('24.xlsx');
@rows = Spreadsheet::Read::rows($book->[1]);
$k=scalar(@rows);

$workbook  = Excel::Writer::XLSX->new( 'subnet_range_out.xlsx' );
$worksheet = $workbook->add_worksheet();

for($i=1;$i<=$k;$i++){
$val='A'.$i;

$a=$book->[1]{$val};
#say $a;
$worksheet->write( "A$i", $book->[1]{$val});

@ip=range($book->[1]{$val});


$worksheet->write("B$i", "$ip[0]");
$worksheet->write("C$i", "$ip[1]");
$count =$i-1;
}
say "";
say "successfully caluclated ip_range for $count ip addresses";
$workbook->close;