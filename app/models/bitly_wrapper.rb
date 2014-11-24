class BitlyWrapper

	def self.short(url)
		bitly = Bitly.new("amandaleet", "R_8f39e91fd31279f3dd6dcb8facfaee7a")
		bitly_result = bitly.shorten(url)
		shortened_url = bitly_result.short_url
	end

end