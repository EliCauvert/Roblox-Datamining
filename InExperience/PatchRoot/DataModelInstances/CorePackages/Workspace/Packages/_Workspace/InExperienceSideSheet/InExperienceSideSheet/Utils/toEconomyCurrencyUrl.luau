return function(Text: string): string --[[ Line: 3 | Named "toEconomyCurrencyUrl" ]]
	return string.gsub(string.gsub(string.gsub(Text:lower(), "/m.", "/www."), "http:", "https:"), "https://www.", "https://economy.") .. "v1/user/currency"
end