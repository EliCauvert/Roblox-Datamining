local telemetryService = game:GetService("TelemetryService")
local whatsNew = script:FindFirstAncestor("WhatsNew")
local _ = require(whatsNew.Types)
local eventIngest = require(whatsNew.Parent.LoggingProtocol).TelemetryBackends.EventIngest
local whatsNewTelemetryThrottleHundredthsPercent = game:DefineFastInt("WhatsNewTelemetryThrottleHundredthsPercent", 10000)
local t = { IMPRESSION = 1, CLICK = 2, DISMISS = 3, SKIP = 4 }
local t_1 = { NEXT = 1, BACK = 2, CLOSE = 3 }
local t_2 = { TOUR_ENDED_EARLY = 1 }
local t_3 = { TOUR_STARTED = 1, TOUR_COMPLETED = 2, TOUR_STOPPED = 3 }
local t_4 = { DISMISS = 1, ABORT = 2 }
local t_5 = { ROOT = 1, GATEWAY = 2, IDLE = 3 }
local t_6 = {
	tourtipInteraction = {
		eventName = "whatsNewTourtipInteraction",
		description = "Fires for tourtip impressions, clicks, dismissals, and skipped steps",
		links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/coreui/whatsnew/tourtip_interaction.proto",
		backends = { eventIngest },
		throttlingPercentage = whatsNewTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2026, 7, 6 }
	},
	tourLifecycle = {
		eventName = "whatsNewTourLifecycle",
		description = "Fires for tour session lifecycle transitions",
		links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/coreui/whatsnew/tour_lifecycle.proto",
		backends = { eventIngest },
		throttlingPercentage = whatsNewTelemetryThrottleHundredthsPercent,
		lastUpdated = { 2026, 7, 6 }
	}
}
local _ = {
	placeId = "addPlaceId",
	universeId = "addUniverseId",
	playsessionId = "addPlaySessionId"
}
local list = { "addPlaceId", "addUniverseId", "addPlaySessionId" }
local t_7 = {
	Events = t_6,
	InteractionType = t,
	Button = t_1,
	SkipReason = t_2,
	LifecycleType = t_3,
	StopReason = t_4,
	StartContext = t_5,
	buildTourSessionFields = function(p1)
		local currentScopeTour = p1.currentScopeTour
		
		return {
			screen_scope_id = p1.screenScopeId,
			scope_id = if currentScopeTour ~= nil then nil else currentScopeTour.id,
			root_array = p1.activeTourType,
			global_step_index = p1.globalStepIndex,
			global_total_steps = p1.globalTotalSteps
		}
	end
}

function t_7.logTourtipInteraction(p1, p2, p3, p4, p5)
	-- upvalues: t_7 (ref), telemetryService (ref), t_6 (ref), list (ref)
	local var1 = t_7.buildTourSessionFields(p4)
	var1.entry_id = p2
	var1.interaction_type = p1
	var1.button = p3
	local currentEntry = p4.currentEntry
	
	if currentEntry ~= nil and p2 == currentEntry.id then
		var1.is_gateway = currentEntry.gateway ~= nil
	end
	if p5 ~= nil then
		var1.skip_reason = p5
	end
	telemetryService:LogEvent(t_6.tourtipInteraction, { standardizedFields = list, customFields = var1 })
end

function t_7.logTourLifecycle(p1, p2, p3, p4)
	-- upvalues: t_7 (ref), telemetryService (ref), t_6 (ref), list (ref)
	local var1 = t_7.buildTourSessionFields(p2)
	var1.lifecycle_type = p1
	
	if p3 ~= nil then
		var1.stop_reason = p3
	end
	if p4 ~= nil then
		var1.start_context = p4
	end
	telemetryService:LogEvent(t_6.tourLifecycle, { standardizedFields = list, customFields = var1 })
end

return t_7