{ nixpkgs ? import <nixpkgs> {}
, srcs ? {}
, ... }:

with nixpkgs;
{
  # sources are attribute sets
  # containing at least three attributes:
  # src, version and overrides.
  #
  # src <- the project source
  # version <- the project version id
  #  (might be the branch or tag)
  # overrides <-
  #  the overrides which are passed to callPackage
  #
  # example = {
  #   version = foo;
  #   src = bar;
  #   overrides = {};
  # };
} // srcs
