local UserInputService = game:GetService("UserInputService")
local InExperienceCloudPlay = script:FindFirstAncestor("InExperienceCloudPlay")
local TelemetryService = require(InExperienceCloudPlay.Parent.MockableProxyServices).TelemetryService
local GetCloudClientServiceModule = require(InExperienceCloudPlay.getCloudClientService)
local LastUpdated = { 2026, 11, 13 }
local config = {
	WeakConnectionSnackbarShown = {
		eventName = "coreui_cloudplay_weak_connection_snackbar_shown",
		description = "Weak connection snackbar shown during a Cloud Play or Restyle stream",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/5408458399/Core+UI+support+for+Cloud+Streaming+Restyle",
		backends = { "EventIngest" },
		throttlingPercentage = game:DefineFastInt("CloudPlayWeakConnectionSnackbarShownThrottleHundredthsPercent", 10000),
		lastUpdated = LastUpdated
	},
	DisconnectDialogShown = {
		eventName = "coreui_cloudplay_disconnect_dialog_shown",
		description = "Dialog shown after a Cloud Play or Restyle stream ends unexpectedly or runs out of time",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/5408458399/Core+UI+support+for+Cloud+Streaming+Restyle",
		backends = { "EventIngest" },
		throttlingPercentage = game:DefineFastInt("CloudPlayDisconnectDialogShownThrottleHundredthsPercent", 10000),
		lastUpdated = LastUpdated
	},
	DisconnectDialogAction = {
		eventName = "coreui_cloudplay_disconnect_dialog_action",
		description = "Action taken on the Cloud Play or Restyle disconnect dialog, action can be play or leave",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/5408458399/Core+UI+support+for+Cloud+Streaming+Restyle",
		backends = { "EventIngest" },
		throttlingPercentage = game:DefineFastInt("CloudPlayDisconnectDialogActionThrottleHundredthsPercent", 10000),
		lastUpdated = LastUpdated
	},
	JoinWithoutCloudPlayActions = {
		eventName = "coreui_cloudplay_join_without_cloudplay_actions",
		description = "User chose whether to leave Cloud Play and join the experience locally",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/5408458399/Core+UI+support+for+Cloud+Streaming+Restyle",
		backends = { "EventIngest" },
		throttlingPercentage = game:DefineFastInt("CloudPlayJoinWithoutCloudPlayActionsThrottleHundredthsPercent", 10000),
		lastUpdated = LastUpdated
	},
	UnsuccessfulJoinSnackbarShown = {
		eventName = "coreui_cloudplay_unsuccessful_join_snackbar_shown",
		description = "Snackbar shown in a locally launched experience after Cloud Play or Restyle failed to start",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/5408458399/Core+UI+support+for+Cloud+Streaming+Restyle",
		backends = { "EventIngest" },
		throttlingPercentage = game:DefineFastInt("CloudPlayUnsuccessfulJoinSnackbarShownThrottleHundredthsPercent", 10000),
		lastUpdated = LastUpdated
	},
	UnsupportedFeatureShown = {
		eventName = "coreui_cloudplay_unsupported_feature_shown",
		description = "User reached a feature that is unavailable on the Cloud Client, feature can be gallery, capture, or self_view",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/5408458399/Core+UI+support+for+Cloud+Streaming+Restyle",
		backends = { "EventIngest" },
		throttlingPercentage = game:DefineFastInt("CloudPlayUnsupportedFeatureShownThrottleHundredthsPercent", 10000),
		lastUpdated = LastUpdated
	},
	RestyleChipShown = {
		eventName = "coreui_restyle_chip_shown",
		description = "Restyle TopBar chip shown for the first time in a Restyle session",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/5408458399/Core+UI+support+for+Cloud+Streaming+Restyle",
		backends = { "EventIngest" },
		throttlingPercentage = game:DefineFastInt("RestyleChipShownThrottleHundredthsPercent", 10000),
		lastUpdated = LastUpdated
	},
	RestylePopoverOpen = {
		eventName = "coreui_restyle_popover_open",
		description = "Restyle TopBar popover opened",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/5408458399/Core+UI+support+for+Cloud+Streaming+Restyle",
		backends = { "EventIngest" },
		throttlingPercentage = game:DefineFastInt("RestylePopoverOpenThrottleHundredthsPercent", 10000),
		lastUpdated = LastUpdated
	},
	RestylePopoverClose = {
		eventName = "coreui_restyle_popover_close",
		description = "Restyle TopBar popover closed, source can be chip, outside, or hidden",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/5408458399/Core+UI+support+for+Cloud+Streaming+Restyle",
		backends = { "EventIngest" },
		throttlingPercentage = game:DefineFastInt("RestylePopoverCloseThrottleHundredthsPercent", 10000),
		lastUpdated = LastUpdated
	},
	RestyleToggle = {
		eventName = "coreui_restyle_toggle",
		description = "Restyle filter toggled on or off from the TopBar popover",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/5408458399/Core+UI+support+for+Cloud+Streaming+Restyle",
		backends = { "EventIngest" },
		throttlingPercentage = game:DefineFastInt("RestyleToggleThrottleHundredthsPercent", 10000),
		lastUpdated = LastUpdated
	},
	RestyleSessionSummary = {
		eventName = "coreui_restyle_session_summary",
		description = "Sent once per Restyle session when the timer reaches zero or the Restyle chip unmounts",
		links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/5408458399/Core+UI+support+for+Cloud+Streaming+Restyle",
		backends = { "EventIngest" },
		throttlingPercentage = game:DefineFastInt("RestyleSessionSummaryThrottleHundredthsPercent", 10000),
		lastUpdated = LastUpdated
	}
}
local StandardizedFields = { "addPlaySessionId", "addSessionInfo" }

