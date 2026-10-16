local PlayWithRewardState = script:FindFirstAncestor("PlayWithRewardState")
local SetPlayWithRewardStateModule = require(PlayWithRewardState.SetPlayWithRewardState)
local _ = require(PlayWithRewardState.PlayWithRewardAdData)
local config = {
	flowId = "",
	universeId = "",
	isAdDataExpected = false,
	adData = nil
}

return function(p1, p2) --[[ Line: 24 ]]
	-- upvalues: config (copy), SetPlayWithRewardStateModule (copy)
	local P0 = p1 or table.clone(config)
	
	return if p2.type == SetPlayWithRewardStateModule.name then {
		flowId = p2.flowId,
		universeId = p2.universeId,
		isAdDataExpected = p2.isAdDataExpected,
		adData = p2.adData
	} else P0
end