## iTerm settings

open the `Preferences>General`, then open the the preferences tab. Click the `Load preferences from custom folder or URL`, select the directory where you want to save the setting, currently `/Users/ap/projects/setup/mac/iTerm`, hit `Save Now`. Done!


## Generate brewfile

This will need to run in the `mac/brew` directory.

```shell
brew bundle dump --force # force to update existing file
```