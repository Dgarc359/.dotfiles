cd src/node-twitch-chat-bin
yarn && yarn build
cd ../..
cp src/node-twitch-chat-bin/out/index.js .local/bin/twitchchat
