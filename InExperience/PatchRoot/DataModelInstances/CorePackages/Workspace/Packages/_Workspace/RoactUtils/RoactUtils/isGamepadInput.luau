local parent = script.Parent.Parent
local inputTypeConstants = require(parent.InputType).InputTypeConstants
local getInputGroup = require(parent.InputType).getInputGroup

return function(p1)
	-- upvalues: getInputGroup (ref), inputTypeConstants (ref)
	return getInputGroup(p1) == inputTypeConstants.Gamepad
end