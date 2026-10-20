local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local StatsCardViewModule = require(script.Parent.StatsCardView)
local UseStatsCardViewModelModule = require(script.Parent.useStatsCardViewModel)

return function(p1)
	-- upvalues: UseStatsCardViewModelModule (copy), ReactModule (copy), StatsCardViewModule (copy)
	return ReactModule.createElement(StatsCardViewModule, (UseStatsCardViewModelModule(p1)))
end