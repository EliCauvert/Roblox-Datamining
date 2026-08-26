local playWithRewardState = script:FindFirstAncestor("PlayWithRewardState")
local setPlayWithRewardStateModule = require(playWithRewardState.SetPlayWithRewardState)
local _ = require(playWithRewardState.PlayWithRewardAdData)
local t = {
	flowId = "",
	universeId = "",
	isAdDataExpected = false,
	adData = nil
}

return function(p1, p2)
	-- upvalues: t (ref), setPlayWithRewardStateModule (ref)
	return if p2.type == setPlayWithRewardStateModule.name then {
		flowId = p2.flowId,
		universeId = p2.universeId,
		isAdDataExpected = p2.isAdDataExpected,
		adData = p2.adData
	} else p1 or table.clone(t)
end