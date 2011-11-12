
use strict;
use warnings;

use 5.008008;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "intersecting lines and circles",
  "AUTHOR" => "Lutz Gehlen <perl\@lutzgehlen.de>",
  "BUILD_REQUIRES" => {
    "List::Util" => 0,
    "Test::Exception" => 0,
    "Test::More" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Math-Geometry-Construction",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Math::Geometry::Construction",
  "PREREQ_PM" => {
    "Carp" => 0,
    "LaTeX::TikZ" => 0,
    "List::MoreUtils" => 0,
    "Math::MatrixReal" => 0,
    "Math::Vector::Real" => "0.03",
    "Math::VectorReal" => 0,
    "Moose" => 0,
    "Moose::Role" => 0,
    "Params::Validate" => 0,
    "SVG" => 0,
    "Scalar::Util" => 0
  },
  "VERSION" => "0.014",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



