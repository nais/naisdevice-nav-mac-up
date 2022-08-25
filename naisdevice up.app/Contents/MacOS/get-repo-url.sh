#!/bin/bash
# shellcheck disable=SC2154

get-repo-url(){
source pashua.sh

conf="
# Set window title
*.title = Clone dotfiles or config repo

brewtxt.type = text
brewtxt.default = Clone your git repo to "$HOME"/repo[return]Enter a valid git url and the repo will be cloned for you.[return][return]Example: https://github.com/toby1knby/dotfiles
brewtxt.height = 276
brewtxt.width = 310

repo_url.type = textfield
repo_url.label = Enter your repo url
repo_url.default = 
repo_url.width = 310

cb.type = cancelbutton
cb.label = Cancel

db.type = defaultbutton
db.label = Clone it!
"
conf="$conf
          img.type = image
          img.x = 105
          img.y = 200
          img.maxwidth = 100
          img.tooltip = Cheers!
          img.path = ../Resources/git.png"
pashua_run "$conf" ../Pashua

export clone_target="$repo_url"

echo "Will clone: $clone_target"
echo clone_target="$clone_target" >> vars
}

get-repo-url