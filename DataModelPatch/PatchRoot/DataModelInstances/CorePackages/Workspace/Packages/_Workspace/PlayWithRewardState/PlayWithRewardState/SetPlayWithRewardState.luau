local PlayWithRewardState = script:FindFirstAncestor("PlayWithRewardState")
local _ = require(PlayWithRewardState.PlayWithRewardAdData)

return require(PlayWithRewardState.Parent.Rodux).makeActionCreator(script.Name, function(FlowId, UniverseId, IsAdDataExpected, AdData)
	return {
		flowId = FlowId,
		universeId = UniverseId,
		isAdDataExpected = IsAdDataExpected,
		adData = AdData
	}
end)