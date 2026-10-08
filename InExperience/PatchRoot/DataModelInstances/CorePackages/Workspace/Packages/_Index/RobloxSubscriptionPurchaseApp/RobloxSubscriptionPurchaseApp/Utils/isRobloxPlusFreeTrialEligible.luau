local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local _ = require(robloxSubscriptionPurchaseApp.Network.getRobloxSubscriptionProducts)
local isRobloxSubscriptionProductFreeTrialModule = require(robloxSubscriptionPurchaseApp.Utils.isRobloxSubscriptionProductFreeTrial)

return function(p1)
	-- upvalues: isRobloxSubscriptionProductFreeTrialModule (ref)
	return type(p1) == "table" and p1[1] ~= nil and isRobloxSubscriptionProductFreeTrialModule(p1[1])
end