desc "Builds itself, then installs the current code into your .vim directory"
task :install do

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

  info 'Installing bundles'
  system('vim +BundleInstall +qall')

end

def info(message)
  puts "\e[1m* #{message}\e[0m"
end
