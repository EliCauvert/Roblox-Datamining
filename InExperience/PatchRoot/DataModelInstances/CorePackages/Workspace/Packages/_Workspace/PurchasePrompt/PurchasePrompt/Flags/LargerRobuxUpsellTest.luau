game:DefineFastFlag("InGameLargerRobuxUpsellIXP", false)
game:DefineFastFlag("InGameLargerRobuxUpsellIXPRolledOut", false)
game:DefineFastFlag("InGameLargerRobuxUpsellEnabled", false)
game:DefineFastString("InGameLargerRobuxUpsellIXPLayerParam", "isInExperiment")

local function _()
	return game:GetFastFlag("InGameLargerRobuxUpsellEnabled") or game:GetFastFlag("InGameLargerRobuxUpsellIXPRolledOut")
end

return {
	isEnabled = function()
		return game:GetFastFlag("InGameLargerRobuxUpsellEnabled") or game:GetFastFlag("InGameLargerRobuxUpsellIXP")
	end,
	isEnabledForAll = function()
		return game:GetFastFlag("InGameLargerRobuxUpsellEnabled")
	end,
	isUserEnrolled = function(p0)
		if game:GetFastFlag("InGameLargerRobuxUpsellEnabled") then
			return true
		elseif not game:GetFastFlag("InGameLargerRobuxUpsellEnabled") and not game:GetFastFlag("InGameLargerRobuxUpsellIXP") then
			return false
		end
		p0 = p0 or {}
		local inGameLargerRobuxUpsellIXPLayerParamFastString = game:GetFastString("InGameLargerRobuxUpsellIXPLayerParam")
		
		return if p0[inGameLargerRobuxUpsellIXPLayerParamFastString] == nil then game:GetFastFlag("InGameLargerRobuxUpsellEnabled") or game:GetFastFlag("InGameLargerRobuxUpsellIXPRolledOut") else p0[inGameLargerRobuxUpsellIXPLayerParamFastString]
	end
}