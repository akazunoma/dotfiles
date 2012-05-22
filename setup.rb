# -*- coding: utf-8 -*-

OSTYPE   = `echo $OSTYPE`.strip
OSX      = !!(OSTYPE =~ /^darwin/)
HOME     = ENV['HOME']
DOTFILES = File.dirname(File.expand_path(__FILE__))

dotfiles = %w{.zshrc .emacs.d .gitconfig .gitignore .screenrc .gemrc .pryrc}

def exec(command)
  $stdout.puts command
  system command
end

def symlink_if_not_exists(source, dest)
  if File.exists?(dest)
    $stdout.puts "#{dest}: file exists."
  else
    exec("ln -s #{source} #{dest}")
  end
end

## dotfiles
dotfiles.each do |name|
  source = File.join(DOTFILES, name)
  dest   = File.join(HOME, name)
  symlink_if_not_exists(source, dest)
end

## .screenrc.local
source = File.join(DOTFILES, '.screenrc.' + (OSX ? 'osx' : 'linux'))
dest   = File.join(HOME, '.screenrc.local')
symlink_if_not_exists(source, dest)

## .zshrc.local
dest = File.join(HOME, '.zshrc.local')
exec("touch #{dest}")

## .rsense
exec("ruby #{DOTFILES}/.emacs.d/elisp/rsense/etc/config.rb > ~/.rsense")
