local Parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local ArgCheckModule = require(Parent.ArgCheck)

return require(Parent.Rodux).makeActionCreator(script.Name, function(ErrorOccurred)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(ErrorOccurred, "boolean", "Actions.SetCameraButton.errorOccurred")
	
	return { errorOccurred = ErrorOccurred }
end)