{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  env.GREET = "devenv";

  packages = [ pkgs.git ];

  languages.rust = {
    enable = true;
    channel = "stable";
    components = ["cargo" "rust-analyzer" "rust-src" "rustfmt" "rustc"];
  };
}
