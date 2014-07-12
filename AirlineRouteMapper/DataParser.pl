#!/usr/bin/perl

use 5.010;
use strict;
use warnings;
use Math::Trig;
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
	open (MYFILE, '>datosparseados.txt');
	my @tmp1,my @tmp2;
	
	my %airinfo = loadAirportInfo("airlocations.tsv");
	foreach my $line(@file)
	{
		$line=~ s/^\s+|s+$//g;
		$line=~ s/\t+/:/g;
		# print $line;
		# my @parameters= split(/\W+/,$line);
		my @rparameters= split(":",$line);
		if(defined $airinfo{$rparameters[1]} and defined $airinfo{$rparameters[2]})
		{
			@tmp1= split(":",$airinfo{$rparameters[1]});
			@tmp2= split(":",$airinfo{$rparameters[2]});
			my $distance = calcDistance($tmp1[1],$tmp1[2],$tmp2[1],$tmp2[2]);
			my $tiempo = calcTime($distance);
			print MYFILE $tmp1[0] . ":";
			print MYFILE $tmp1[3] . ":";
			print MYFILE $tmp1[4] . ":";
			print MYFILE $tmp1[5] . ":";
			print MYFILE $tmp2[0] . ":";
			print MYFILE $tmp2[3] . ":";
			print MYFILE $tmp2[4] . ":";
			print MYFILE $tmp2[5] . ":";
			print MYFILE $distance . ":";
			print MYFILE $tiempo . ":";
			print MYFILE "\n";
		}
		
		# print $tmp1[0]. " " . $tmp2[0] . "\n";
		# print $rparameters[1]. " " . $rparameters[2] . "\n";
		# print $airinfo{$rparameters[1]} .  " " . $airinfo{$rparameters[2]} . "\n";
	}

}
sub calcDistance
{
	my ($latitud1,$longitud1,$latitud2,$longitud2) = @_;
	my $radiotierra=6371;
	my $dlat= deg2rad($latitud2-$latitud1);
	my $dlon= deg2rad($longitud2-$longitud1);
	my $a = (sin($dlat/2) * sin($dlat/2)) + (cos(deg2rad($latitud1)) * cos(deg2rad($latitud2)) * sin($dlon/2) * sin($dlon/2));
	my $c = 2 * atan2(sqrt($a),sqrt(1-$a));
	my $d = $radiotierra * $c;
	# return sin(deg2rad(90));
	return $d;
	
}
sub calcTime
{
	return $_[0]/890;
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