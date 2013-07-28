#   Copyright 2013 Matt Ho
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

require File.expand_path(File.dirname(__FILE__) + '/tasks/deb')

task :default => :package

task :clean do
  exec "rm -rf #{DIST}"
  exec "rm -f *.deb"
  exec "rm -f *.gz"
end

namespace :vagrant do
  desc "vagrant up"
  task :up => "deb:package" do
    system "vagrant up"
  end

  desc "vagrant destroy"
  task :destroy do
    system "vagrant destroy"
  end

  desc "create debian package with vagrant" 
  task :package => [:up, :destroy]
end

namespace :deb do 
  desc "package"
  task :package => :prepare do 
    create_package
  end

  desc "prepare"
  task :prepare do 
    prepare_package
  end
end
