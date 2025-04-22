# GitSubCommands
Custom Git subcommands to simplify common tasks.

## Intended branch layout.
These subcommands are intended to support a code-base that differs between clients.  Each client has development (```/<client>/devops```), QA (```/<client>/qa```), and production (```/<client>/prod```) branches.  Additionally, there are branches used to merge hotfixes and releases between these: ```/<client>/mergeto/devops```, ```/<client>/mergeto/qa```, ```/<client>/mergeto/prod```.

Features are developed under the respective client structure: ```/<client>/feature/<user>/<feature_name>```.

Temporary branches are created that mimic the client structure prefixed with "/temp" (e.g., ```/temp/<client>/feature/<user>/<feature_name>```).

There is a ```master``` branch that is not in sync with any client branch and needs to be updated.
