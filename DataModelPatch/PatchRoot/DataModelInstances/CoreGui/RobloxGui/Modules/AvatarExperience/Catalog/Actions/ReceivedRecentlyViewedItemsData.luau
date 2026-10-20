local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(p1)
	return {
		assetData = p1.assetData,
		bundleData = p1.bundleData,
		widget = p1.widget
	}
end)