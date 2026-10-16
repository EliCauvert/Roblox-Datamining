local HttpService = game:GetService("HttpService")

return function(p1, Input) --[[ Line: 3 | Named "getAuthorizedVideoUri" ]]
	-- upvalues: HttpService (copy)
	return if Input == nil or Input == "" then p1 else `{p1}&accessContext={HttpService:UrlEncode(Input)}`
end