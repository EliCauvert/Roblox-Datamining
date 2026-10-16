local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceInspectAndBuy)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(p1) --[[ Line: 10 ]]
	return { avatarPreviewDetails = p1 or {} }
end)