#!/usr/bin/env ruby
require 'json'
require 'rubygems'
require 'awesome_print'
require 'exif'
puts 'file,width,length,max75x,max75y'
ARGF.each_line do |line|
	line = line.chomp	
	data = Exif::Data.new(File.open(line)) # load from file
	width = data.pixel_x_dimension
	height = data.pixel_y_dimension
	max75x = width.div(75) - 1
	max75y = height.div(75) - 1
	printf("%s,%d,%d,%d,%d\n", line, width, height, max75x, max75y)
end