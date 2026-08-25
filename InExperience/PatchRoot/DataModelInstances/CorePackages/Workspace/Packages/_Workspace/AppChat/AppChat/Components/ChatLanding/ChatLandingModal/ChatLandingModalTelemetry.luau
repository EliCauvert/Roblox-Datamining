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

local function _(p0)
	-- upvalues: socialLuaAnalyticsModule (ref), defaultTelemetryEventsModule (ref)
	return {
		overrideName = nil,
		throttlingThousandths = nil,
		type = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.EventIngest,
		standardizedFields = defaultTelemetryEventsModule.STANDARDIZED_FIELDS,
		format = p0
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
				format = function(p2, _)
					return {
						state = p2.state,
						btn = p2.btn,
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
		counterFormat = function(p3, _)
			return { modalVariant = p3.modalVariant }
		end
	}),
	ModalAction = modalTelemetryModule.Events.modalActionWithSequence({
		modalSequence = modalTelemetryModule.Enums.ModalSequence.ChatLandingModal,
		counterFormat = function(p4, _)
			return { modalVariant = p4.modalVariant, action = p4.action }
		end
	}),
	ModalActionResult = modalTelemetryModule.Events.modalActionResultWithSequence({
		modalSequence = modalTelemetryModule.Enums.ModalSequence.ChatLandingModal,
		counterFormat = function(p5, _)
			return {
				modalVariant = p5.modalVariant,
				action = p5.action,
				actionResult = p5.actionResult
			}
		end
	})
}

return t