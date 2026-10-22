local Parent = script:FindFirstAncestor("BuildExperience").Parent
local SignalsReactModule = require(Parent.SignalsReact)
local ExperienceAnalyticsModule = require(Parent.DataHydration.ExperienceAnalytics)
local t = {}

return function(p1)
	-- upvalues: ExperienceAnalyticsModule (copy), SignalsReactModule (copy), t (copy)
	local AndFetchGoalMilestones = ExperienceAnalyticsModule.getGoalMilestonesStore(false).getAndFetchGoalMilestones(p1)
	local UseSignalStateResult = SignalsReactModule.useSignalState(AndFetchGoalMilestones.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(AndFetchGoalMilestones.status)
	
	return UseSignalStateResult or t, UseSignalStateResult ~= nil or UseSignalStateResult1 == "Failed"
end