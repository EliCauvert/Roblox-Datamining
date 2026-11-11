local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local Enums = require(Parent.PurchasePromptLite).Enums
local _ = require(PurchasePrompt.types)
local GetTTIEventNameFunction = require(Parent.PurchasePromptLite).getTTIEventName
local IntervalPerformanceTracker = require(Parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local ConstantsModule = require(PurchasePrompt.Misc.Constants)
local ProductPurchaseContainerFPSDuration = game:DefineFastInt("ProductPurchaseContainerFPSDuration", 2)
local FIntTTIUnifiedPurchaseSamplingRate = require(Parent.SharedFlags).FIntTTIUnifiedPurchaseSamplingRate
local config = {
	[Enums.ProductPurchaseSurface.Catalog] = true,
	[Enums.ProductPurchaseSurface.EDP] = true
}

function emitPerformanceMetrics(p1, p2)
	-- upvalues: config (copy)
	if p2 ~= nil and config[p2] then
		emitFPSMetrics(p1, p2)
		emitTTIMetrics(p2)
	end
end

function emitFPSMetrics(Text, Text1)
	-- upvalues: IntervalPerformanceTracker (copy), ConstantsModule (copy), ProductPurchaseContainerFPSDuration (copy)
	IntervalPerformanceTracker:startTracking(ConstantsModule.PerformanceMetrics.Prefix.UnifiedPurchaseModal .. "_" .. Text .. "_" .. Text1, ProductPurchaseContainerFPSDuration, nil, true, true)
	IntervalPerformanceTracker:startTracking(ConstantsModule.PerformanceMetrics.Prefix.PurchaseModal .. "_" .. Text .. "_" .. Text1, ProductPurchaseContainerFPSDuration, nil, true, true)
end

function emitTTIMetrics(p1)
	-- upvalues: GetTTIEventNameFunction (copy), TimeToInteractiveTracker (copy), FIntTTIUnifiedPurchaseSamplingRate (copy)
	TimeToInteractiveTracker.trackEnd(GetTTIEventNameFunction(p1), {
		samplingRateOverride = FIntTTIUnifiedPurchaseSamplingRate
	})
end

return emitPerformanceMetrics