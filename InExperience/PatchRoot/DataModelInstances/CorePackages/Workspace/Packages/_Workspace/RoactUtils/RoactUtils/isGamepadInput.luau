local parent = script.Parent.Parent
local inputTypeConstants = require(parent.InputType).InputTypeConstants
local getInputGroup = require(parent.InputType).getInputGroup

return function(p0)
	-- upvalues: getInputGroup (ref), inputTypeConstants (ref)
	return getInputGroup(p0) == inputTypeConstants.Gamepad
end