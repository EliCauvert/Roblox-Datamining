local HttpService = game:GetService("HttpService")

return function(): number
	-- upvalues: HttpService (copy)
	return string.find(HttpService:GetUserAgent(), "AmazonAppStore")
end