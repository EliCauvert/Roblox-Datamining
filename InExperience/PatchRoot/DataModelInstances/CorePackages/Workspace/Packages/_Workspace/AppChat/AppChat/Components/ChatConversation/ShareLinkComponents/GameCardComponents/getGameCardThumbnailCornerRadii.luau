local RoundedVariantModule = require(script:FindFirstAncestor("AppChat").Enums.RoundedVariant)
local GetCornerRadiiModule = require(script.Parent.Parent.getCornerRadii)
local config = {
	[RoundedVariantModule.Top] = { topLeft = true, topRight = true },
	[RoundedVariantModule.TopLeft] = { topLeft = true },
	[RoundedVariantModule.TopRight] = { topRight = true }
}

return function(p1, p2) --[[ Line: 14 | Named "getGameCardThumbnailCornerRadii" ]]
	-- upvalues: config (copy), RoundedVariantModule (copy), GetCornerRadiiModule (copy)
	return GetCornerRadiiModule(config[p1 or RoundedVariantModule.Top] or config[RoundedVariantModule.Top], p2)
end