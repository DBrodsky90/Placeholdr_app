class BingWrapper

	def self.search(search_input)
		bing_image = Bing.new('rNA3YpeZw7o2h8nOeRrZj9guzLdX1XTaXX7JYL9oypk', 25, 'Image')
		search_string = search_input.split.join("+")  
		result = bing_image.search("#{search_string}")
		parsed_result = result[0][:Image]
	end

end