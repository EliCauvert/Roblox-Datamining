local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(Assets, AssetTypeId)
	return { assets = Assets, assetTypeId = AssetTypeId }
end)