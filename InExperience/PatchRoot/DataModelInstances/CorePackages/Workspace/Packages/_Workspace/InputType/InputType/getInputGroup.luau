local parent = script.Parent.Parent
local inputTypeConstantsModule = require(script.Parent.InputTypeConstants)
local inputTypeMapModule = require(script.Parent.InputTypeMap)
local getFFlagDebugLuaAppAlwaysUseGamepad = require(parent.SharedFlags).getFFlagDebugLuaAppAlwaysUseGamepad

return function(p1)
	-- upvalues: getFFlagDebugLuaAppAlwaysUseGamepad (ref), inputTypeConstantsModule (ref), inputTypeMapModule (ref)
	return if getFFlagDebugLuaAppAlwaysUseGamepad() then inputTypeConstantsModule.Gamepad else inputTypeMapModule[p1] or inputTypeConstantsModule.None
end