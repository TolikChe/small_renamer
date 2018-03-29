
require 'FileUtils'

$path = 'Z:/Наше домашнее видео'

list_of_dir = Dir.entries($path)

list_of_dir.each { |i|
	if /^2012-.*$/ =~ i then
		puts (  "Open " + $path+"/"+i)	
		Dir.chdir($path+"/"+i)
		
		Dir.foreach($path+"/"+i) do |file|
			next if file == '.' or file == '..'
			if /^\d{2}-\d{2}-2012_\d{6}.*$/ =~ file then
				puts "Rename #{file} to 2012-#{file[0..4]}#{file[10..-1]}"
				File.rename $path+"/"+i+"/"+file, $path+"/"+i+"/"+"2012-"+file[0..4]+file[10..-1]
			end	
		end
		exit
		
		#File.rename "Z:/Наше домашнее видео/#{i}", "Z:/Наше домашнее видео/2013-#{i[0..-6]}"
	end
}