local httpService = game:GetService("HttpService")
local var1 = ""

return {
	Get = function(_)
		-- upvalues: var1 (write), httpService (ref)
		if var1 == "" then
			var1 = httpService:GenerateGUID(false)
		end
		return var1
	end,
	Refresh = function(_)
		-- upvalues: var1 (write), httpService (ref)
		var1 = httpService:GenerateGUID(false)
		
		return var1
	end
}