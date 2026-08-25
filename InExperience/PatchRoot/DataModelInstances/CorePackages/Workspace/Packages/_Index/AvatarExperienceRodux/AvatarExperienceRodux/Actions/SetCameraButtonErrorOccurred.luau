local parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p0, "boolean", "Actions.SetCameraButton.errorOccurred")
	
	return { errorOccurred = p0 }
end)