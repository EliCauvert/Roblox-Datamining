local Parent = script.Parent.Parent
local InputTypeConstants = require(Parent.InputType).InputTypeConstants
local GetInputGroupFunction = require(Parent.InputType).getInputGroup

return function(p1): boolean --[[ Line: 5 | Named "isGamepadInput" ]]
	-- upvalues: GetInputGroupFunction (copy), InputTypeConstants (copy)
	return GetInputGroupFunction(p1) == InputTypeConstants.Gamepad
end