#!/usr/bin/env ruby

require 'fileutils'

def system cmd, *args
  print "==> ", cmd, " ", *args.join(' '), "\n"
  raise "error" unless Kernel.system cmd, *args
end

# Build starcheat
system 'python3', 'build.py', '-v'
# Run some tests
FileUtils.cd 'build'
system './starcheat.py', '-v'
# ToDo: run some other unit test here
unless ENV['TRAVIS_BUILD_ID'].nil? || "#{ENV['TRAVIS_BRANCH']}" !~ /^v?(\d)+(\.\d+)*$/
  # Build OS X .app
  FileUtils.mv '../mac/setup.py', '.'
  system 'python3', 'setup.py', 'py2app'
  system '/usr/local/opt/qt5/bin/macdeployqt', 'dist/starcheat.app', '-verbose=2'
  # Test OS X .app + tar
  FileUtils.mv 'dist/starcheat.app', 'StarCheat.app'
  #system 'StarCheat.app/Contents/MacOS/starcheat', '-v'
  system 'tar', 'czf', "starcheat-#{ENV['TRAVIS_BRANCH']}-osx.tar.gz", 'StarCheat.app'
end
