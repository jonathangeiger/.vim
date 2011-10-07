task :init do
  info 'Initializing bundles'
  system "git submodule update --init"
end

desc "Fetches and builds all of the vim bundles"
task :make => ['make:command-t']

namespace :make do
  task 'command-t' => [:init] do
    info 'Building Command-T'
    system 'cd bundle/command-t && rake make'
  end
end

desc "Builds itself, then installs the current code into your .vim directory"
task :install => [:init, :make] do

  dest = File.expand_path("~/.vim")
  cwd  = File.dirname(__FILE__)

  if File.exists?(dest)
    backup_dir = dest + '-backups/'

    unless File.exists?(backup_dir)
      Dir.mkdir(backup_dir)
    end

    time = Time.now.strftime('%Y-%m-%d-%H-%M-%S')
    info 'Moving existing ~/.vim install to ~/.vim-backups/' + time
    File.rename(dest, backup_dir + time)
  end

  info 'Installing to ~/.vim'

  FileUtils.cp_r(File.dirname(__FILE__), dest)

  info 'Symlinking vim configurations'
  %w[ vimrc gvimrc ].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      ln_s(File.expand_path("../#{file}", __FILE__), dest)
    end
  end
end

desc "Upgrades all of the code and installs the new version"
task :upgrade => [:update, :make, :install]

task :update => [:init] do
  info 'Upgrading main repository'
  system 'git pull'

  info 'Upgrading bundles'
  system 'git submodule foreach git pull origin master'
end

def info(message)
  puts "\e[1m* #{message}\e[0m"
end
