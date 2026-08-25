local builderIconsModule = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons)
local font = builderIconsModule.Font
local iconVariant = builderIconsModule.IconVariant

return function(p1, p2)
	-- upvalues: iconVariant (ref), font (ref)
	local var1 = font[p2 or iconVariant.Regular]
	
	return `<font family="{var1.Family}" weight="{var1.Weight.Value}">{p1}</font>`
end