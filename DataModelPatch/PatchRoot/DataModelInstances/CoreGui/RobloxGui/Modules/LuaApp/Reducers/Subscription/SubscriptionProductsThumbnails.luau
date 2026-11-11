local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetSubscriptionProductsThumbnailsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.Subscription.SetSubscriptionProductsThumbnails)

return function(p1, p2)
	-- upvalues: SetSubscriptionProductsThumbnailsModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetSubscriptionProductsThumbnailsModule.name then
		P0 = CryoModule.Dictionary.join(P0, p2.subscriptionProductsThumbnails)
	end
	return P0
end