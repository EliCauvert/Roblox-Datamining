local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local _ = require(Parent.SduiCoreSystem)
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen

return function(_, _, p1, _) --[[ Line: 12 ]]
	-- upvalues: AvatarScreen (copy)
	p1.dependencies.getNavigation().navigate(AvatarScreen.Catalog)
end