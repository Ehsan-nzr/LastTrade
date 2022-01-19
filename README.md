# LastTrade
"LastTrade" is a small task which implemented by Asp.net core 3.1 

## How to run 

> Build project :
- Restore `TestDb.bak` in sql.
- Execute `LastTrade.sql` (LastTrade\DataAccess) in TestDb Database.
- Config `Configuration.config` and copy in "C:\\".
- Build all projects (DataAccess, Domain, Service and ConsoleApplication)
- Run `ConsoleApp.exe` in LastTrade\ConsoleApp path.
- After the program running finish, a json file that called `path.txt` will create in "C:\\".
