use strict;
use warnings;

package Net::TVDB::Series;

# ABSTRACT: Represents a TV Series

use Net::TVDB::Actor;
use Net::TVDB::Banner;

# Assessors
# alphabetically, case insensitive
# from http://www.thetvdb.com/api/GetSeries.php?seriesname=...
use Object::Tiny qw(
  banner
  FirstAired
  id
  IMDB_ID
  language
  Overview
  seriesid
  SeriesName
  zap2it_id

  actors
  banners
);

# parse actors.xml
sub _parse_actors {
    my ( $self, $xml ) = @_;

    my @actors;
    for ( @{ $xml->{Actor} } ) {
        push @actors, Net::TVDB::Actor->new( %{$_} );

    }
    $self->{actors} = \@actors;
    return $self->{actors};
}

# parse banners.xml
sub _parse_banners {
    my ( $self, $xml ) = @_;

    my @banners;
    for ( @{ $xml->{Banner} } ) {
        push @banners, Net::TVDB::Banner->new( %{$_} );

    }
    $self->{banners} = \@banners;
    return $self->{banners};
}

1;
