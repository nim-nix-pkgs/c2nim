{
  description = ''c2nim is a tool to translate Ansi C code to Nim.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-c2nim-0_9_17.flake = false;
  inputs.src-c2nim-0_9_17.owner = "nim-lang";
  inputs.src-c2nim-0_9_17.ref   = "refs/tags/0.9.17";
  inputs.src-c2nim-0_9_17.repo  = "c2nim";
  inputs.src-c2nim-0_9_17.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-c2nim-0_9_17"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-c2nim-0_9_17";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}