local corePackagesService = game:GetService("CorePackages")
local _ = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)

return require(corePackagesService.Packages.Rodux).makeActionCreator(script.Name, function(p0)
	return { result = p0 or {} }
end)