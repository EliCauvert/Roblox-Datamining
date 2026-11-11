local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(AssetId, UserAssetIds)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(AssetId, "string", "assetId")
	ArgCheckModule.isType(UserAssetIds, "table", "userAssetIds")
	
	return { assetId = AssetId, userAssetIds = UserAssetIds }
end)