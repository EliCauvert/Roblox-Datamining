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
	isUserEnrolled = function(p1)
		if game:GetFastFlag("InGameLargerRobuxUpsellEnabled") then
			return true
		elseif game:GetFastFlag("InGameLargerRobuxUpsellEnabled") or game:GetFastFlag("InGameLargerRobuxUpsellIXP") then
			local P0 = p1 or {}
			local InGameLargerRobuxUpsellIXPLayerParamFastString = game:GetFastString("InGameLargerRobuxUpsellIXPLayerParam")
			
			return if P0[InGameLargerRobuxUpsellIXPLayerParamFastString] == nil then game:GetFastFlag("InGameLargerRobuxUpsellEnabled") or game:GetFastFlag("InGameLargerRobuxUpsellIXPRolledOut") else P0[InGameLargerRobuxUpsellIXPLayerParamFastString]
		else
			return false
		end
	end
}