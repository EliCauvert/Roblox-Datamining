local HttpService = game:GetService("HttpService")
local Guid = HttpService:GenerateGUID(false)

return {
	getCartId = function() --[[ Line: 5 ]]
		-- upvalues: Guid (ref)
		return Guid
	end,
	refreshCartId = function() --[[ Line: 9 ]]
		-- upvalues: Guid (ref), HttpService (copy)
		Guid = HttpService:GenerateGUID(false)
	end
}