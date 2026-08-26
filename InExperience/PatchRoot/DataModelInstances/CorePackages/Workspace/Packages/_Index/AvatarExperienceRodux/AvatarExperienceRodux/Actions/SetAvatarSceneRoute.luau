local parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local roduxModule = require(parent.Rodux)
local argCheckModule = require(parent.ArgCheck)
local _ = require(parent.AvatarExperienceNavigation)

return roduxModule.makeActionCreator(script.Name, function(p1)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p1, "table", "avatarRoute")
	
	return { avatarRoute = p1 }
end)