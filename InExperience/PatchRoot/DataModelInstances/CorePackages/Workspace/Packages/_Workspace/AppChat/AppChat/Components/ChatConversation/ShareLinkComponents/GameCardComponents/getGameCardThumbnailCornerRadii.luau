local roundedVariantModule = require(script:FindFirstAncestor("AppChat").Enums.RoundedVariant)
local getCornerRadiiModule = require(script.Parent.Parent.getCornerRadii)
local t = {
	[roundedVariantModule.Top] = { topLeft = true, topRight = true },
	[roundedVariantModule.TopLeft] = { topLeft = true },
	[roundedVariantModule.TopRight] = { topRight = true }
}

return function(p0, p1) --[[ line: 14 | named "getGameCardThumbnailCornerRadii" ]]
	-- upvalues: t (ref), roundedVariantModule (ref), getCornerRadiiModule (ref)
	return getCornerRadiiModule(t[p0 or roundedVariantModule.Top] or t[roundedVariantModule.Top], p1)
end