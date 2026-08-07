local foundation = script:FindFirstAncestor("Foundation")
local statusIndicatorVariantModule = require(foundation.Enums.StatusIndicatorVariant)
local flagsModule = require(foundation.Utility.Flags)

return {
	[statusIndicatorVariantModule.Emphasis] = true,
	[statusIndicatorVariantModule.Standard] = true,
	[statusIndicatorVariantModule.Contrast_Experiment] = if flagsModule.FoundationStatusIndicatorVariantExperiment then true else false,
	[statusIndicatorVariantModule.Alert] = if flagsModule.FoundationStatusIndicatorVariantExperiment then true else false
}