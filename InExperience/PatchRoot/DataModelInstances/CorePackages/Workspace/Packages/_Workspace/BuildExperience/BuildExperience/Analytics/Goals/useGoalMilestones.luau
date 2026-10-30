local Parent = script:FindFirstAncestor("BuildExperience").Parent
local SignalsReactModule = require(Parent.SignalsReact)
local CreatorAnalyticsModule = require(Parent.DataHydration.CreatorAnalytics)
local t = {}

return function(p1)
	-- upvalues: CreatorAnalyticsModule (copy), SignalsReactModule (copy), t (copy)
	local AndFetchGoalMilestones = CreatorAnalyticsModule.getGoalMilestonesStore(false).getAndFetchGoalMilestones(p1)
	local UseSignalStateResult = SignalsReactModule.useSignalState(AndFetchGoalMilestones.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(AndFetchGoalMilestones.status)
	
	return UseSignalStateResult or t, UseSignalStateResult ~= nil or UseSignalStateResult1 == "Failed"
end