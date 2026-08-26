local playWithRewardState = script:FindFirstAncestor("PlayWithRewardState")
local _ = require(playWithRewardState.PlayWithRewardAdData)

return require(playWithRewardState.Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3, p4)
	return {
		flowId = p1,
		universeId = p2,
		isAdDataExpected = p3,
		adData = p4
	}
end)