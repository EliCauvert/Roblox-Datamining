local FFlagAXCustomizeMakeupSupportModule = require(script.Parent.FFlagAXCustomizeMakeupSupport)

return pcall(function()
	return Enum.AvatarAssetType.EyeMakeup
end) and (game:DefineFastFlag("AXCatalogMakeupSupport10", false) and FFlagAXCustomizeMakeupSupportModule)