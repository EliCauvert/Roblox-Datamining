local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local default = require(parent.LoggingProtocol).default
local bulkPurchaseMissingPurchaseOptionsCounter = require(parent.AvatarExperienceAnalytics).Events.BulkPurchaseMissingPurchaseOptionsCounter

local function reportMissingPurchaseOptions(p0) --[[ line: 8 ]]
	-- upvalues: default (ref), bulkPurchaseMissingPurchaseOptionsCounter (ref)
	for i, v in p0 do
		local purchaseOptions = v.purchaseOptions
		
		if purchaseOptions == nil or #purchaseOptions == 0 then
			default:logRobloxTelemetryCounter(bulkPurchaseMissingPurchaseOptionsCounter, 1, {})
			
			return
		end
	end
end

return function(p1) --[[ line: 20 | named "reportBulkPurchaseRequestIssues" ]]
	-- upvalues: reportMissingPurchaseOptions (ref)
	if p1 == nil then
		return
	end
	reportMissingPurchaseOptions(p1)
end