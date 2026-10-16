local Parent = script.Parent.Parent
local _ = require(Parent.Parent.PurchasePromptLite)
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.types)
local UnifiedPurchaseTelemetryModule = require(Parent.Events.UnifiedPurchaseTelemetry)
local LogUnifiedPurchaseTelemetryCounterModule = require(Parent.Utils.logUnifiedPurchaseTelemetryCounter)

local function _(Items, UnselectedOffers) --[[ Line: 18 | Named "buildCartPricingRequestBody" ]]
	local config = { featureKey = "MARKETPLACE_CART", items = Items }
	
	if UnselectedOffers ~= nil then
		config.unselectedOffers = UnselectedOffers
	end
	return config
end

return function(p1, Items, UnselectedOffers, p2, p3) --[[ Line: 32 | Named "postCartPricing" ]]
	-- upvalues: PromiseModule (copy), LogUnifiedPurchaseTelemetryCounterModule (copy), UnifiedPurchaseTelemetryModule (copy)
	if Items == nil or #Items == 0 or p1.postCartPricing == nil then
		return PromiseModule.resolve(nil)
	end
	local PostCartPricingFunction = p1.postCartPricing
	local config = { featureKey = "MARKETPLACE_CART", items = Items }
	
	if UnselectedOffers ~= nil then
		config.unselectedOffers = UnselectedOffers
	end
	return PostCartPricingFunction(config):andThen(function(Result) --[[ Line: 48 ]]
		-- upvalues: LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), p2 (copy), p3 (copy)
		LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedCartPricingFetchSucceededCounter, p2, p3)
		
		return Result
	end):catch(function(Err) --[[ Line: 56 ]]
		-- upvalues: LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), p2 (copy), p3 (copy)
		LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedCartPricingFetchFailedCounter, p2, p3)
		warn(string.format("postCartPricing failed: %s", (tostring(Err))))
		
		return nil
	end)
end