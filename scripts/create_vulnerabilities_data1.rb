#!/usr/bin/env ruby
# By Ramon de C Valle. This work is dedicated to the public domain.

require "nokogiri"
require "optparse"
require "time"
require "xmlsimple"
require "yaml"

Version = [0, 0, 1]
Release = nil

names = []
options = {}
OptionParser.new do |parser|
  parser.banner = "Usage: #{parser.program_name} [options] allitems.xml"

  parser.separator("")
  parser.separator("Options:")

  parser.on("-h", "--help", "Show this message") do
    puts parser
    exit
  end

  parser.on("--list x,y,z", Array, "Specify the list of CVE identifiers") do |list|
    names += list
  end

  parser.on("--list-file FILE", "Specify the list of CVE identifiers") do |file|
    names += File.readlines(file)
    names.map!(&:strip)
  end

  parser.on("-o", "--output FILE", "Output file") do |file|
    options[:file] = File.new(file, "w+b")
  end

  parser.on("-v", "--verbose", "Verbose mode") do |v|
    options[:verbose] = v
  end

  parser.on("--version", "Show version") do
    puts parser.ver
    exit
  end
end.parse!

file = options[:file] || nil

vulnerabilities = []
reader = Nokogiri::XML::Reader(File.new(ARGV[0]))
reader.each do |node|
  next unless node.name == "item" && node.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT
  next unless names.empty? || names.include?(node.attribute("name"))
  item = XmlSimple.xml_in(node.outer_xml)
  vulnerability = {}
  vulnerability["description"] = item["desc"][0].tr("\n", " ").gsub(/\s+/, " ").strip
  vulnerability["name"] = item["name"]
  vulnerability["published"] = nil
  vulnerability["updated"] = nil
  if item["phase"]
    vulnerability["published"] = Time.parse("#{item["phase"][0]["date"]} 00:00:00.000000000 Z")
    vulnerability["updated"] = Time.parse("#{item["phase"][0]["date"]} 00:00:00.000000000 Z")
  end
  vulnerabilities << vulnerability
end

vulnerabilities.reverse!
if file
  file.write(vulnerabilities.to_yaml)
  file.close
else
  puts vulnerabilities.to_yaml
end
