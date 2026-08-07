local corePackagesService = game:GetService("CorePackages")
local _ = require(corePackagesService.Workspace.Packages.AvatarExperienceInspectAndBuy)

return require(corePackagesService.Packages.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 10 ]]
	return { avatarPreviewDetails = p0 or {} }
end)