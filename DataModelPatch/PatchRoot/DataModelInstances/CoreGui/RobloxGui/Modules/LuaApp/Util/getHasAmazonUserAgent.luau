local HttpService = game:GetService("HttpService")

return function(): boolean
	-- upvalues: HttpService (copy)
	return string.find(HttpService:GetUserAgent(), "AmazonAppStore") ~= nil
end