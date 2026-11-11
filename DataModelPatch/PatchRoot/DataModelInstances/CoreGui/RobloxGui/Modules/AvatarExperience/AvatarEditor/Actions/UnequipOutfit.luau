local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(AssetTypeIdToAssetIdToAssetMetadataModel)
	return {
		assetTypeIdToAssetIdToAssetMetadataModel = AssetTypeIdToAssetIdToAssetMetadataModel
	}
end)