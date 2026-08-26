local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local statsCardViewModule = require(script.Parent.StatsCardView)
local useStatsCardViewModelModule = require(script.Parent.useStatsCardViewModel)

return function(p1)
	-- upvalues: useStatsCardViewModelModule (ref), reactModule (ref), statsCardViewModule (ref)
	return reactModule.createElement(statsCardViewModule, useStatsCardViewModelModule(p1))
end