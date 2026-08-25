local playWithRewardState = script:FindFirstAncestor("PlayWithRewardState")
local setPlayWithRewardStateModule = require(playWithRewardState.SetPlayWithRewardState)
local _ = require(playWithRewardState.PlayWithRewardAdData)
local t = {
	flowId = "",
	universeId = "",
	isAdDataExpected = false,
	adData = nil
}

return function(p0, p1)
	-- upvalues: t (ref), setPlayWithRewardStateModule (ref)
	return if p1.type == setPlayWithRewardStateModule.name then {
		flowId = p1.flowId,
		universeId = p1.universeId,
		isAdDataExpected = p1.isAdDataExpected,
		adData = p1.adData
	} else p0 or table.clone(t)
end