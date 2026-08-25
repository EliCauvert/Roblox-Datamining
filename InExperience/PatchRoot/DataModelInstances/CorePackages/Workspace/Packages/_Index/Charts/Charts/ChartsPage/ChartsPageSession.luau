local httpService = game:GetService("HttpService")
local var1, var2 = require(script.Parent.Parent.Parent.Signals).createSignal("")

return {
	Get = function(_)
		-- upvalues: var1 (ref), httpService (ref), var2 (ref)
		local var3 = var1(false)
		
		if var3 == "" then
			var3 = httpService:GenerateGUID(false)
			var2(var3)
		end
		return var3
	end,
	Refresh = function(_)
		-- upvalues: httpService (ref), var2 (ref)
		local var4 = httpService:GenerateGUID(false)
		var2(var4)
		
		return var4
	end,
	GetSignal = function(_)
		-- upvalues: var1 (ref)
		return var1
	end
}