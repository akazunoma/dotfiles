# -*- coding: utf-8 -*-

# get environment
UNAME    = `uname`.strip.downcase
HOME     = ENV['HOME']
DOTFILES = File.dirname(File.expand_path(__FILE__))

# dotfiles name
dotfiles = ['.emacs.d',
            '.irbrc',
            '.screenrc',
            '.gitconfig',
            '.gitignore']

# make dotfiles symlink
dotfiles.each do |filename|
  old = "#{DOTFILES}/#{filename}"
  new = "#{HOME}/#{filename}"
  if File.exists?(new)
    puts "ln: #{new}: file exists"
  else
    puts "ln -s #{old} #{new}"
    File.symlink(old, new)
  end
end

# make .profile
profile = "#{HOME}/.profile"
if File.exists?(profile)
  puts "#{profile} exists"
else
  puts "make #{profile}"
  File.open(profile, 'w') do |file|
    file.puts "source $HOME/.bashrc"
  end
end

# make .bashrc for depending environment
bashrc     = "#{HOME}/.bashrc"
bash_local = ".bashrc.#{UNAME}"
if File.exists?(bashrc)
  puts "#{bashrc} exists"
else
  puts "make #{bashrc}"
  File.open(bashrc, 'w') do |file|
    file.puts "DOTFILES=\"#{DOTFILES}\""
    file.puts 'source $DOTFILES/.bashrc'
    if File.exists?("#{DOTFILES}/#{bash_local}")
      file.puts "source $DOTFILES/#{bash_local}"
    end
  end
end

# make .screenrc.local for depending environment
screen_local = "#{HOME}/.screenrc.local"
screen_path  = "#{DOTFILES}/.screenrc.#{UNAME}"
if File.exists?(screen_local)
  puts "ln: #{screen_local}: file exists"
else
  if File.exists?(screen_path)
    puts "ln -s #{screen_path} #{screen_local}"
    File.symlink(screen_path, screen_local)
  end
end
