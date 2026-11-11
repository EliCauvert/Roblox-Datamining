local FFlagAXBackgroundCycloramaRenderingModule = require(script.Parent.FFlagAXBackgroundCycloramaRendering)
local AXBackgroundsCustomizeHydration4 = game:DefineFastFlag("AXBackgroundsCustomizeHydration4", false)
local Success = pcall(function()
	return Enum.AvatarAssetType.AvatarBackground
end)

return require(script.Parent.FFlagAXBackgroundsRoot) and (FFlagAXBackgroundCycloramaRenderingModule and (AXBackgroundsCustomizeHydration4 and Success))