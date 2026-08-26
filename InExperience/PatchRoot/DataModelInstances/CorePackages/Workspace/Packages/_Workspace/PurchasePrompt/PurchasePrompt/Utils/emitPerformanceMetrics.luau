local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local purchasePromptLiteModule = require(parent.PurchasePromptLite)
local enums = require(parent.PurchasePromptLite).Enums
local _ = require(purchasePrompt.types)
local getTTIEventName = purchasePromptLiteModule.getTTIEventName
local intervalPerformanceTracker = require(parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local constantsModule = require(purchasePrompt.Misc.Constants)
local productPurchaseContainerFPSDuration = game:DefineFastInt("ProductPurchaseContainerFPSDuration", 2)
local fIntTTIUnifiedPurchaseSamplingRate = require(parent.SharedFlags).FIntTTIUnifiedPurchaseSamplingRate
local t = {
	[enums.ProductPurchaseSurface.Catalog] = true,
	[enums.ProductPurchaseSurface.EDP] = true
}

if require(purchasePrompt.Flags.FFlagEnableInExperiencePurchaseModalMetrics) then
	t[enums.ProductPurchaseSurface.InExperience] = true
end
function emitPerformanceMetrics(p1, p2)
	-- upvalues: t (ref)
	if p2 ~= nil and t[p2] then
		emitFPSMetrics(p1, p2)
		emitTTIMetrics(p2)
	end
end

function emitFPSMetrics(p1, p2)
	-- upvalues: intervalPerformanceTracker (ref), constantsModule (ref), productPurchaseContainerFPSDuration (ref)
	intervalPerformanceTracker:startTracking(constantsModule.PerformanceMetrics.Prefix.UnifiedPurchaseModal .. "_" .. p2 .. "_" .. p3, productPurchaseContainerFPSDuration, nil, true, true)
	intervalPerformanceTracker:startTracking(constantsModule.PerformanceMetrics.Prefix.PurchaseModal .. "_" .. p2 .. "_" .. p3, productPurchaseContainerFPSDuration, nil, true, true)
end

function emitTTIMetrics(p1)
	-- upvalues: getTTIEventName (ref), timeToInteractiveTracker (ref), fIntTTIUnifiedPurchaseSamplingRate (ref)
	timeToInteractiveTracker.trackEnd(getTTIEventName(p1), {
		samplingRateOverride = fIntTTIUnifiedPurchaseSamplingRate
	})
end

return emitPerformanceMetrics