local AvatarRouteContext = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Context.AvatarRouteContext
local WithContextValueModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.withContextValue)

return function(p1, p2)
	-- upvalues: WithContextValueModule (copy), AvatarRouteContext (copy)
	return WithContextValueModule(p1, AvatarRouteContext.Consumer, "avatarRoute", p2)
end