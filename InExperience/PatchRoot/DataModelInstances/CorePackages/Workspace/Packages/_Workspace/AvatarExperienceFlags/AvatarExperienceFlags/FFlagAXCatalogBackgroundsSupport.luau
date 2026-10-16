local FFlagAXBackgroundsRootModule = require(script.Parent.FFlagAXBackgroundsRoot)
local Success = pcall(function() --[[ Line: 3 ]]
	return Enum.AvatarAssetType.AvatarBackground
end)

return game:DefineFastFlag("AXCatalogBackgroundsSupport", false) and (FFlagAXBackgroundsRootModule and Success)