local httpService = game:GetService("HttpService")

return {
	enc = function(p0) --[[ line: 5 ]]
		-- upvalues: httpService (ref)
		return httpService:JSONEncode(p0)
	end,
	dec = function(p1) --[[ line: 9 ]]
		-- upvalues: httpService (ref)
		return httpService:JSONDecode(p1)
	end
}