local Parent = script.Parent.Parent
local FoundationModule = require(Parent.Parent.Foundation)
local Flags = FoundationModule.Utility.Flags
local StatusIndicatorVariant = FoundationModule.Enums.StatusIndicatorVariant
local BadgeVariantModule = require(Parent.App.Indicator.Enum.BadgeVariant)

return function(Alert)
	-- upvalues: Flags (copy), BadgeVariantModule (copy), StatusIndicatorVariant (copy)
	return if Flags.FoundationStatusIndicatorVariantExperiment then if Alert == BadgeVariantModule.Alert then StatusIndicatorVariant.Alert else StatusIndicatorVariant.Contrast_Experiment else StatusIndicatorVariant.Emphasis
end