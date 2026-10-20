game:DefineFastInt("LuaAppChallengeForceWebViewVisibleTimeoutSeconds", 30)

return function()
	local LuaAppChallengeForceWebViewVisibleTimeoutSecondsFastInt = game:GetFastInt("LuaAppChallengeForceWebViewVisibleTimeoutSeconds")
	
	if LuaAppChallengeForceWebViewVisibleTimeoutSecondsFastInt <= 0 then
		LuaAppChallengeForceWebViewVisibleTimeoutSecondsFastInt = 30
	end
	return LuaAppChallengeForceWebViewVisibleTimeoutSecondsFastInt
end