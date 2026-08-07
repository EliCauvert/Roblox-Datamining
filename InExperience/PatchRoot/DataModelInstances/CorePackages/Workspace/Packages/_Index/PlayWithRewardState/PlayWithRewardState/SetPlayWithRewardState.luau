local playWithRewardState = script:FindFirstAncestor("PlayWithRewardState")
local _ = require(playWithRewardState.PlayWithRewardAdData)

return require(playWithRewardState.Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2, p3) --[[ line: 11 ]]
	return {
		flowId = p0,
		universeId = p1,
		isAdDataExpected = p2,
		adData = p3
	}
end)