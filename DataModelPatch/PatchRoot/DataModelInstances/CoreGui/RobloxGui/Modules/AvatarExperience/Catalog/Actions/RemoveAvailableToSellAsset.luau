local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(AssetId, UserAssetId)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(AssetId, "string", "assetId")
	ArgCheckModule.isType(UserAssetId, "string", "userAssetId")
	
	return { assetId = AssetId, userAssetId = UserAssetId }
end)