#!/usr/bin/env ruby
require 'json'
require 'rubygems'
require 'awesome_print'
require 'exif'
puts 'file,width,length'
ARGF.each_line do |line|
	line = line.chomp	
	data = Exif::Data.new(File.open(line)) # load from file
	width = data.pixel_x_dimension
	height = data.pixel_y_dimension
	printf("%s,%d,%d\n", line, width, height)
end