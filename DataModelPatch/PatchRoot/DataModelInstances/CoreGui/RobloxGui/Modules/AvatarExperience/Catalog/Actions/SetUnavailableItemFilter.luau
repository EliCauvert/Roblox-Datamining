local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Enum.UnavailableItemFilter)

return (require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(UnavailableItemFilter)
	return { unavailableItemFilter = UnavailableItemFilter }
end))