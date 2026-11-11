local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetGameSubscriptionProductsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.Subscription.SetGameSubscriptionProducts)

return function(p1, p2)
	-- upvalues: SetGameSubscriptionProductsModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetGameSubscriptionProductsModule.name then
		P0 = CryoModule.Dictionary.join(P0, { [p2.universeId] = p2.subscriptionProducts })
	end
	return P0
end