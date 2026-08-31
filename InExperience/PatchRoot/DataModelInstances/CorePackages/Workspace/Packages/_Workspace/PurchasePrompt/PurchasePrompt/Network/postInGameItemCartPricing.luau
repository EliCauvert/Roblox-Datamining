local parent = script.Parent.Parent
local _ = require(parent.Parent.PurchasePromptLite)
local promiseModule = require(parent.Promise)
local _ = require(parent.types)
local unifiedPurchaseTelemetryModule = require(parent.Events.UnifiedPurchaseTelemetry)
local logUnifiedPurchaseTelemetryCounterModule = require(parent.Utils.logUnifiedPurchaseTelemetryCounter)

local function buildRequestBody(p1, p2, p3, p4)
	local t = { userId = p1, featureKey = p2, items = p3 }
	
	if p4 ~= nil and #p4 > 0 then
		local t_1 = {}
		
		for i, v in p4 do
			table.insert(t_1, {
				selectionType = "OFFER_SELECTION_TYPE_EXCLUDED",
				offerId = v
			})
		end
		t.offerSelections = t_1
	end
	return t
end

return function(p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: promiseModule (ref), buildRequestBody (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref)
	return if p8 == nil or #p8 == 0 or p5.postInGameItemCartPricing == nil then promiseModule.resolve(nil) else p5.postInGameItemCartPricing(buildRequestBody(p6, p7, p8, p9)):andThen(function(p12)
		-- upvalues: logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), p10 (ref), p11 (ref)
		logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingFetchSucceededCounter, p10, p11)
		
		return p12
	end):catch(function(p12)
		-- upvalues: logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), p10 (ref), p11 (ref)
		logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingFetchFailedCounter, p10, p11)
		warn(string.format("postInGameItemCartPricing failed: %s", tostring(p12)))
		
		return nil
	end)
end