# Code Server / VS Code

## extensions.json

This file contains the extension recommendations for the workspace. Use @recommended in extension search to find extensions included in this file.

File Location:

* All: `<project-root>/.vscode/extensions.json`

## settings.json

This file contains user settings for Visual Studio Code / Code Server.

File Location:

* Code Server: `~/.local/share/code-server/User/settings.json`
* VS Code (MacOS): `~/Library/Application Support/Code/User/settings.json`

## tasks.json

This file is used to install all recommended extensions for the workspace automatically when the folder is opened in Code Server or VS Code.

Pre-requisites (if not already installed):

* Linux: `sudo apt-get update && sudo apt-get install jq`

File Location:

* All: `<project-root>/.vscode/tasks.json`
