local AppChat = script:FindFirstAncestor("AppChat")
local _ = require(AppChat.types)
local Parent = AppChat.Parent
local _ = require(Parent.SocialLuaAnalytics)
local _ = require(Parent.AppChatNetworking)
local TelemetryModule = require(AppChat.Telemetry.Telemetry)
local DefaultTelemetryEventsModule = require(AppChat.Telemetry.DefaultTelemetryEvents)
local NamedCounterConfigurationAndFormatFunction = DefaultTelemetryEventsModule.namedCounterConfigurationAndFormat
local EventIngestWithFormatFunctionFunction = DefaultTelemetryEventsModule.eventIngestWithFormatFunction
local CryoModule = require(Parent.Cryo)

local function eventIngestWithModalFormatFunction(Callback, ModalSequence) --[[ Line: 37 ]]
	-- upvalues: CryoModule (copy), EventIngestWithFormatFunctionFunction (copy)
	return EventIngestWithFormatFunctionFunction(function(p1, p2) --[[ Line: 38 ]]
		-- upvalues: Callback (copy), CryoModule (upval), ModalSequence (copy)
		return CryoModule.Dictionary.join({ modalSequence = ModalSequence }, (Callback(p1, p2)))
	end)
end

return {
	Events = {
		modalRenderedWithSequence = function(p1) --[[ Line: 48 ]]
			-- upvalues: NamedCounterConfigurationAndFormatFunction (copy), eventIngestWithModalFormatFunction (copy), TelemetryModule (copy)
			local List = {}
			local CounterFormat = p1.counterFormat
			local EventStreamFormat = p1.eventStreamFormat
			
			if CounterFormat then
				table.insert(List, NamedCounterConfigurationAndFormatFunction(`AppChat.Modal.{p1.modalSequence}.Rendered`, CounterFormat))
			end
			if EventStreamFormat then
				table.insert(List, eventIngestWithModalFormatFunction(EventStreamFormat, p1.modalSequence))
			end
			return (TelemetryModule.new({
				name = "appChatModalRendered",
				description = "",
				lastUpdated = { 2025, 9, 8 },
				backendsList = List
			}))
		end,
		modalActionWithSequence = function(p1) --[[ Line: 79 ]]
			-- upvalues: NamedCounterConfigurationAndFormatFunction (copy), eventIngestWithModalFormatFunction (copy), TelemetryModule (copy)
			local List = {}
			local CounterFormat = p1.counterFormat
			local EventStreamFormat = p1.eventStreamFormat
			
			if CounterFormat then
				table.insert(List, NamedCounterConfigurationAndFormatFunction(`AppChat.Modal.{p1.modalSequence}.Action`, CounterFormat))
			end
			if EventStreamFormat then
				table.insert(List, eventIngestWithModalFormatFunction(EventStreamFormat, p1.modalSequence))
			end
			return (TelemetryModule.new({
				name = "appChatModalAction",
				description = "",
				lastUpdated = { 2025, 9, 8 },
				backendsList = List
			}))
		end,
		modalActionResultWithSequence = function(p1) --[[ Line: 113 ]]
			-- upvalues: NamedCounterConfigurationAndFormatFunction (copy), eventIngestWithModalFormatFunction (copy), TelemetryModule (copy)
			local List = {}
			local CounterFormat = p1.counterFormat
			local EventStreamFormat = p1.eventStreamFormat
			
			if CounterFormat then
				table.insert(List, NamedCounterConfigurationAndFormatFunction(`AppChat.Modal.{p1.modalSequence}.ActionResult`, CounterFormat))
			end
			if EventStreamFormat then
				table.insert(List, eventIngestWithModalFormatFunction(EventStreamFormat, p1.modalSequence))
			end
			return (TelemetryModule.new({
				name = "appChatModalActionResult",
				description = "",
				lastUpdated = { 2025, 9, 8 },
				backendsList = List
			}))
		end
	},
	Enums = {
		ModalActions = {
			PrimaryCta = "primaryCta",
			SecondaryCta = "secondaryCta",
			Dismiss = "dismiss",
			InlineCta = "inlineCta"
		},
		ModalActionResults = { Success = "success", Failure = "failure" },
		ModalSequence = {
			ChatLandingModal = "ChatLandingModal",
			ConversationOverlay = "ConversationOverlay",
			ConversationTopModal = "ConversationTopModal",
			ConversationListOverlay = "ConversationListOverlay"
		}
	}
}