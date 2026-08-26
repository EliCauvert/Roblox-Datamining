local httpService = game:GetService("HttpService")

return function(p1)
	-- upvalues: httpService (ref)
	return httpService:UrlEncode(p1):gsub("%%2D", "-"):gsub("%%5F", "_"):gsub("%%2E", "."):gsub("%%21", "!"):gsub("%%7E", "~"):gsub("%%2A", "*"):gsub("%%27", "'"):gsub("%%28", "("):gsub("%%29", ")")
end