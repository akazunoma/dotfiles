# -*- coding: utf-8 -*-

require 'rubygems'
require 'irb/completion'
require 'open-uri'
require 'yaml'
require 'pp'

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:SAVE_HISTORY] = 100

IRB.conf[:PROMPT][:MITUKIII] = {
  :PROMPT_I => ">> ",
  :PROMPT_C => "*> ",
  :PROMPT_N => "%i> ",
  :PROMPT_S => "%l> ",
  :RETURN   => "==> %s\n"
}
IRB.conf[:PROMPT_MODE] = :MITUKIII
