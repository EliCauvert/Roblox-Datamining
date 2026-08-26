local parent = script.Parent.Parent
local _ = require(parent.Parent.PurchasePromptLite)
local promiseModule = require(parent.Promise)
local _ = require(parent.types)
local unifiedPurchaseTelemetryModule = require(parent.Events.UnifiedPurchaseTelemetry)
local logUnifiedPurchaseTelemetryCounterModule = require(parent.Utils.logUnifiedPurchaseTelemetryCounter)

local function _(p1, p2, p3)
	local t = { featureKey = p1, items = p2 }
	
	if p3 ~= nil then
		t.offerSelections = { selectionType = "EXCLUDED", offers = p3 }
	end
	return t
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: promiseModule (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref)
	if p3 == nil or #p3 == 0 or p1.postInGameItemCartPricing == nil then
		return promiseModule.resolve(nil)
	end
	local postInGameItemCartPricing = p1.postInGameItemCartPricing
	local t = { featureKey = p2, items = p3 }
	
	if p4 ~= nil then
		t.offerSelections = { selectionType = "EXCLUDED", offers = p4 }
	end
	return postInGameItemCartPricing(t):andThen(function(p7)
		-- upvalues: logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), p5 (ref), p6 (ref)
		logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingFetchSucceededCounter, p5, p6)
		
		return p7
	end):catch(function(p7)
		-- upvalues: logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), p5 (ref), p6 (ref)
		logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingFetchFailedCounter, p5, p6)
		warn(string.format("postInGameItemCartPricing failed: %s", tostring(p7)))
		
		return nil
	end)
end