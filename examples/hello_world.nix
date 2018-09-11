let
  pkgs = import <nixpkgs> { overlays = [ (import ../pkgs) ]; };
in {
  bash = pkgs.writeBash "hello-world" ''
    echo 'hello world'
  '';
  c = pkgs.writeC "hello-world"  {} ''
    #include <stdio.h>
    int main() {
      printf("hello world\n");
      return 0;
    }
  '';
  dash = pkgs.writeDash "hello-world" ''
    echo 'hello world'
  '';
  haskell = pkgs.writeHaskell "hello-world" [] ''
    main = do
      putStrLn "hello world"
  '';
  python2 = pkgs.writePython2 "hello-world" {} ''
    print "hello world"
  '';
  python3 = pkgs.writePython3 "hello-world" {} ''
    print("hello world")
  '';
  sed = pkgs.writeDash "sed-example" ''
    echo xxx | ${pkgs.writeSed "hello-world" "s/xxx/hello world/"}
  '';
}