local parent = script.Parent.Parent
local _ = require(parent.Parent.PurchasePromptLite)
local promiseModule = require(parent.Promise)
local _ = require(parent.types)
local unifiedPurchaseTelemetryModule = require(parent.Events.UnifiedPurchaseTelemetry)
local logUnifiedPurchaseTelemetryCounterModule = require(parent.Utils.logUnifiedPurchaseTelemetryCounter)

local function _(p0, p1, p2)
	local t = { featureKey = p0, items = p1 }
	
	if p2 ~= nil then
		t.offerSelections = { selectionType = "EXCLUDED", offers = p2 }
	end
	return t
end

return function(p3, p4, p5, p6, p7, p8)
	-- upvalues: promiseModule (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref)
	if p5 == nil or #p5 == 0 or p3.postInGameItemCartPricing == nil then
		return promiseModule.resolve(nil)
	end
	local postInGameItemCartPricing = p3.postInGameItemCartPricing
	local t = { featureKey = p4, items = p5 }
	
	if p6 ~= nil then
		t.offerSelections = { selectionType = "EXCLUDED", offers = p6 }
	end
	return postInGameItemCartPricing(t):andThen(function(p10)
		-- upvalues: logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), p7 (ref), p8 (ref)
		logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingFetchSucceededCounter, p7, p8)
		
		return p10
	end):catch(function(p9)
		-- upvalues: logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), p7 (ref), p8 (ref)
		logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingFetchFailedCounter, p7, p8)
		warn(string.format("postInGameItemCartPricing failed: %s", tostring(p9)))
		
		return nil
	end)
end