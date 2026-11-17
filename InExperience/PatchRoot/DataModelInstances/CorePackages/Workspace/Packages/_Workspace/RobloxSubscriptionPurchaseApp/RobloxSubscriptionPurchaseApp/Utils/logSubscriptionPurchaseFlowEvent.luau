local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local BuildSubscriptionPurchaseFlowPayloadModule = require(RobloxSubscriptionPurchaseApp.Utils.buildSubscriptionPurchaseFlowPayload)
local SendSubscriptionPurchaseFlowEventModule = require(RobloxSubscriptionPurchaseApp.Utils.sendSubscriptionPurchaseFlowEvent)

return function(p1, List)
	-- upvalues: BuildSubscriptionPurchaseFlowPayloadModule (copy), SendSubscriptionPurchaseFlowEventModule (copy)
	local SubscriptionPurchaseFlowPayloadModule = BuildSubscriptionPurchaseFlowPayloadModule(p1)
	
	if List then
		for i, value in pairs(List) do
			SubscriptionPurchaseFlowPayloadModule[i] = value
		end
	end
	SendSubscriptionPurchaseFlowEventModule(SubscriptionPurchaseFlowPayloadModule)
end