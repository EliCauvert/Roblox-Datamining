local appChat = script:FindFirstAncestor("AppChat")
local socialLuaAnalyticsModule = require(appChat.Parent.SocialLuaAnalytics)
local _ = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local telemetryModule = require(appChat.Telemetry.Telemetry)
local modalTelemetryModule = require(appChat.Components.ModalTelemetry)
local defaultTelemetryEventsModule = require(appChat.Telemetry.DefaultTelemetryEvents)
local t = {
	Constants = {
		FaeModalShownField = "fae",
		ConfirmFaeBtn = "confirmFae",
		CancelFaeBtn = "cancelFae",
		EventStreamCtx = socialLuaAnalyticsModule.Analytics.Enums.Contexts.Party
	}
}

local function _(p1)
	-- upvalues: socialLuaAnalyticsModule (ref), defaultTelemetryEventsModule (ref)
	return {
		overrideName = nil,
		throttlingThousandths = nil,
		type = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.EventIngest,
		standardizedFields = defaultTelemetryEventsModule.STANDARDIZED_FIELDS,
		format = p1
	}
end

t.Events = {
	FaeModalShown = telemetryModule.new({
		name = "authModalShown",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			defaultTelemetryEventsModule.namedCounterConfigurationNoEmittedInfo("AppChat.ChatLandingModal.FaeModal.Shown"),
			{
				overrideName = nil,
				throttlingThousandths = nil,
				type = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.EventIngest,
				standardizedFields = defaultTelemetryEventsModule.STANDARDIZED_FIELDS,
				format = function(_, _)
					-- upvalues: t (ref)
					return {
						field = t.Constants.FaeModalShownField,
						os_time = os.time(),
						os_clock = os.clock()
					}
				end
			}
		},
		eventStreamCtx = t.Constants.EventStreamCtx
	}),
	TelemetryFaeButtonClick = telemetryModule.new({
		name = "authButtonClick",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			defaultTelemetryEventsModule.namedCounterConfigurationAndFormat("AppChat.ChatLandingModal.FaeButton.Click", function(p1)
				return { btn = p1.btn }
			end),
			{
				overrideName = nil,
				throttlingThousandths = nil,
				type = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.EventIngest,
				standardizedFields = defaultTelemetryEventsModule.STANDARDIZED_FIELDS,
				format = function(p1, _)
					return {
						state = p1.state,
						btn = p1.btn,
						os_time = os.time(),
						os_clock = os.clock()
					}
				end
			}
		},
		eventStreamCtx = t.Constants.EventStreamCtx
	}),
	ModalRendered = modalTelemetryModule.Events.modalRenderedWithSequence({
		modalSequence = modalTelemetryModule.Enums.ModalSequence.ChatLandingModal,
		counterFormat = function(p1, _)
			return { modalVariant = p1.modalVariant }
		end
	}),
	ModalAction = modalTelemetryModule.Events.modalActionWithSequence({
		modalSequence = modalTelemetryModule.Enums.ModalSequence.ChatLandingModal,
		counterFormat = function(p1, _)
			return { modalVariant = p1.modalVariant, action = p1.action }
		end
	}),
	ModalActionResult = modalTelemetryModule.Events.modalActionResultWithSequence({
		modalSequence = modalTelemetryModule.Enums.ModalSequence.ChatLandingModal,
		counterFormat = function(p1, _)
			return {
				modalVariant = p1.modalVariant,
				action = p1.action,
				actionResult = p1.actionResult
			}
		end
	})
}

return t