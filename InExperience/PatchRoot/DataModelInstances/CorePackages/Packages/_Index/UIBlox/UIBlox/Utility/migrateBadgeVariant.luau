local parent = script.Parent.Parent
local foundationModule = require(parent.Parent.Foundation)
local flags = foundationModule.Utility.Flags
local statusIndicatorVariant = foundationModule.Enums.StatusIndicatorVariant
local badgeVariantModule = require(parent.App.Indicator.Enum.BadgeVariant)

return function(p0) --[[ line: 9 | named "migrateBadgeVariantToStatusIndicatorVariant" ]]
	-- upvalues: flags (ref), badgeVariantModule (ref), statusIndicatorVariant (ref)
	return if flags.FoundationStatusIndicatorVariantExperiment then if p0 == badgeVariantModule.Alert then statusIndicatorVariant.Alert else statusIndicatorVariant.Contrast_Experiment else statusIndicatorVariant.Emphasis
end