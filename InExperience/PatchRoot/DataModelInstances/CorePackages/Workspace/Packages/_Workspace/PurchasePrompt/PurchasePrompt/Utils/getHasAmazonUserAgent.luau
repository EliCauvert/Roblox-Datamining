local httpService = game:GetService("HttpService")

return function() --[[ line: 3 ]]
	-- upvalues: httpService (ref)
	return string.find(httpService:GetUserAgent(), "AmazonAppStore")
end