{lib, ...}: {
  options.flake.wrappersModules = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.raw;
    default = {};
  };
}
