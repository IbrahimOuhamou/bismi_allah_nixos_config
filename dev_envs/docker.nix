#بسم الله الرحمن الرحيم
#la ilaha illa Allah Mohammed Rassoul Allah

let pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  buildInputs = [ pkgs.docker ];
  shellHook = ''
    echo "بسم الله الرحمن الرحيم"
    echo "la ilaha illa Allah Mohammed Rassoul Allah"
    export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
  '';
}

