# dothaven - Darwin dotfiles repository managed via [chezmoi](https://www.chezmoi.io)

## Setup

Install [homebrew](https://brew.sh)

Run this to activate brew in current shell session.
```sh
eval "$(/opt/homebrew/bin/brew shellenv)"
```
Install chezmoi
```sh
brew install chezmoi
```

Run this to install the dotfiles.
```sh
chezmoi init --apply https://github.com/arkodoescode/dothaven.git
```

## Post Setup

- Login to Box Drive

- Import raycast settings from Box Drive `config/raycast/`

- Import alt-tab settings from Box Drive `config/alt-tab/`

- LinearMouse 
    - enable reverse scrolling for external mouse
    - set scroll by pixel (around halfway)
    - There is a config file for reference in Box Drive `config/linearmouse/linearmouse.json` but note that it is device and vendor specific.


☑︎ [TinkerTool](http://www.bresink.com/osx/0TinkerTool/download.php) (for disabling dock animation and delay)

☑︎ [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

