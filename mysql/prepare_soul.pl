#!/usr/bin/perl

use strict;
use warnings;

use JSON;
use Storable qw(dclone);

my ($filename, $data_dir) = @ARGV;
unless (defined $filename) {
  die "input file name is required";
}
#print "$filename\n";
my $json;
{
  local $/; #Enable 'slurp' mode
  open my $fh, "<", $filename;
  $json = <$fh>;
  close $fh;
}

#$json =~ s/\R//g;

process_airports($json, "icao");
process_airports($json, "iata");
process_airports($json, "country");
process_airports($json, "name");

sub process_airports
{
  my $json = shift;
  my $type = shift;
  my $data = decode_json($json);

  open(PI, ">$data_dir/airports.$type.soul");

  foreach my $d (@{$data})
  {
    if($d->{$type} eq '\\N')
    {
      next;
    }

    my %xref = ();
    foreach my $key (keys %{$d})
    {
      if($key eq "pid")
      {
        $d->{"id"} = delete $d->{'pid'};
        $xref{"url"} = $d->{'id'};
      }
      elsif( ($key eq $type) && ($type eq "name") )
      {
          $d->{"term"} = $xref{"subtitle"} = delete $d->{"name"};
      }
      elsif($key eq $type)
      {
          $d->{"term"} = delete $d->{$type};
      }
      elsif($key eq "name")
      {
        $xref{"subtitle"} = delete $d->{"name"};
      }
      else
      {
        delete $d->{$key};
      }
    }

    $d->{"data"} = \%xref;

    print PI to_json($d, {'utf8' => 1, 'pretty' => 0}) . "\n";
  }

  close(PI);
}

