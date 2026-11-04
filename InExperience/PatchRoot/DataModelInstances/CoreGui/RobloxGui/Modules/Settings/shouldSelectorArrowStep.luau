local FFlagSettingsSelectorStepOnPressOnlyModule = require(script.Parent.Flags.FFlagSettingsSelectorStepOnPressOnly)

return function(UserInputType, p1, p2)
	-- upvalues: FFlagSettingsSelectorStepOnPressOnlyModule (copy)
	return if FFlagSettingsSelectorStepOnPressOnlyModule then UserInputType == Enum.UserInputType.MouseButton1 or UserInputType == Enum.UserInputType.Touch else p1 or p2 and UserInputType == Enum.UserInputType.MouseButton1
end