local function getCloudClientContext()
	-- upvalues: GetCloudClientServiceModule (copy)
	local CloudClientServiceModule = GetCloudClientServiceModule()
	local IsRobloxRealityEnvironment = CloudClientServiceModule ~= nil and CloudClientServiceModule.IsRobloxRealityEnvironment
	
	return {
		placeId = game.PlaceId,
		universeId = game.GameId,
		sessionType = if IsRobloxRealityEnvironment then "restyle" else "cloud",
		isRestyleActive = if CloudClientServiceModule and IsRobloxRealityEnvironment then CloudClientServiceModule.RobloxRealityFilterEnabled else false,
		sessionElapsedSeconds = if CloudClientServiceModule and CloudClientServiceModule.IsCloudClient then CloudClientServiceModule:GetSessionElapsedTime() else nil
	}
end

local function getRestyleTimeFields()
	-- upvalues: GetCloudClientServiceModule (copy)
	local CloudClientServiceModule = GetCloudClientServiceModule()
	
	return if CloudClientServiceModule and CloudClientServiceModule.SessionTimeLimit > 0 then {
		session_time_limit_seconds = math.floor(CloudClientServiceModule.SessionTimeLimit),
		time_remaining_seconds = math.max(0, (math.ceil(CloudClientServiceModule.SessionTimeLimit - CloudClientServiceModule:GetSessionElapsedTime())))
	} else {}
end

local function logEvent(DisconnectDialogAction, CloudClientContext, Tbl)
	-- upvalues: TelemetryService (copy), StandardizedFields (copy)
	local Copy = table.clone(Tbl)
	
	if CloudClientContext then
		Copy.place_id = if CloudClientContext.placeId then tonumber(CloudClientContext.placeId) else nil
		Copy.universe_id = if CloudClientContext.universeId then tonumber(CloudClientContext.universeId) else nil
		Copy.session_type = CloudClientContext.sessionType
		Copy.is_restyle_active = CloudClientContext.isRestyleActive
		Copy.session_elapsed_seconds = if CloudClientContext.sessionElapsedSeconds then math.floor(CloudClientContext.sessionElapsedSeconds) else nil
	end
	TelemetryService:LogEvent(DisconnectDialogAction, {
		standardizedFields = StandardizedFields,
		customFields = Copy
	})
end

local function _(p1, List)
	-- upvalues: getRestyleTimeFields (copy), logEvent (copy), getCloudClientContext (copy)
	local RestyleTimeFields = getRestyleTimeFields()
	
	for i, value in List do
		RestyleTimeFields[i] = value
	end
	logEvent(p1, getCloudClientContext(), RestyleTimeFields)
end

