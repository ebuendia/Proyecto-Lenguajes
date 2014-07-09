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
my $path=readInput();
my @file=readFile($path);
print $file[0]