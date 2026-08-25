local httpService = game:GetService("HttpService")

return {
	enc = function(p0)
		-- upvalues: httpService (ref)
		return httpService:JSONEncode(p0)
	end,
	dec = function(p1)
		-- upvalues: httpService (ref)
		return httpService:JSONDecode(p1)
	end
}