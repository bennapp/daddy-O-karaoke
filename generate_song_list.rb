lib = {}

Dir.foreach('D:\downloaded\karaoke-collection-backups') do |item|
  next if item == '.' or item == '..'
  next if item[-4..-1] == '.cdg'
  artist, title_with_lib_and_file_name = item.split(' -')
  
  title_with_lib = title_with_lib_and_file_name.split('.mp3').first
  title = title_with_lib.gsub(/ \[[a-zA-Z]+ Karaoke\]/, '')
  title = title[1..-1]

  lib[artist] ||= []

  lib[artist] << title unless lib[artist].any? { |t| t.casecmp(title) == 0 }
end

require 'yaml'

File.open("lib.yml","w") do |file|
   file.write lib.to_yaml
end 
