local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(BundleId, BundleData)
	return { bundleId = BundleId, bundleData = BundleData }
end)