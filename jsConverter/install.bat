cd jsConverter
start /b cmd npm init -y && npm install -S express get-port open && npm i express && npm i nexe -g && nexe -h && nexe path && nexe --build && nexe -r "views/**/*" && npm run build && npm --build && npm i pkg && npm i pkg -g