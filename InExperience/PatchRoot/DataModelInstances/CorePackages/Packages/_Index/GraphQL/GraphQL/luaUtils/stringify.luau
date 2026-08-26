local httpService = game:GetService("HttpService")
local null = httpService:JSONEncode(require(script.Parent.null))

return function(p1)
	-- upvalues: httpService (ref), null (ref)
	return httpService:JSONEncode(p1):gsub(null, "null")
end