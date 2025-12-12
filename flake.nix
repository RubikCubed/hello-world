{
  description = "hello world";

  outputs = { self, nixpkgs }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.hello = pkgs.stdenv.mkDerivation {
      pname = "hello";
      version = "1.0";

      src = ./.;

      buildPhase = ''
      	gcc main.c -o hello
      '';
      
      installPhase = ''
       mkdir -p $out/bin
       cp hello $out/bin
      '';
    };

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
  };
}

