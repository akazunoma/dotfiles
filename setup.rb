# -*- coding: utf-8 -*-

OSTYPE   = `echo $OSTYPE`.strip
OSX      = !!(OSTYPE =~ /^darwin/)
HOME     = ENV['HOME']
DOTFILES = File.dirname(File.expand_path(__FILE__))

dotfiles = %w{.zshrc .zsh .emacs.d .gitconfig .gitignore .screenrc .gemrc .pryrc .percol.d}

def execute(command)
  $stdout.puts command
  system command
end

def symlink_if_not_exists(source, dest)
  if File.exists?(dest)
    $stdout.puts "#{dest}: file exists."
  else
    execute "ln -s #{source} #{dest}"
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
execute "touch #{File.join(HOME, '.zshrc.local')}"

## .rsense
execute "ruby #{DOTFILES}/.emacs.d/elisp/rsense/etc/config.rb > ~/.rsense"
