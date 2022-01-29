{ nixpkgs ? import <nixpkgs> {}
, srcs ? {}
, builder ? import ./builder.nix
, ... }:

let mapper = s: import ./mapper.nix {
                  inherit nixpkgs builder;
                  srcs = s;
                };
in
mapper (if builtins.pathExists (./. + "srcs.nix")
        then import ./srcs.nix { inherit srcs; }
        else srcs)
