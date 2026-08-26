local corePackagesService = game:GetService("CorePackages")
local _ = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)

return require(corePackagesService.Packages.Rodux).makeActionCreator(script.Name, function(p1)
	return { result = p1 or {} }
end)