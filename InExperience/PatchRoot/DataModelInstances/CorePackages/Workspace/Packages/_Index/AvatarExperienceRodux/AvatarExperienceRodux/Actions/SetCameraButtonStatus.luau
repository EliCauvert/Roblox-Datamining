local parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p1, "boolean", "Actions.SetCameraButton.status")
	
	return { status = p1 }
end)