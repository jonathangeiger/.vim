desc "Installs all of the bundles"
task :bundle do
  # Update submodules
  system "git submodule update --init"
  # Make command-t
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

desc "Upgrades to the latest revision"
task :upgrade do
  system 'git pull'
  system 'git submodule foreach git pull'
end

task :default => [:bundle]
task :install => [:bundle, :copy, :symlink]
