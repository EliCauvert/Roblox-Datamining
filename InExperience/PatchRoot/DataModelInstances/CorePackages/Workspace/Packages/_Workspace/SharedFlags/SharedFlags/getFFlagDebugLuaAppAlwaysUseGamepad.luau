local runService = game:GetService("RunService")
local isTenFootInterface = require(script:FindFirstAncestor("SharedFlags").Parent.AppCommonLib).isTenFootInterface
game:DefineFastFlag("DebugLuaAppAlwaysUseGamepad", false)
game:DefineFastInt("DebugLuaAppForceGamepad", 0)

return function()
	-- upvalues: runService (ref), isTenFootInterface (ref)
	return game:GetFastFlag("DebugLuaAppAlwaysUseGamepad") and (runService:IsStudio() and (isTenFootInterface() or game:GetFastInt("DebugLuaAppForceGamepad") > 0))
end