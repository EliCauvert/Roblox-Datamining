local FFlagAXOutfitDetailsV4Module = require(script.Parent.FFlagAXOutfitDetailsV4)
local AXBackgroundsOutfitPersistence = game:DefineFastFlag("AXBackgroundsOutfitPersistence", false)
local Success = pcall(function() --[[ Line: 10 ]]
	return Enum.AvatarAssetType.AvatarBackground
end)

return require(script.Parent.FFlagAXBackgroundsRoot) and (FFlagAXOutfitDetailsV4Module and (AXBackgroundsOutfitPersistence and Success))