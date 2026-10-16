local HttpService = game:GetService("HttpService")

return {
	enc = function(Input) --[[ Line: 5 ]]
		-- upvalues: HttpService (copy)
		return HttpService:JSONEncode(Input)
	end,
	dec = function(Input) --[[ Line: 9 ]]
		-- upvalues: HttpService (copy)
		return HttpService:JSONDecode(Input)
	end
}