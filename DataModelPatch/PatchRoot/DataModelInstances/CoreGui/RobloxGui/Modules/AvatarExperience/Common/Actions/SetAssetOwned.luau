local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(AssetId, IsOwned)
	return { assetId = AssetId, isOwned = IsOwned }
end)