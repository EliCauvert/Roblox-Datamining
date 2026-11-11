local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(BundleId, IsOwned)
	return { bundleId = BundleId, isOwned = IsOwned }
end)