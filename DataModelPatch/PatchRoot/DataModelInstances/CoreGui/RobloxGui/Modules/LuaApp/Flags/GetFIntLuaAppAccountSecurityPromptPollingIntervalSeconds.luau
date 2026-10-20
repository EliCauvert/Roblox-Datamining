game:DefineFastInt("LuaAppAccountSecurityPromptPollingIntervalSeconds", 600)

return function()
	local LuaAppAccountSecurityPromptPollingIntervalSecondsFastInt = game:GetFastInt("LuaAppAccountSecurityPromptPollingIntervalSeconds")
	
	if LuaAppAccountSecurityPromptPollingIntervalSecondsFastInt <= 0 then
		LuaAppAccountSecurityPromptPollingIntervalSecondsFastInt = 600
	end
	return LuaAppAccountSecurityPromptPollingIntervalSecondsFastInt
end