local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Enum.SalesTypeFilter)

return (require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SalesType)
	return { salesType = SalesType }
end))