#!/usr/bin/env ruby
require 'json'
require 'rubygems'
require 'awesome_print'
require 'colorname'
require 'color'
require 'logger'
logger = Logger.new(STDERR)
logger.level = Logger::DEBUG

puts 'file,colourname,hexcolour'
ARGF.each_line do |line|
	file = line.chomp	
	dominant_colour = Colorname.find_by_image(file)[0].to_s
	logger.debug("file:" + file)
	logger.debug("dominant_colour:" + dominant_colour)
	if dominant_colour == "undefined"
		logger.debug "SKIPPING because dominant colour is nil"
		next
	end
	comma_index = dominant_colour.index(',')
	dominant_colour = dominant_colour[0, comma_index] if !comma_index.nil?
    #logger.debug("dominant_colour after removing comma:" + dominant_colour)
	# replace "[:white]" with "white"
	dominant_colour = dominant_colour.tr(":[]", '')
	hex_colour = Color::CSS[dominant_colour].html
	printf("%s,%s,%s\n", file, dominant_colour, hex_colour)
end