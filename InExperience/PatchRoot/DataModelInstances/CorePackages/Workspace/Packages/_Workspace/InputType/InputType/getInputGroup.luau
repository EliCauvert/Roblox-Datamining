local parent = script.Parent.Parent
local inputTypeConstantsModule = require(script.Parent.InputTypeConstants)
local inputTypeMapModule = require(script.Parent.InputTypeMap)
local getFFlagDebugLuaAppAlwaysUseGamepad = require(parent.SharedFlags).getFFlagDebugLuaAppAlwaysUseGamepad

return function(p0) --[[ line: 11 | named "getInputGroup" ]]
	-- upvalues: getFFlagDebugLuaAppAlwaysUseGamepad (ref), inputTypeConstantsModule (ref), inputTypeMapModule (ref)
	return if getFFlagDebugLuaAppAlwaysUseGamepad() then inputTypeConstantsModule.Gamepad else inputTypeMapModule[p0] or inputTypeConstantsModule.None
end