local httpService = game:GetService("HttpService")
local var1 = httpService:GenerateGUID(false)

return {
	getCartId = function()
		-- upvalues: var1 (write)
		return var1
	end,
	refreshCartId = function()
		-- upvalues: var1 (write), httpService (ref)
		var1 = httpService:GenerateGUID(false)
	end
}