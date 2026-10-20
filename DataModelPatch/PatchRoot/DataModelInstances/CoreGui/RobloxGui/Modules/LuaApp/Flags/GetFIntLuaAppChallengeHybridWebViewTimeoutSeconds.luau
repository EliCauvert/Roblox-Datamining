game:DefineFastInt("LuaAppChallengeHybridWebViewTimeoutSeconds", 5)

return function()
	local LuaAppChallengeHybridWebViewTimeoutSecondsFastInt = game:GetFastInt("LuaAppChallengeHybridWebViewTimeoutSeconds")
	
	if LuaAppChallengeHybridWebViewTimeoutSecondsFastInt <= 0 then
		LuaAppChallengeHybridWebViewTimeoutSecondsFastInt = 5
	end
	return LuaAppChallengeHybridWebViewTimeoutSecondsFastInt
end