local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local buildSubscriptionPurchaseFlowPayloadModule = require(robloxSubscriptionPurchaseApp.Utils.buildSubscriptionPurchaseFlowPayload)
local sendSubscriptionPurchaseFlowEventModule = require(robloxSubscriptionPurchaseApp.Utils.sendSubscriptionPurchaseFlowEvent)

return function(p0, p1)
	-- upvalues: buildSubscriptionPurchaseFlowPayloadModule (ref), sendSubscriptionPurchaseFlowEventModule (ref)
	local var3 = buildSubscriptionPurchaseFlowPayloadModule(p0)
	
	if p1 then
		for i, v in pairs(p1) do
			var3[i] = v
		end
	end
	sendSubscriptionPurchaseFlowEventModule(var3)
end