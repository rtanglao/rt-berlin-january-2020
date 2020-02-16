#!/usr/bin/env ruby
require 'json'
require 'rubygems'
require 'awesome_print'
require 'colorname'
require 'color'
require 'logger'

puts 'file,colourname,hexcolour'
ARGF.each_line do |line|
	file = line.chomp	
	dominant_colour = Colorname.find_by_image(file)[0].to_s
	logger.debug("file:" + file)
	logger.debug("dominant_colour" + dominant_colour)
	hex_colour = Color::CSS[dominant_colour].html
	printf("%s,%s,%s\n", file, dominant_colour, hex_colour)
end