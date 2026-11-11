game:DefineFastInt("LuaAppUseStaticCdnUrlForChallengeHybridWebViewRollout", 0)
game:DefineFastFlag("LuaAppUseStaticCdnUrlForChallengeHybridWebViewRolloutEnabledForAll", false)

return function(p1: number): boolean
	if game:GetFastFlag("LuaAppUseStaticCdnUrlForChallengeHybridWebViewRolloutEnabledForAll") then
		return true
	else
		local LuaAppUseStaticCdnUrlForChallengeHybridWebViewRolloutFastInt: number = game:GetFastInt("LuaAppUseStaticCdnUrlForChallengeHybridWebViewRollout")
		
		return LuaAppUseStaticCdnUrlForChallengeHybridWebViewRolloutFastInt > 0 and (if p1 and p1 ~= "" then (p1 + 45) % 100 < LuaAppUseStaticCdnUrlForChallengeHybridWebViewRolloutFastInt else false)
	end
end