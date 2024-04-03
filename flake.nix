{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem ( system:
        let 
            pkgs = import nixpkgs { inherit system; };

            astro = pkgs.writeShellApplication {
                name = "astro";
                runtimeInputs = [ pkgs.nodejs_21 ];
                text = ''
                   # serve localhost to port 4321
                   npm install 
                   npm run dev 
                '';
            };
        in with pkgs; {
            devShells.default = mkShell {
                buildInputs = [
                    nodejs_21
                ];
            };

            apps.default = {
                type = "app";
                program = "${astro}/bin/astro";
            };
        }
    );
}
