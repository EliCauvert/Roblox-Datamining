local httpService = game:GetService("HttpService")
local null = httpService:JSONEncode(require(script.Parent.null))

return function(p0)
	-- upvalues: httpService (ref), null (ref)
	return httpService:JSONEncode(p0):gsub(null, "null")
end