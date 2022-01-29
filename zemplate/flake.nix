{
  inputs = {
    flake-utils = {
      url = github:numtide/flake-utils;
    };
  };
  outputs =
    { nixpkgs
    , flake-utils
    , self
    , ... }:
    flake-utils.lib.eachDefaultSystem (system: rec {
      packages =
        let pkgs = nixpkgs.legacyPackages.${system};
            srcs =
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
                # example =
                #   {
                #     src = self.inputs.example;
                #     version = "master";
                #     overrides = {};
                #   };
              };
        in
        flake-utils.lib.flattenTree
          (import ./default.nix
            {
              nixpkgs = pkgs;
              srcs = import ./srcs.nix { nixpkgs = pkgs;
                                         inherit srcs; };
            });
    });
}
