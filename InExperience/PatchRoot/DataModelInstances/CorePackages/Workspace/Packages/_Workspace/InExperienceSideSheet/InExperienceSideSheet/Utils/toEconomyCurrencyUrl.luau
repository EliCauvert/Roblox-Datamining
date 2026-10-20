return function(Text: string): string
	return string.gsub(string.gsub(string.gsub(Text:lower(), "/m.", "/www."), "http:", "https:"), "https://www.", "https://economy.") .. "v1/user/currency"
end