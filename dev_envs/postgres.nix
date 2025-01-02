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

    psql -U ibrahimo -d postgres -c "CREATE ROLE postgres WITH SUPERUSER LOGIN PASSWORD 'bismi_allah';"
    psql -U postgres -d postgres -c "ALTER USER postgres WITH PASSWORD 'bismi_allah';"

    trap "pg_ctl -D /tmp/postresql/bismi_allah_db stop" EXIT
  '';
}
