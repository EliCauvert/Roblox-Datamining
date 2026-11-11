local FFlagAXBackgroundsRootModule = require(script.Parent.FFlagAXBackgroundsRoot)
local Success = pcall(function()
	return Enum.AvatarAssetType.AvatarBackground
end)

return game:DefineFastFlag("AXCatalogBackgroundsSupportDev", false) and (FFlagAXBackgroundsRootModule and Success)