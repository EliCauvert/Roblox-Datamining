local parent = script:FindFirstAncestor("BuildExperience").Parent
local signalsReactModule = require(parent.SignalsReact)
local experienceAnalyticsModule = require(parent.DataHydration.ExperienceAnalytics)
local t = {}

return function(p1)
	-- upvalues: experienceAnalyticsModule (ref), signalsReactModule (ref), t (ref)
	return signalsReactModule.useSignalState(experienceAnalyticsModule.getGoalMilestonesStore(false).getAndFetchGoalMilestones(p1).data) or t
end