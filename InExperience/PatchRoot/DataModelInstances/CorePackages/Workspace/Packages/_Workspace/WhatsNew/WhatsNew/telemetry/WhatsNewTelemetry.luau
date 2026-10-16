local TelemetryService = game:GetService("TelemetryService")
local WhatsNew = script:FindFirstAncestor("WhatsNew")
local _ = require(WhatsNew.Types)
local EventIngest = require(WhatsNew.Parent.LoggingProtocol).TelemetryBackends.EventIngest
local WhatsNewTelemetryThrottleHundredthsPercent = game:DefineFastInt("WhatsNewTelemetryThrottleHundredthsPercent", 10000)
local Events = {
	tourtipInteraction = {
		eventName = "whatsNewTourtipInteraction",
		description = "Fires for tourtip impressions, clicks, dismissals, and skipped steps",
		links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/coreui/whatsnew/tourtip_interaction.proto",
		backends = { EventIngest },
		throttlingPercentage = WhatsNewTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2026, 7, 6 }
	},
	tourLifecycle = {
		eventName = "whatsNewTourLifecycle",
		description = "Fires for tour session lifecycle transitions",
		links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/coreui/whatsnew/tour_lifecycle.proto",
		backends = { EventIngest },
		throttlingPercentage = WhatsNewTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2026, 7, 6 }
	}
}
local StandardizedFields = { "addPlaceId", "addUniverseId", "addPlaySessionId" }
local WhatsNewTelemetryModule = {
	Events = Events,
	InteractionType = { IMPRESSION = 1, CLICK = 2, DISMISS = 3, SKIP = 4 },
	Button = { NEXT = 1, BACK = 2, CLOSE = 3 },
	SkipReason = { TOUR_ENDED_EARLY = 1 },
	LifecycleType = { TOUR_STARTED = 1, TOUR_COMPLETED = 2, TOUR_STOPPED = 3 },
	StopReason = { DISMISS = 1, ABORT = 2 },
	StartContext = { ROOT = 1, GATEWAY = 2, IDLE = 3 },
	buildTourSessionFields = function(p1) --[[ Line: 122 ]]
		local CurrentScopeTour = p1.currentScopeTour
		
		return {
			screen_scope_id = p1.screenScopeId,
			scope_id = if CurrentScopeTour == nil then nil else CurrentScopeTour.id,
			root_array = p1.activeTourType,
			global_step_index = p1.globalStepIndex,
			global_total_steps = p1.globalTotalSteps
		}
	end
}

function WhatsNewTelemetryModule.logTourtipInteraction(Interaction_type, Entry_id, Button, p1, Skip_reason) --[[ Line: 133 ]]
	-- upvalues: WhatsNewTelemetryModule (copy), TelemetryService (copy), Events (copy), StandardizedFields (copy)
	local TourSessionFields = WhatsNewTelemetryModule.buildTourSessionFields(p1)
	TourSessionFields.entry_id = Entry_id
	TourSessionFields.interaction_type = Interaction_type
	TourSessionFields.button = Button
	local CurrentEntry = p1.currentEntry
	
	if CurrentEntry ~= nil and Entry_id == CurrentEntry.id then
		TourSessionFields.is_gateway = CurrentEntry.gateway ~= nil
	end
	if Skip_reason ~= nil then
		TourSessionFields.skip_reason = Skip_reason
	end
	TelemetryService:LogEvent(Events.tourtipInteraction, {
		standardizedFields = StandardizedFields,
		customFields = TourSessionFields
	})
end

function WhatsNewTelemetryModule.logTourLifecycle(Lifecycle_type, p1, Stop_reason, Start_context) --[[ Line: 160 ]]
	-- upvalues: WhatsNewTelemetryModule (copy), TelemetryService (copy), Events (copy), StandardizedFields (copy)
	local TourSessionFields = WhatsNewTelemetryModule.buildTourSessionFields(p1)
	TourSessionFields.lifecycle_type = Lifecycle_type
	
	if Stop_reason ~= nil then
		TourSessionFields.stop_reason = Stop_reason
	end
	if Start_context ~= nil then
		TourSessionFields.start_context = Start_context
	end
	TelemetryService:LogEvent(Events.tourLifecycle, {
		standardizedFields = StandardizedFields,
		customFields = TourSessionFields
	})
end

return WhatsNewTelemetryModule