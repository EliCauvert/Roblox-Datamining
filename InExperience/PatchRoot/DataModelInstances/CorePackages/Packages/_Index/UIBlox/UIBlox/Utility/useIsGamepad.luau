local parent = script.Parent
local inputTypeModule = require(parent.Parent.Enums.InputType)
local useInputTypeModule = require(parent.useInputType)

return function() --[[ line: 11 | named "useIsGamepad" ]]
	-- upvalues: useInputTypeModule (ref), inputTypeModule (ref)
	return useInputTypeModule() == inputTypeModule.Gamepad
end