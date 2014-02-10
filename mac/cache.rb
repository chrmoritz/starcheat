require 'formula'

class Cache < Formula
  homepage 'https://github.com/wizzomafizzo/starcheat'
  url 'https://github.com/wizzomafizzo/starcheat.git'
  version "cache"

  depends_on :python3
  depends_on 'pyqt5'

  def install
    ENV["PYTHONPATH"] = lib/"python#{/\d\.\d/.match `python3 --version 2>&1`}/site-packages"
    system 'pip3', 'install', '--upgrade', 'setuptools'
    system 'pip3', 'install', 'Pillow'
    system 'pip3', 'install', 'py2app'
    # give write access to Qt's frameworks (fixes py2app permission errors)
    system 'chmod', '-R', 'u+w', Formula.factory('qt5').lib
  end
  
  test do
    cd '/usr' do
      system 'tar', 'czf', 'local.tar.gz', 'local'
      json = `curl -H "Authorization: token #{ENV['HOMEBREW_GITHUB_API_TOKEN']}" -H "Accept: application/json" -H "Content-Type: application/gzip" --data-binary @/usr/local.tar.gz https://uploads.github.com/repos/chrmoritz/starcheat/releases/165510/assets?name=local.tar.gz`
      system "echo #{json}"
    end
  end
end
