local statusIndicatorVariantModule = require(script:FindFirstAncestor("Foundation").Enums.StatusIndicatorVariant)

return {
	[statusIndicatorVariantModule.Emphasis] = true,
	[statusIndicatorVariantModule.Standard] = true
}