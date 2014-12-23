cd /usr
sudo tar czf local.tar.gz local
sudo curl -H "Authorization: token 58a25c232ebae772f9a98607e8491ec6db42eeae" -H "Accept: application/json" -H "Content-Type: application/gzip" --data-binary @/usr/local.tar.gz https://uploads.github.com/repos/chrmoritz/starcheat/releases/165510/assets?name=local_NEW42.tar.gz