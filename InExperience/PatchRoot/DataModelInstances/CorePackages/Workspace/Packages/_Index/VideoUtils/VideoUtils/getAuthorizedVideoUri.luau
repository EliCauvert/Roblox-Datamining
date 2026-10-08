local httpService = game:GetService("HttpService")

return function(p1, p2)
	-- upvalues: httpService (ref)
	return if p2 == nil or p2 == "" then p1 else `{p1}&accessContext={httpService:UrlEncode(p2)}`
end