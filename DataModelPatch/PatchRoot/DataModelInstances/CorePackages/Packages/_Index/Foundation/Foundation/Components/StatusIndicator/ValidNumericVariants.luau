local Foundation = script:FindFirstAncestor("Foundation")
local StatusIndicatorVariantModule = require(Foundation.Enums.StatusIndicatorVariant)
local FlagsModule = require(Foundation.Utility.Flags)

return {
	[StatusIndicatorVariantModule.Emphasis] = true,
	[StatusIndicatorVariantModule.Standard] = true,
	[StatusIndicatorVariantModule.Contrast_Experiment] = if FlagsModule.FoundationStatusIndicatorVariantExperiment then true else false,
	[StatusIndicatorVariantModule.Alert] = if FlagsModule.FoundationStatusIndicatorVariantExperiment then true else false
}