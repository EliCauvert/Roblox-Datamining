local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local _ = require(parent.SduiCoreSystem)
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen

return function(_, _, p0, _) --[[ line: 12 ]]
	-- upvalues: avatarScreen (ref)
	p0.dependencies.getNavigation().navigate(avatarScreen.Catalog)
end