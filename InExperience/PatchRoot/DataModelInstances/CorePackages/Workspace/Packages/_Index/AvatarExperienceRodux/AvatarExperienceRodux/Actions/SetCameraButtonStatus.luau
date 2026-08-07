local parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 11 ]]
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p0, "boolean", "Actions.SetCameraButton.status")
	
	return { status = p0 }
end)