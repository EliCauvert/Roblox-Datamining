local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local _ = require(parent.SduiCoreSystem)
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen

return function(_, _, p1, _)
	-- upvalues: avatarScreen (ref)
	p1.dependencies.getNavigation().navigate(avatarScreen.Catalog)
end