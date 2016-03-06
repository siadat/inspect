#!/usr/bin/env ruby
require 'json'
require 'csv'
require 'yaml'
require 'nokogiri'

def parse_data(format, data)
  if format.nil?
    if data.match /^\s*</
      x = parse('xml', data)
      x = parse('html', data) if x.root.name == 'html'
    else
      x = parse('json', data)
      x = parse('csv', data) if x.nil?
      x = parse('yml', data) if x.nil?
    end
  else
    x = parse(format, data)
  end
  x
end

def read_data(filename)
  File.read(filename)
end

def read_data_from_stdin
  if ARGF.filename != "-" or (not STDIN.tty? and not STDIN.closed?)
    ARGF.read
  else
    STDERR.puts 'ERROR: No datastream to inspect.'
    exit 1
  end
end

def parse(format, data)
  case format
  when 'json'
    JSON.parse(data)
  when 'csv'
    CSV.parse(data)
  when 'html'
    Nokogiri::HTML(data)
  when 'yml'
    YAML.load(data)
  when 'xml'
    Nokogiri::XML(data) {|config| config.strict.noblanks}
  end

rescue JSON::ParserError, CSV::MalformedCSVError, Psych::SyntaxError
end
