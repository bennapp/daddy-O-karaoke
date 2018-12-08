lib = {}

Dir.foreach('D:\downloaded\karaoke-collection') do |item|
  next if item.nil?
  next if item == '.' or item == '..'
  next if item[-4..-1] == '.cdg'
  artist, title_with_lib_and_file_name = item.split(' -')
 
  next if title_with_lib_and_file_name.nil?

  title_with_lib = title_with_lib_and_file_name.split('.mp3').first
  title = title_with_lib.gsub(/ \[[a-zA-Z]+ Karaoke\]/, '')
  title = title[1..-1]

  lib[artist] ||= { 'name' => artist, 'songs' => [] }
  song = { 'title' => title }

  lib[artist]['songs'] << song unless lib[artist]['songs'].any? { |s| s['title'].casecmp(title) == 0 }
end

require 'yaml'

File.open("_data/lib.yml","w") do |file|
  file.write lib.values.to_yaml
end 
