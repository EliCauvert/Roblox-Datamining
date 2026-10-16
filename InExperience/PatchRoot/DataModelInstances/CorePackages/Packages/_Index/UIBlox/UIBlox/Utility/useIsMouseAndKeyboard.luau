local Parent = script.Parent
local InputTypeModule = require(Parent.Parent.Enums.InputType)
local UseInputTypeModule = require(Parent.useInputType)

return function(): boolean --[[ Line: 11 | Named "useIsMouseAndKeyboard" ]]
	-- upvalues: UseInputTypeModule (copy), InputTypeModule (copy)
	return UseInputTypeModule() == InputTypeModule.MouseAndKeyboard
end