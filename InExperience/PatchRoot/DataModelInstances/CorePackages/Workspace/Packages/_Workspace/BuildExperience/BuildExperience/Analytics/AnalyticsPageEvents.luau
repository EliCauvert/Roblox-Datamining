local BuildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local _ = require(BuildExperience.Analytics.Goals.GoalLockedActionId)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)

return {
	goalImpression = function(UniverseId, GoalId, State, WindowId)
		-- upvalues: SendBuildExperienceEventModule (copy)
		SendBuildExperienceEventModule("ANALYTICS_PAGE_GOAL_IMPRESSION", { universeId = UniverseId }, { goalId = GoalId, state = State, windowId = WindowId })
	end,
	goalClick = function(UniverseId, GoalId)
		-- upvalues: SendBuildExperienceEventModule (copy)
		SendBuildExperienceEventModule("ANALYTICS_PAGE_GOAL_CLICK", { universeId = UniverseId }, { goalId = GoalId })
	end,
	goalCtaImpression = function(UniverseId, GoalId, ActionId, Slot)
		-- upvalues: SendBuildExperienceEventModule (copy)
		SendBuildExperienceEventModule("ANALYTICS_PAGE_GOAL_CTA_IMPRESSION", { universeId = UniverseId }, { goalId = GoalId, actionId = ActionId, slot = Slot })
	end,
	goalCtaClick = function(UniverseId, GoalId, ActionId, Slot)
		-- upvalues: SendBuildExperienceEventModule (copy)
		SendBuildExperienceEventModule("ANALYTICS_PAGE_GOAL_CTA_CLICK", { universeId = UniverseId }, { goalId = GoalId, actionId = ActionId, slot = Slot })
	end
}