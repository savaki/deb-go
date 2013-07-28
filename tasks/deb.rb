require File.expand_path(File.dirname(__FILE__) + '/env')

def prepare_package
  exec "wget --quiet https://go.googlecode.com/files/#{TARBALL}" unless File.exists?(TARBALL)
  exec "mkdir -p #{DIST}/contents/usr/local"
  exec "(cd #{DIST}/contents/usr/local ; tar -xzvf ../../../../#{TARBALL})"
end

def create_package
  exec <<EOF
  # use fpm to package the scripts
  fpm \
    --force \
    --description "TMTT - REST services for the tool api" \
    --deb-user 0 \
    --deb-group 0 \
    --after-install package/after-install.sh \
    --url http://github.com/savaki/deb-go \
    --name go \
    --version #{VERSION} \
    --vendor "http://github.com/savaki" \
    -s dir \
    -t deb \
    -C #{DIST}/contents \
    usr 
EOF
end

def exec command
  puts command
  IO.popen(command) do |io|
    io.each_line do |line|
      puts line
    end
  end
end
