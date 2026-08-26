local roundedVariantModule = require(script:FindFirstAncestor("AppChat").Enums.RoundedVariant)
local getCornerRadiiModule = require(script.Parent.Parent.getCornerRadii)
local t = {
	[roundedVariantModule.Top] = { topLeft = true, topRight = true },
	[roundedVariantModule.TopLeft] = { topLeft = true },
	[roundedVariantModule.TopRight] = { topRight = true }
}

return function(p1, p2)
	-- upvalues: t (ref), roundedVariantModule (ref), getCornerRadiiModule (ref)
	return getCornerRadiiModule(t[p1 or roundedVariantModule.Top] or t[roundedVariantModule.Top], p2)
end