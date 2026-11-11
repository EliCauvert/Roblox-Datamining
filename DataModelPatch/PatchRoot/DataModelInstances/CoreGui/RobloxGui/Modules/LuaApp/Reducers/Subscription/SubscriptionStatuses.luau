local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetSubscriptionStatusesModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.Subscription.SetSubscriptionStatuses)

return function(p1, p2)
	-- upvalues: SetSubscriptionStatusesModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetSubscriptionStatusesModule.name then
		P0 = CryoModule.Dictionary.join(P0, p2.subscriptionStatuses)
	end
	return P0
end