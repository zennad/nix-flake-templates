# A builder is a function which takes an attrs
# containing: the source "src" and the "version"
#
# e.g.
# { src
# , version }:
#
# it then returns a function which takes all the
# build arguments to be provided by callPackage
#
# e.g.
# { stdenv
# , lib
# , gcc
# , ... }:
#
