desc "Cleans the repo of any extraneous files"
task :clean do 
  system "git clean -dfx"
end


desc "Installs all of the bundles"
task :bundle do
  system "git submodule update --init"
  system "cd bundle/command-t && rake make"
end


desc "Symlinks your .vimrc and .gvimrc to the local versions"
task :symlink do
  %w[ vimrc gvimrc ].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      ln_s(File.expand_path("../#{file}", __FILE__), dest)
    end
  end
end


desc "Copies the repo to your .vim folder. Backs up any existing .vim first"
task :copy do
  dest = File.expand_path("~/.vim")
  cwd  = File.dirname(__FILE__)

  # Backup the existing vim install
  unless dest == cwd
    if File.exists?(dest)
      File.rename(dest, dest + Time.now.strftime('%Y-%m-%d-%H-%M-%S'))
    end

    File.rename(File.dirname(__FILE__), dest)
  end
end

task :default => [:bundle]
task :install => [:clean, :bundle, :copy, :symlink]
