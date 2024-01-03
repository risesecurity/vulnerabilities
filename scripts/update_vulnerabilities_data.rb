#!/usr/bin/env ruby
# By Ramon de C Valle. This work is dedicated to the public domain.

require "nokogiri"
require "optparse"
require "time"
require "xmlsimple"
require "yaml"

Version = [0, 0, 1]
Release = nil

titles = []
options = {}
OptionParser.new do |parser|
  parser.banner = "Usage: #{parser.program_name} [options] vulnerabilities.yml allitems-cvrf.xml"

  parser.separator("")
  parser.separator("Options:")

  parser.on("-h", "--help", "Show this message") do
    puts parser
    exit
  end

  parser.on("-i", "--in-place", "In-place mode") do
    options[:in_place] = true
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

vulnerabilities = YAML.load_file(ARGV[0], permitted_classes: [Time])
reader = Nokogiri::XML::Reader(File.new(ARGV[1]))
reader.each do |node|
  next unless node.name == "Vulnerability" && node.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT
  ref = XmlSimple.xml_in(node.outer_xml)
  vulnerability = vulnerabilities.find { |vulnerability| vulnerability["name"] == ref["Title"][0] }
  next if vulnerability.nil?
  vulnerability["description"] = nil
  vulnerability["name"] = ref["Title"][0]
  vulnerability["published"] = nil
  vulnerability["updated"] = nil
  ref["Notes"][0]["Note"].each do |note|
    case note["Type"]
    when "Description"
      vulnerability["description"] = note["content"].tr("\n", " ").gsub(/\s+/, " ").strip
    when "Other"
      case note["Title"]
      when "Published"
        vulnerability["published"] = Time.parse("#{note["content"]} 00:00:00.000000000 Z")
      when "Modified"
        vulnerability["updated"] = Time.parse("#{note["content"]} 00:00:00.000000000 Z")
      end
    end
  end
end

file = File.new(ARGV[0], "w+b") if options[:in_place]
if file
  file.write(vulnerabilities.to_yaml)
  file.close
else
  puts vulnerabilities.to_yaml
end
