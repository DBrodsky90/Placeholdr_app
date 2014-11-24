class BitlyWrapper

	def self.short(url)
		bitly = Bitly.new(ENV["BITLY_USERNAME"], ENV["BITLY_API_KEY"])
		bitly_result = bitly.shorten(url)
		shortened_url = bitly_result.short_url
	end

end