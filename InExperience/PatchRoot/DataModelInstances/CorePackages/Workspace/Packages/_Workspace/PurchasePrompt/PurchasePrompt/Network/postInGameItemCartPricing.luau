local Parent = script.Parent.Parent
local _ = require(Parent.Parent.PurchasePromptLite)
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.types)
local UnifiedPurchaseTelemetryModule = require(Parent.Events.UnifiedPurchaseTelemetry)
local LogUnifiedPurchaseTelemetryCounterModule = require(Parent.Utils.logUnifiedPurchaseTelemetryCounter)

local function buildRequestBody(UserId, FeatureKey, Items, List)
	local config = { userId = UserId, featureKey = FeatureKey, items = Items }
	
	if List ~= nil and #List > 0 then
		local OfferSelections = {}
		
		for _, OfferId in List do
			table.insert(OfferSelections, {
				selectionType = "OFFER_SELECTION_TYPE_EXCLUDED",
				offerId = OfferId
			})
		end
		config.offerSelections = OfferSelections
	end
	return config
end

return function(p1, UserId, FeatureKey, Items, p2, p3, p4)
	-- upvalues: PromiseModule (copy), buildRequestBody (copy), LogUnifiedPurchaseTelemetryCounterModule (copy), UnifiedPurchaseTelemetryModule (copy)
	return if Items == nil or #Items == 0 or p1.postInGameItemCartPricing == nil then PromiseModule.resolve(nil) else p1.postInGameItemCartPricing((buildRequestBody(UserId, FeatureKey, Items, p2))):andThen(function(Result)
		-- upvalues: LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), p3 (copy), p4 (copy)
		LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedCartPricingFetchSucceededCounter, p3, p4)
		
		return Result
	end):catch(function(Err)
		-- upvalues: LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), p3 (copy), p4 (copy)
		LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedCartPricingFetchFailedCounter, p3, p4)
		warn(string.format("postInGameItemCartPricing failed: %s", (tostring(Err))))
		
		return nil
	end)
end