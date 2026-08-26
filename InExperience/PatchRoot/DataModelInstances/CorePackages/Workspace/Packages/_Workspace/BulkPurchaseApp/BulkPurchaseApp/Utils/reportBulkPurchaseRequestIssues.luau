local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local default = require(parent.LoggingProtocol).default
local bulkPurchaseMissingPurchaseOptionsCounter = require(parent.AvatarExperienceAnalytics).Events.BulkPurchaseMissingPurchaseOptionsCounter

local function reportMissingPurchaseOptions(p1)
	-- upvalues: default (ref), bulkPurchaseMissingPurchaseOptionsCounter (ref)
	for i, v in p1 do
		local purchaseOptions = v.purchaseOptions
		
		if purchaseOptions == nil or #purchaseOptions == 0 then
			default:logRobloxTelemetryCounter(bulkPurchaseMissingPurchaseOptionsCounter, 1, {})
			
			return
		end
	end
end

return function(p2)
	-- upvalues: reportMissingPurchaseOptions (ref)
	if p2 == nil then
		return
	end
	reportMissingPurchaseOptions(p2)
end