local BuildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local _ = require(BuildExperience.Analytics.Goals.GoalLockedActionId)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local FFlagBuildExperienceEventContextTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceEventContextTelemetry)

local function _(UniverseId, Granularity)
	return {
		universeId = UniverseId,
		placeId = if Granularity == nil then nil else Granularity.placeId,
		conversationId = if Granularity == nil then nil else Granularity.conversationId
	}
end

return {
	goalImpression = function(UniverseId, GoalId, State, WindowId, Granularity)
		-- upvalues: SendBuildExperienceEventModule (copy), FFlagBuildExperienceEventContextTelemetryModule (copy)
		SendBuildExperienceEventModule("ANALYTICS_PAGE_GOAL_IMPRESSION", if FFlagBuildExperienceEventContextTelemetryModule then {
			universeId = UniverseId,
			placeId = if Granularity == nil then nil else Granularity.placeId,
			conversationId = if Granularity == nil then nil else Granularity.conversationId
		} else { universeId = UniverseId }, { goalId = GoalId, state = State, windowId = WindowId })
	end,
	goalClick = function(UniverseId, GoalId, Granularity)
		-- upvalues: SendBuildExperienceEventModule (copy), FFlagBuildExperienceEventContextTelemetryModule (copy)
		SendBuildExperienceEventModule("ANALYTICS_PAGE_GOAL_CLICK", if FFlagBuildExperienceEventContextTelemetryModule then {
			universeId = UniverseId,
			placeId = if Granularity == nil then nil else Granularity.placeId,
			conversationId = if Granularity == nil then nil else Granularity.conversationId
		} else { universeId = UniverseId }, { goalId = GoalId })
	end,
	goalCtaImpression = function(UniverseId, GoalId, ActionId, Slot, Granularity)
		-- upvalues: SendBuildExperienceEventModule (copy), FFlagBuildExperienceEventContextTelemetryModule (copy)
		SendBuildExperienceEventModule("ANALYTICS_PAGE_GOAL_CTA_IMPRESSION", if FFlagBuildExperienceEventContextTelemetryModule then {
			universeId = UniverseId,
			placeId = if Granularity == nil then nil else Granularity.placeId,
			conversationId = if Granularity == nil then nil else Granularity.conversationId
		} else { universeId = UniverseId }, { goalId = GoalId, actionId = ActionId, slot = Slot })
	end,
	goalCtaClick = function(UniverseId, GoalId, ActionId, Slot, Granularity)
		-- upvalues: SendBuildExperienceEventModule (copy), FFlagBuildExperienceEventContextTelemetryModule (copy)
		SendBuildExperienceEventModule("ANALYTICS_PAGE_GOAL_CTA_CLICK", if FFlagBuildExperienceEventContextTelemetryModule then {
			universeId = UniverseId,
			placeId = if Granularity == nil then nil else Granularity.placeId,
			conversationId = if Granularity == nil then nil else Granularity.conversationId
		} else { universeId = UniverseId }, { goalId = GoalId, actionId = ActionId, slot = Slot })
	end
}