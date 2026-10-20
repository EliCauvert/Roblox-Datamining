local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local WithMappedPropsModule = require(Modules.AvatarExperience.Common.withMappedProps)

local function filterAvatarRoute(p1)
	-- upvalues: CryoModule (copy)
	return CryoModule.Dictionary.join(p1, {
		avatarRoute = CryoModule.None,
		opaqueRoute = p1.avatarRoute.opaque
	})
end

return function(p1)
	-- upvalues: WithAvatarRouteModule (copy), WithMappedPropsModule (copy), filterAvatarRoute (copy)
	return WithAvatarRouteModule(WithMappedPropsModule(p1, filterAvatarRoute))
end