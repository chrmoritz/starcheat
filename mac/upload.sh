cd /usr
sudo tar czf local.tar.gz local
sudo curl -H "Authorization: token $HOMEBREW_GITHUB_API_TOKEN" -H "Accept: application/json" -H "Content-Type: application/gzip" --data-binary @/usr/local.tar.gz https://uploads.github.com/repos/chrmoritz/starcheat/releases/165510/assets?name=local.tar.gz