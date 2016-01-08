{ pkgs ? (import <nixpkgs> {}) }:

let
  env = with pkgs.haskellPackages; [
    pandoc
    pandoc-citeproc
    pandoc-crossref

    (pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-small
        algorithms
        cm-super
        collection-basic
        collection-bibtexextra
        collection-fontsextra
        collection-fontutils
        collection-langenglish
        collection-langgerman
        collection-latex
        collection-latexextra
        collection-latexrecommended
        collection-mathextra
        collection-metapost
        collection-pictures
        collection-plainextra
        collection-science
      ;
    })

    pkgs.lmodern
  ];
in

pkgs.stdenv.mkDerivation rec {
    name = "paper";
    src = ./.;
    version = "0.0.0";

    buildInputs = [ env ];

}

