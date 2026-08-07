local parent = script.Parent.Parent
local _ = require(parent.Parent.PurchasePromptLite)
local promiseModule = require(parent.Promise)
local _ = require(parent.types)
local unifiedPurchaseTelemetryModule = require(parent.Events.UnifiedPurchaseTelemetry)
local logUnifiedPurchaseTelemetryCounterModule = require(parent.Utils.logUnifiedPurchaseTelemetryCounter)

local function _(p0, p1) --[[ line: 18 | named "buildCartPricingRequestBody" ]]
	local t = { featureKey = "MARKETPLACE_CART", items = p0 }
	
	if p1 ~= nil then
		t.unselectedOffers = p1
	end
	return t
end

return function(p2, p3, p4, p5, p6) --[[ line: 32 | named "postCartPricing" ]]
	-- upvalues: promiseModule (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref)
	if p3 == nil or #p3 == 0 or p2.postCartPricing == nil then
		return promiseModule.resolve(nil)
	end
	local postCartPricing = p2.postCartPricing
	local t = { featureKey = "MARKETPLACE_CART", items = p3 }
	
	if p4 ~= nil then
		t.unselectedOffers = p4
	end
	return postCartPricing(t):andThen(function(p8) --[[ line: 48 ]]
		-- upvalues: logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), p5 (ref), p6 (ref)
		logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingFetchSucceededCounter, p5, p6)
		
		return p8
	end):catch(function(p7) --[[ line: 56 ]]
		-- upvalues: logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), p5 (ref), p6 (ref)
		logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingFetchFailedCounter, p5, p6)
		warn(string.format("postCartPricing failed: %s", tostring(p7)))
		
		return nil
	end)
end