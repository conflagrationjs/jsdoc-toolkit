require 'rubygems'
require 'riot'
require 'pathname'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'jsdoc-toolkit'

at_exit do
  Riot.report
end