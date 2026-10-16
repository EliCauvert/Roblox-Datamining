local AvatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local Parent = AvatarExperienceNavigation.Parent
local ReactModule = require(Parent.React)
local ArgCheckModule = require(Parent.ArgCheck)
local AvatarRouteContextModule = require(AvatarExperienceNavigation.AvatarRoute.Context.AvatarRouteContext)
local _ = require(AvatarExperienceNavigation.AvatarRoute.Types)

return function() --[[ Line: 16 | Named "useAvatarRoute" ]]
	-- upvalues: ReactModule (copy), AvatarRouteContextModule (copy), ArgCheckModule (copy)
	return ArgCheckModule.isNotNil(ReactModule.useContext(AvatarRouteContextModule), "AvatarRouteContext")
end