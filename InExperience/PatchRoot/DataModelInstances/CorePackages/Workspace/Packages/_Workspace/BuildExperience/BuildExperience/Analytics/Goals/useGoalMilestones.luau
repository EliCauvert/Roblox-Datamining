local Parent = script:FindFirstAncestor("BuildExperience").Parent
local SignalsReactModule = require(Parent.SignalsReact)
local ExperienceAnalyticsModule = require(Parent.DataHydration.ExperienceAnalytics)
local t = {}

return function(p1)
	-- upvalues: ExperienceAnalyticsModule (copy), SignalsReactModule (copy), t (copy)
	return SignalsReactModule.useSignalState(ExperienceAnalyticsModule.getGoalMilestonesStore(false).getAndFetchGoalMilestones(p1).data) or t
end