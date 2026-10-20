local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(Assets, OutfitModerationStatus)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(Assets, "table", "SetAssetInfoFromOutfitDetails action expects assets to be a table")
	
	return {
		assets = Assets,
		outfitModerationStatus = OutfitModerationStatus
	}
end)