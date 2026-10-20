local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.DataHydration.ExperienceAnalytics)
local _ = require(BuildExperience.Analytics.Goals.GoalTypes)

local function _(p1, p2)
	return p1.requiredMilestone == nil or p2[p1.requiredMilestone]
end

local function withReachedMilestoneItems(p1, Milestones)
	-- upvalues: CryoModule (copy)
	local FilterResult = CryoModule.List.filter(p1.metricSummaries, function(p2)
		-- upvalues: Milestones (copy)
		return p2.requiredMilestone == nil or Milestones[p2.requiredMilestone]
	end)
	local Charts = p1.charts
	local FilterResult1 = if Charts == nil then nil else CryoModule.List.filter(Charts, function(p2)
		-- upvalues: Milestones (copy)
		return p2.requiredMilestone == nil or Milestones[p2.requiredMilestone]
	end)
	
	return if #FilterResult == #p1.metricSummaries and (FilterResult1 == nil or Charts == nil or #FilterResult1 == #Charts) then p1 else CryoModule.Dictionary.join(p1, { metricSummaries = FilterResult, charts = FilterResult1 })
end

return function(p1)
	-- upvalues: withReachedMilestoneItems (copy)
	local List = {}
	local v1 = false
	
	for LayoutOrder, goal in p1.goals do
		local WithReachedMilestoneItemsResult = withReachedMilestoneItems(goal, p1.milestones)
		local V11: boolean = v1 or not p1.milestones[WithReachedMilestoneItemsResult.unlockMilestone]
		local OnActivated: (() -> ())? = nil
		local OnGoalSelectedFunction = p1.onGoalSelected
		
		if OnGoalSelectedFunction ~= nil and WithReachedMilestoneItemsResult.charts ~= nil and #WithReachedMilestoneItemsResult.charts > 0 then
			OnActivated = function()
				-- upvalues: OnGoalSelectedFunction (copy), WithReachedMilestoneItemsResult (copy)
				OnGoalSelectedFunction(WithReachedMilestoneItemsResult)
			end
		end
		table.insert(List, {
			goal = WithReachedMilestoneItemsResult,
			isLocked = V11,
			layoutOrder = LayoutOrder,
			onActivated = OnActivated
		})
		v1 = V11
	end
	return List
end