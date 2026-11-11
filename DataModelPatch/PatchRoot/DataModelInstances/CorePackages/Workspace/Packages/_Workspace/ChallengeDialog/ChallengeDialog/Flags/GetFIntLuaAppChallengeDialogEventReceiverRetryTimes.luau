game:DefineFastInt("LuaAppChallengeDialogEventReceiverRetryTimes", 3)

return function()
	local LuaAppChallengeDialogEventReceiverRetryTimesFastInt = game:GetFastInt("LuaAppChallengeDialogEventReceiverRetryTimes")
	
	if LuaAppChallengeDialogEventReceiverRetryTimesFastInt < 0 then
		LuaAppChallengeDialogEventReceiverRetryTimesFastInt = 3
	end
	return LuaAppChallengeDialogEventReceiverRetryTimesFastInt
end