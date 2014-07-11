#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

sub readInput
{
	
	my $file;
	if($ARGV[0])
	{
		$file=$ARGV[0];
	}
	else
	{
		print "Ingrese la ruta relativa del archivo a ser parseado.... \n";
		$file=<STDIN>;
		chomp $file;
	}
	
	return $file;

}
sub readFile
{
	my $path= $_[0];
	open(DATA, $path) or die "Couldn't open file $path, $!";
	# open( DATA, '<:encoding(UTF-8)', $path ) ;
	my @lineas= <DATA>;

	return (@lineas);
}

sub createRoutes
{
	my @file = @_;
	my @result;
	open (MYFILE, '>output.txt');
	my $outputline;
	my @airport1,my @airport2;
	foreach my $line(@file)
	{
		$line=~ s/^\s+|s+$//g;
		my @parameters= split(/\W+/,$line);
		#@airport1=getAirportInfo($parameters[1]);
		print MYFILE $parameters[0] . "|";
		print MYFILE $parameters[1] . "|";
		print MYFILE $parameters[2] . "|";
		print MYFILE "\n";
	}
}

sub getAirportInfo
{
	my $file = readFile("airports.dat");
}
my @file = readFile("routes.dat");
my @routes = createRoutes(@file);