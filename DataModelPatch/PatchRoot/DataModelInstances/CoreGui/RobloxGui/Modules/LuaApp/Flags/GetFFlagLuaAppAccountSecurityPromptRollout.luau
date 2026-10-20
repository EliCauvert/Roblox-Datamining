game:DefineFastInt("LuaAppAccountSecurityPromptRollout", 0)
game:DefineFastFlag("LuaAppAccountSecurityPromptRolloutEnabledForAll", false)

return function(p1: number): boolean
	if game:GetFastFlag("LuaAppAccountSecurityPromptRolloutEnabledForAll") then
		return true
	else
		local LuaAppAccountSecurityPromptRolloutFastInt: number = game:GetFastInt("LuaAppAccountSecurityPromptRollout")
		
		return LuaAppAccountSecurityPromptRolloutFastInt > 0 and (if p1 and p1 ~= "" then (p1 + 37) % 100 < LuaAppAccountSecurityPromptRolloutFastInt else false)
	end
end