return function(p1)
	return string.gsub(string.gsub(string.gsub(p1:lower(), "/m.", "/www."), "http:", "https:"), "https://www.", "https://economy.") .. "v1/user/currency"
end