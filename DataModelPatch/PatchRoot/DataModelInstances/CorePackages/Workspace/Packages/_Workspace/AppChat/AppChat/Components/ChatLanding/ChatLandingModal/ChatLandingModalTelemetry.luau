local AppChat = script:FindFirstAncestor("AppChat")
local SocialLuaAnalyticsModule = require(AppChat.Parent.SocialLuaAnalytics)
local _ = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local TelemetryModule = require(AppChat.Telemetry.Telemetry)
local ModalTelemetryModule = require(AppChat.Components.ModalTelemetry)
local DefaultTelemetryEventsModule = require(AppChat.Telemetry.DefaultTelemetryEvents)

local function _(Format)
	-- upvalues: SocialLuaAnalyticsModule (copy), DefaultTelemetryEventsModule (copy)
	return {
		overrideName = nil,
		throttlingThousandths = nil,
		type = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.EventIngest,
		standardizedFields = DefaultTelemetryEventsModule.STANDARDIZED_FIELDS,
		format = Format
	}
end

local ChatLandingModalTelemetryModule = {
	Constants = {
		FaeModalShownField = "fae",
		ConfirmFaeBtn = "confirmFae",
		CancelFaeBtn = "cancelFae",
		EventStreamCtx = SocialLuaAnalyticsModule.Analytics.Enums.Contexts.Party
	}
}
ChatLandingModalTelemetryModule.Events = {
	FaeModalShown = TelemetryModule.new({
		name = "authModalShown",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			DefaultTelemetryEventsModule.namedCounterConfigurationNoEmittedInfo("AppChat.ChatLandingModal.FaeModal.Shown"),
			{
				overrideName = nil,
				throttlingThousandths = nil,
				type = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.EventIngest,
				standardizedFields = DefaultTelemetryEventsModule.STANDARDIZED_FIELDS,
				format = function(_, _)
					-- upvalues: ChatLandingModalTelemetryModule (copy)
					return {
						field = ChatLandingModalTelemetryModule.Constants.FaeModalShownField,
						os_time = os.time(),
						os_clock = os.clock()
					}
				end
			}
		},
		eventStreamCtx = ChatLandingModalTelemetryModule.Constants.EventStreamCtx
	}),
	TelemetryFaeButtonClick = TelemetryModule.new({
		name = "authButtonClick",
		description = "",
		lastUpdated = { 2026, 1, 27 },
		backendsList = {
			DefaultTelemetryEventsModule.namedCounterConfigurationAndFormat("AppChat.ChatLandingModal.FaeButton.Click", function(p1)
				return { btn = p1.btn }
			end),
			{
				overrideName = nil,
				throttlingThousandths = nil,
				type = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends.EventIngest,
				standardizedFields = DefaultTelemetryEventsModule.STANDARDIZED_FIELDS,
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
		eventStreamCtx = ChatLandingModalTelemetryModule.Constants.EventStreamCtx
	}),
	ModalRendered = ModalTelemetryModule.Events.modalRenderedWithSequence({
		modalSequence = ModalTelemetryModule.Enums.ModalSequence.ChatLandingModal,
		counterFormat = function(p1, _)
			return { modalVariant = p1.modalVariant }
		end
	}),
	ModalAction = ModalTelemetryModule.Events.modalActionWithSequence({
		modalSequence = ModalTelemetryModule.Enums.ModalSequence.ChatLandingModal,
		counterFormat = function(p1, _)
			return { modalVariant = p1.modalVariant, action = p1.action }
		end
	}),
	ModalActionResult = ModalTelemetryModule.Events.modalActionResultWithSequence({
		modalSequence = ModalTelemetryModule.Enums.ModalSequence.ChatLandingModal,
		counterFormat = function(p1, _)
			return {
				modalVariant = p1.modalVariant,
				action = p1.action,
				actionResult = p1.actionResult
			}
		end
	})
}

return ChatLandingModalTelemetryModule