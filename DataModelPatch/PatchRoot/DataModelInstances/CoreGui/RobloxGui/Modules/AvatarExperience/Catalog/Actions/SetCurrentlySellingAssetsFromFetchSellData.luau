local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(AssetId, UserAssetIdList)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(AssetId, "string", "assetId")
	ArgCheckModule.isType(UserAssetIdList, "table", "userAssetIdList")
	
	return { assetId = AssetId, userAssetIdList = UserAssetIdList }
end)