local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local buildSubscriptionPurchaseFlowPayloadModule = require(robloxSubscriptionPurchaseApp.Utils.buildSubscriptionPurchaseFlowPayload)
local sendSubscriptionPurchaseFlowEventModule = require(robloxSubscriptionPurchaseApp.Utils.sendSubscriptionPurchaseFlowEvent)

return function(p1, p2)
	-- upvalues: buildSubscriptionPurchaseFlowPayloadModule (ref), sendSubscriptionPurchaseFlowEventModule (ref)
	local var1 = buildSubscriptionPurchaseFlowPayloadModule(p1)
	
	if p2 then
		for i, v in pairs(p2) do
			var1[i] = v
		end
	end
	sendSubscriptionPurchaseFlowEventModule(var1)
end