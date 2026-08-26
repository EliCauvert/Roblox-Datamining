local parent = script.Parent.Parent
local _ = require(parent.Parent.PurchasePromptLite)
local promiseModule = require(parent.Promise)
local _ = require(parent.types)
local unifiedPurchaseTelemetryModule = require(parent.Events.UnifiedPurchaseTelemetry)
local logUnifiedPurchaseTelemetryCounterModule = require(parent.Utils.logUnifiedPurchaseTelemetryCounter)

local function _(p1, p2)
	local t = { featureKey = "MARKETPLACE_CART", items = p1 }
	
	if p2 ~= nil then
		t.unselectedOffers = p2
	end
	return t
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: promiseModule (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref)
	if p2 == nil or #p2 == 0 or p1.postCartPricing == nil then
		return promiseModule.resolve(nil)
	end
	local postCartPricing = p1.postCartPricing
	local t = { featureKey = "MARKETPLACE_CART", items = p2 }
	
	if p3 ~= nil then
		t.unselectedOffers = p3
	end
	return postCartPricing(t):andThen(function(p6)
		-- upvalues: logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), p4 (ref), p5 (ref)
		logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingFetchSucceededCounter, p4, p5)
		
		return p6
	end):catch(function(p6)
		-- upvalues: logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), p4 (ref), p5 (ref)
		logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingFetchFailedCounter, p4, p5)
		warn(string.format("postCartPricing failed: %s", tostring(p6)))
		
		return nil
	end)
end