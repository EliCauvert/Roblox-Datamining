local HttpService = game:GetService("HttpService")

return function(): number --[[ Line: 3 ]]
	-- upvalues: HttpService (copy)
	return string.find(HttpService:GetUserAgent(), "AmazonAppStore")
end