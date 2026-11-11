local Parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local ArgCheckModule = require(Parent.ArgCheck)

return require(Parent.Rodux).makeActionCreator(script.Name, function(Status)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(Status, "boolean", "Actions.SetCameraButton.status")
	
	return { status = Status }
end)