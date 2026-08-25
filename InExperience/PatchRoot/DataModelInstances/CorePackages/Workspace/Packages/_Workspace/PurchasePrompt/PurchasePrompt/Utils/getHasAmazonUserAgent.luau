local httpService = game:GetService("HttpService")

return function()
	-- upvalues: httpService (ref)
	return string.find(httpService:GetUserAgent(), "AmazonAppStore")
end