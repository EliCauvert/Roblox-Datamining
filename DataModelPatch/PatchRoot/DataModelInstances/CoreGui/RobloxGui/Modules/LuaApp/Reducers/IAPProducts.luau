local SetIAPProductsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetIAPProducts)

return function(p1, p2)
	-- upvalues: SetIAPProductsModule (copy)
	local P0 = p1 or { Robux = {}, PremiumRobux = {}, Subscriptions = {} }
	assert(P0, "")
	
	return if p2.type == SetIAPProductsModule.name then {
		Robux = p2.robux,
		PremiumRobux = p2.premiumRobux,
		Subscriptions = p2.subscriptions
	} else P0
end