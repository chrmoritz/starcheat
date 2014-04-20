cd /usr
sudo tar czf local.tar.gz local
sudo curl -H "Authorization: token 62f3855fb24437c11ff7ee40a8bffe8d8258fc7e" -H "Accept: application/json" -H "Content-Type: application/gzip" --data-binary @/usr/local.tar.gz https://uploads.github.com/repos/chrmoritz/starcheat/releases/165510/assets?name=local.tar.gz