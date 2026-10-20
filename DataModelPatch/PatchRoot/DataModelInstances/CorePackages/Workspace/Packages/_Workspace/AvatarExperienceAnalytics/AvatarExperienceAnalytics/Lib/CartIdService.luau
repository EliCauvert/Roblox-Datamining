local HttpService = game:GetService("HttpService")
local Guid = HttpService:GenerateGUID(false)

return {
	getCartId = function()
		-- upvalues: Guid (ref)
		return Guid
	end,
	refreshCartId = function()
		-- upvalues: Guid (ref), HttpService (copy)
		Guid = HttpService:GenerateGUID(false)
	end
}