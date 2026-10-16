local HttpService = game:GetService("HttpService")

return function(Input) --[[ Line: 10 | Named "encodeURIComponent" ]]
	-- upvalues: HttpService (copy)
	return (HttpService:UrlEncode(Input):gsub("%%2D", "-"):gsub("%%5F", "_"):gsub("%%2E", "."):gsub("%%21", "!"):gsub("%%7E", "~"):gsub("%%2A", "*"):gsub("%%27", "'"):gsub("%%28", "("):gsub("%%29", ")"))
end