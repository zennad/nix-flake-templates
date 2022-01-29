{ nixpkgs ? import <nixpkgs> {}
, srcs ? import ./srcs.nix
, builder ? import ./builder.nix
, ... }:
with nixpkgs;
builtins.mapAttrs
  (x: y: (a: callPackage
               (builder a))
           { inherit (y) src version; }
           y.overrides)
  srcs
