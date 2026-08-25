local avatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local parent = avatarExperienceNavigation.Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local avatarRouteContextModule = require(avatarExperienceNavigation.AvatarRoute.Context.AvatarRouteContext)
local _ = require(avatarExperienceNavigation.AvatarRoute.Types)

return function()
	-- upvalues: reactModule (ref), avatarRouteContextModule (ref), argCheckModule (ref)
	return argCheckModule.isNotNil(reactModule.useContext(avatarRouteContextModule), "AvatarRouteContext")
end