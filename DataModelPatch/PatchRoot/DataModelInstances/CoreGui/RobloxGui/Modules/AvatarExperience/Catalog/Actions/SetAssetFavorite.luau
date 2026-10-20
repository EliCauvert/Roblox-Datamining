local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(AssetId, IsFavorited)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(AssetId, "string", "SetAssetFavorite expects assetId")
	ArgCheckModule.isType(IsFavorited, "boolean", "SetAssetFavorite expects isFavorited")
	
	return { assetId = AssetId, isFavorited = IsFavorited }
end)