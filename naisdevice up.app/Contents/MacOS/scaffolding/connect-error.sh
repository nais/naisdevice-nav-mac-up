#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC1091

connect_error(){
source pashua.sh

conf="
# Set window title
*.title = Error

errortxt.type = text
errortxt.default = You are not connected to the internet.[return][return]Check settings and try again.
errortxt.height = 276
errortxt.width = 310
errortxt.x = 0
errortxt.y = 30
cb.type = cancelbutton
cb.label = Cancel

db.type = defaultbutton
db.label = Try again!
"
conf="$conf
          img.type = image
          img.x = 0
          img.y = 100
          img.maxwidth = 350
          img.tooltip = Cheers!
          img.path = ../Resources/web-is-down.png"
pashua_run "$conf" ../Pashua
}

connect_error

if [[ "$cb" = "1" ]];then
exit 0
else
source naisdevice\ up
fi

