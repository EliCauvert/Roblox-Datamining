local parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local roduxModule = require(parent.Rodux)
local argCheckModule = require(parent.ArgCheck)
local _ = require(parent.AvatarExperienceNavigation)

return roduxModule.makeActionCreator(script.Name, function(p0) --[[ line: 9 ]]
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p0, "table", "avatarRoute")
	
	return { avatarRoute = p0 }
end)