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

  pandoc-filter = pkgs.buildPythonPackage rec {
    version = "1.2.4";
    name = "pandoc-filters-${version}";

    src = pkgs.fetchurl {
      url = "https://github.com/jgm/pandocfilters/archive/${version}.tar.gz";
      sha256 = "1g4k3h5zp454kih7wsk8jwkw50snirymimkxm4g9pqakynhi7sd6";
    };

    propagatedBuildInputs = with pkgs; [ python ];
  };

  pygraphviz = pkgs.pythonPackages.buildPythonPackage rec {
    version = "1.2";
    name = "pygraphviz-${version}";

    src = pkgs.fetchurl {
      url = "https://github.com/pygraphviz/pygraphviz/archive/${name}.tar.gz";
      sha256 = "0jyd049wj994y1h9k3xwvjk9jwzi6vpdj10767kq8alz86hp4ak5";
    };

    propagatedBuildInputs = [ pkgs.graphviz pkgs.pkgconfig ];

  };

in
pkgs.stdenv.mkDerivation rec {
    name = "paper";
    src = ./.;
    version = "0.0.0";

    buildInputs = [
      env
      pandoc-filter
      pygraphviz
    ];

}

