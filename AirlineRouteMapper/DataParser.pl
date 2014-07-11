#!/usr/bin/perl

use 5.010;
use strict;
# use warnings;

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
	my @tmp1,my @tmp2;
	
	my %airinfo = loadAirportInfo("airlocations.tsv");
	foreach my $line(@file)
	{
		$line=~ s/^\s+|s+$//g;
		$line=~ s/\t+/:/g;
		# print $line;
		# my @parameters= split(/\W+/,$line);
		my @rparameters= split(":",$line);
		# @tmp1= split(":",$airinfo{$rparameters[1]});
		# @tmp2= split(":",$airinfo{$rparameters[2]});
		# print $tmp1[0]. " " . $tmp2[0] . "\n";
		# print $rparameters[1]. " " . $rparameters[2] . "\n";
		# print $airinfo{$rparameters[1]} .  " " . $airinfo{$rparameters[2]} . "\n";
	}
	if(defined $airinfo{"GYE"})
	{print "si esta vacio";}
}

sub loadAirportInfo
{
	my @airportfile = readFile($_[0]);
	my %airinfo;
	foreach my $line(@airportfile)
	{
		$line=~ s/^\s+|s+$//g;
		$line=~ s/\t+/:/g;
		my @tmp= split(":",$line);
		# print $tmp[0]. "\n";
		$airinfo{$tmp[0]} = $line;
	}
	return %airinfo;
}
my @file = readFile("routes.dat");
my @routes = createRoutes(@file);