# بسم الله الرحمن الرحيم
# la ilaha illa Allah Mohammed Rassoul Allah
with import <nixpkgs> {
  config = {
    allowUnfree = true;
  };
};
mkShell {
  buildInputs = [
    mongodb-ce
    mongodb-compass
    mongosh
  ];

  shellHook = ''
    echo 'بسم الله الرحمن الرحيم'
    echo 'la ilaha illa Allah Mohammed Rassoul Allah'
    echo "Setting up MongoDB CE environment..."

    # Define paths for MongoDB data and logs
    DB_DIR=/tmp/mongodb/bismi_allah_db
    LOG_FILE=/tmp/mongodb/mongod.log

    # Create necessary directories
    mkdir -p $DB_DIR

    # Start MongoDB server
    mongod --dbpath $DB_DIR --logpath $LOG_FILE --fork

    # Wait for the server to be ready
    sleep 3

    # Create an admin user using mongosh
    echo "Creating MongoDB admin user..."
    mongosh admin --eval "db.createUser({
      user: 'admin',
      pwd: 'bismi_allah',
      roles: [{ role: 'root', db: 'admin' }]
    })"

    echo "MongoDB setup complete. Use 'mongosh' to connect."

    # Ensure MongoDB stops when the shell exits
    trap "mongod --dbpath $DB_DIR --shutdown" EXIT
  '';
}
