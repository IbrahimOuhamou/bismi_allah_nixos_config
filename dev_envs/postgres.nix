# بسم الله الرحمن الرحيم
# la ilaha illa Allah Mohammed Rassoul Allah
with import <nixpkgs> {};
mkShell {
  buildInputs = [
    postgresql
  ];

  shellHook = ''
    initdb -D /tmp/postresql/bismi_allah_db
    pg_ctl -D /tmp/postresql/bismi_allah_db -l /tmp/postresql/logfile start

    trap "pg_ctl -D /tmp/postresql/bismi_allah_db stop" EXIT
  '';
}
