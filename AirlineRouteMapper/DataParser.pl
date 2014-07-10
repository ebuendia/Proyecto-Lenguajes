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
sub readRoutes
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
	my $outputline;
	my $airport,$ciudad,$pais,$kilometros,$tiempo,$aerolinea;
	foreach my $line(@file)
	{
		
	}
}
my @file = readRoutes("routes.dat");
my @routes = createRoutes(@file);