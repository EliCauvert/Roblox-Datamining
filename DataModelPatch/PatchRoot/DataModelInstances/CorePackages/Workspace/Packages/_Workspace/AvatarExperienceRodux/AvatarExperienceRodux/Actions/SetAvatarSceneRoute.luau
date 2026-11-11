local Parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local _ = require(Parent.AvatarExperienceNavigation)

return require(Parent.Rodux).makeActionCreator(script.Name, function(AvatarRoute)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(AvatarRoute, "table", "avatarRoute")
	
	return { avatarRoute = AvatarRoute }
end)