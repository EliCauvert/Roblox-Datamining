local HttpService = game:GetService("HttpService")

return function(Input): string
	-- upvalues: HttpService (copy)
	return `ovrweb://webtask?uri={HttpService:UrlEncode(Input)}`
end