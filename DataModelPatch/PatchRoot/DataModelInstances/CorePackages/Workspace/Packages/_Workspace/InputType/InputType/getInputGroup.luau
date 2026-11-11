local InputTypeConstantsModule = require(script.Parent.InputTypeConstants)
local InputTypeMapModule = require(script.Parent.InputTypeMap)
local GetFFlagDebugLuaAppAlwaysUseGamepadFunction = require(script.Parent.Parent.SharedFlags).getFFlagDebugLuaAppAlwaysUseGamepad

return function(p1)
	-- upvalues: GetFFlagDebugLuaAppAlwaysUseGamepadFunction (copy), InputTypeConstantsModule (copy), InputTypeMapModule (copy)
	return if GetFFlagDebugLuaAppAlwaysUseGamepadFunction() then InputTypeConstantsModule.Gamepad else InputTypeMapModule[p1] or InputTypeConstantsModule.None
end