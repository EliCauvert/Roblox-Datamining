local Parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local ArgCheckModule = require(Parent.ArgCheck)

return require(Parent.Rodux).makeActionCreator(script.Name, function(ErrorOccurred) --[[ Line: 11 ]]
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(ErrorOccurred, "boolean", "Actions.SetCameraButton.errorOccurred")
	
	return { errorOccurred = ErrorOccurred }
end)