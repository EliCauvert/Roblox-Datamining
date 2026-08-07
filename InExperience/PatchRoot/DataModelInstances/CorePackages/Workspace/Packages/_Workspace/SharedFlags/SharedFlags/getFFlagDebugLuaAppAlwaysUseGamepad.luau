local runService = game:GetService("RunService")
local guiService = game:GetService("GuiService")
game:DefineFastFlag("DebugLuaAppAlwaysUseGamepad", false)
game:DefineFastInt("DebugLuaAppForceGamepad", 0)

return function() --[[ line: 9 ]]
	-- upvalues: runService (ref), guiService (ref)
	return game:GetFastFlag("DebugLuaAppAlwaysUseGamepad") and (runService:IsStudio() and (guiService:IsTenFootInterface() or game:GetFastInt("DebugLuaAppForceGamepad") > 0))
end