local BuilderIconsModule = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons)
local BuilderIconsModuleFont = BuilderIconsModule.Font
local IconVariant = BuilderIconsModule.IconVariant

return function(p1, p2): string
	-- upvalues: IconVariant (copy), BuilderIconsModuleFont (copy)
	local BuilderIconsModuleFontEntry = BuilderIconsModuleFont[p2 or IconVariant.Regular]
	
	return `<font family="{BuilderIconsModuleFontEntry.Family}" weight="{BuilderIconsModuleFontEntry.Weight.Value}">{p1}</font>`
end