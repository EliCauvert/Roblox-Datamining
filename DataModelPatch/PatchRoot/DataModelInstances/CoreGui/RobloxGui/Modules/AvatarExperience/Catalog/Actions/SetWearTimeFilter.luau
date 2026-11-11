local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

return (require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(WearTimeFilter)
	return { wearTimeFilter = WearTimeFilter }
end))