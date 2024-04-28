# Install postgresql on MacBook with Apple Silicon Chip
via homebrew

brew update

brew install postgresql

brew services start postgresql@14

brew services stop postgresql@14

brew services list

psql command will become available if postgresql is running

if you don't want/need a background service you can just run:
/opt/homebrew/opt/postgresql@14/bin/postgres -D /opt/homebrew/var/postgresql@14
