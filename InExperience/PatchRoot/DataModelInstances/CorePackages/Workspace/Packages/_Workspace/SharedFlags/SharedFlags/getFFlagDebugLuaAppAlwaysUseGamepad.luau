local RunService = game:GetService("RunService")
local IsTenFootInterfaceFunction = require(script:FindFirstAncestor("SharedFlags").Parent.AppCommonLib).isTenFootInterface
game:DefineFastFlag("DebugLuaAppAlwaysUseGamepad", false)
game:DefineFastInt("DebugLuaAppForceGamepad", 0)

return function()
	-- upvalues: RunService (copy), IsTenFootInterfaceFunction (copy)
	return game:GetFastFlag("DebugLuaAppAlwaysUseGamepad") and RunService:IsStudio() and IsTenFootInterfaceFunction() or game:GetFastInt("DebugLuaAppForceGamepad") > 0
end