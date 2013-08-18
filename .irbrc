require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history" 
IRB.conf[:PROMPT_MODE]  = :SIMPLE

begin
  require 'wirble'

  # init wirble
  Wirble.init

rescue LoadError => err
  $stderr.puts "Couldn't load Wirble: #{err}"
end

# enable color
Wirble.colorize

