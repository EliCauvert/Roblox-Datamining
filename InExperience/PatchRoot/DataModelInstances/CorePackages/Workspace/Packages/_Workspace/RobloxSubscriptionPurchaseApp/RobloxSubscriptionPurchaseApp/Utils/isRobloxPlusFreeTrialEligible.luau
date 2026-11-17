local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local _ = require(RobloxSubscriptionPurchaseApp.Network.getRobloxSubscriptionProducts)
local IsRobloxSubscriptionProductFreeTrialModule = require(RobloxSubscriptionPurchaseApp.Utils.isRobloxSubscriptionProductFreeTrial)

return function(Entry)
	-- upvalues: IsRobloxSubscriptionProductFreeTrialModule (copy)
	return type(Entry) == "table" and Entry[1] ~= nil and IsRobloxSubscriptionProductFreeTrialModule(Entry[1])
end