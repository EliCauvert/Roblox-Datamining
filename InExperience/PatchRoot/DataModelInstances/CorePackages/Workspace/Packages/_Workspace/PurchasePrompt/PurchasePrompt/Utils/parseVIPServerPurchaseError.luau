local PurchaseErrorModule = require(script:FindFirstAncestor("PurchasePrompt").Enums.PurchaseError)
local config = {
	[30] = PurchaseErrorModule.VIPServerTooManyFreeServersOnGame,
	[31] = PurchaseErrorModule.VIPServerTooManyTotalActiveFreeServers
}

return function(p1)
	-- upvalues: config (copy)
	local Errors = if type(p1) == "table" then p1.errors else nil
	local Code = Errors and (Errors[1] and Errors[1].code)
	
	return Code and config[Code] or p1
end