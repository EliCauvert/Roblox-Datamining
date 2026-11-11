local HttpService = game:GetService("HttpService")

return {
	enc = function(Input)
		-- upvalues: HttpService (copy)
		return HttpService:JSONEncode(Input)
	end,
	dec = function(Input)
		-- upvalues: HttpService (copy)
		return HttpService:JSONDecode(Input)
	end
}