game:DefineFastInt("LuaAppChallengeDialogPollingIntervalSeconds", 15)

return function()
	local LuaAppChallengeDialogPollingIntervalSecondsFastInt = game:GetFastInt("LuaAppChallengeDialogPollingIntervalSeconds")
	
	if LuaAppChallengeDialogPollingIntervalSecondsFastInt <= 0 then
		LuaAppChallengeDialogPollingIntervalSecondsFastInt = 15
	end
	return LuaAppChallengeDialogPollingIntervalSecondsFastInt
end