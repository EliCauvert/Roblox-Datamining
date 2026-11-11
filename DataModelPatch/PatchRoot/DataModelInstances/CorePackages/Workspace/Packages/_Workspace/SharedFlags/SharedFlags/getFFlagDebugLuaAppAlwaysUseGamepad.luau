local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
game:DefineFastFlag("DebugLuaAppAlwaysUseGamepad", false)
game:DefineFastInt("DebugLuaAppForceGamepad", 0)

return function()
	-- upvalues: RunService (copy), GuiService (copy)
	return game:GetFastFlag("DebugLuaAppAlwaysUseGamepad") and RunService:IsStudio() and GuiService:IsTenFootInterface() or game:GetFastInt("DebugLuaAppForceGamepad") > 0
end