return {
	getCloudClientContext = getCloudClientContext,
	logWeakConnectionSnackbarShown = function(p2, Stage, Weak_duration_seconds)
		-- upvalues: logEvent (copy), config (copy)
		logEvent(config.WeakConnectionSnackbarShown, p2, {
			stage = Stage,
			weak_duration_seconds = Weak_duration_seconds
		})
	end,
	logDisconnectDialogShown = function(p2, Dialog_type, Disconnect_reason)
		-- upvalues: logEvent (copy), config (copy)
		logEvent(config.DisconnectDialogShown, p2, {
			dialog_type = Dialog_type,
			disconnect_reason = Disconnect_reason
		})
	end,
	logDisconnectDialogAction = function(p2, Dialog_type, Action)
		-- upvalues: logEvent (copy), config (copy)
		logEvent(config.DisconnectDialogAction, p2, { dialog_type = Dialog_type, action = Action })
	end,
	logJoinWithoutCloudPlayAction = function(p2, Action_type)
		-- upvalues: logEvent (copy), config (copy)
		logEvent(config.JoinWithoutCloudPlayActions, p2, { action_type = Action_type })
	end,
	logUnsuccessfulJoinSnackbarShown = function(SessionType, Reason)
		-- upvalues: logEvent (copy), config (copy)
		logEvent(config.UnsuccessfulJoinSnackbarShown, {
			placeId = game.PlaceId,
			universeId = game.GameId,
			sessionType = SessionType,
			isRestyleActive = SessionType ~= "cloud" and nil
		}, { reason = Reason })
	end,
	logUnsupportedFeatureShown = function(Feature)
		-- upvalues: logEvent (copy), config (copy), getCloudClientContext (copy)
		logEvent(config.UnsupportedFeatureShown, getCloudClientContext(), { feature = Feature })
	end,
	logRestyleChipShown = function()
		-- upvalues: config (copy), getRestyleTimeFields (copy), logEvent (copy), getCloudClientContext (copy)
		local RestyleChipShown = config.RestyleChipShown
		local RestyleTimeFields = getRestyleTimeFields()
		
		for i, value in {} do
			RestyleTimeFields[i] = value
		end
		logEvent(RestyleChipShown, getCloudClientContext(), RestyleTimeFields)
	end,
	logRestylePopoverOpened = function()
		-- upvalues: config (copy), UserInputService (copy), getRestyleTimeFields (copy), logEvent (copy), getCloudClientContext (copy)
		local RestylePopoverOpen = config.RestylePopoverOpen
		local config1 = { input_type = UserInputService:GetLastInputType().Name }
		local RestyleTimeFields = getRestyleTimeFields()
		
		for i, value in config1 do
			RestyleTimeFields[i] = value
		end
		logEvent(RestylePopoverOpen, getCloudClientContext(), RestyleTimeFields)
	end,
	logRestylePopoverClosed = function(Source, Value: number)
		-- upvalues: config (copy), getRestyleTimeFields (copy), logEvent (copy), getCloudClientContext (copy)
		local RestylePopoverClose = config.RestylePopoverClose
		local config1 = { source = Source, open_duration_ms = math.floor(Value) }
		local RestyleTimeFields = getRestyleTimeFields()
		
		for i, value in config1 do
			RestyleTimeFields[i] = value
		end
		logEvent(RestylePopoverClose, getCloudClientContext(), RestyleTimeFields)
	end,
	logRestyleToggled = function(Enabled, Toggle_count_in_session)
		-- upvalues: config (copy), getRestyleTimeFields (copy), logEvent (copy), getCloudClientContext (copy)
		local RestyleToggle = config.RestyleToggle
		local config1 = {
			enabled = Enabled,
			toggle_count_in_session = Toggle_count_in_session
		}
		local RestyleTimeFields = getRestyleTimeFields()
		
		for i, value in config1 do
			RestyleTimeFields[i] = value
		end
		logEvent(RestyleToggle, getCloudClientContext(), RestyleTimeFields)
	end,
	logRestyleSessionSummary = function(p2)
		-- upvalues: config (copy), getRestyleTimeFields (copy), logEvent (copy), getCloudClientContext (copy)
		local RestyleSessionSummary = config.RestyleSessionSummary
		local config1 = {
			end_reason = p2.endReason,
			filter_enabled_at_end = p2.filterEnabledAtEnd,
			seconds_with_filter_off = math.floor(p2.secondsWithFilterOff),
			toggle_count = p2.toggleCount,
			popover_open_count = p2.popoverOpenCount
		}
		local RestyleTimeFields = getRestyleTimeFields()
		
		for i, value in config1 do
			RestyleTimeFields[i] = value
		end
		logEvent(RestyleSessionSummary, getCloudClientContext(), RestyleTimeFields)
	end
}