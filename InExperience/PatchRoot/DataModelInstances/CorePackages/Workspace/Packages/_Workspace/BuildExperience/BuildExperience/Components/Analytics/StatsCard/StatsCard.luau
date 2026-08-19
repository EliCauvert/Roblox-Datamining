local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local statsCardViewModule = require(script.Parent.StatsCardView)
local useStatsCardViewModelModule = require(script.Parent.useStatsCardViewModel)

return function(p0) --[[ line: 11 | named "StatsCard" ]]
	-- upvalues: useStatsCardViewModelModule (ref), reactModule (ref), statsCardViewModule (ref)
	return reactModule.createElement(statsCardViewModule, useStatsCardViewModelModule(p0))
end