local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local Default = require(Parent.LoggingProtocol).default
local BulkPurchaseMissingPurchaseOptionsCounter = require(Parent.AvatarExperienceAnalytics).Events.BulkPurchaseMissingPurchaseOptionsCounter

local function reportMissingPurchaseOptions(List)
	-- upvalues: Default (copy), BulkPurchaseMissingPurchaseOptionsCounter (copy)
	for _, value in List do
		local PurchaseOptions = value.purchaseOptions
		
		if PurchaseOptions == nil or #PurchaseOptions == 0 then
			Default:logRobloxTelemetryCounter(BulkPurchaseMissingPurchaseOptionsCounter, 1, {})
			break
		end
	end
end

return function(p1)
	-- upvalues: reportMissingPurchaseOptions (copy)
	if p1 ~= nil then
		reportMissingPurchaseOptions(p1)
		
		return
	end
end