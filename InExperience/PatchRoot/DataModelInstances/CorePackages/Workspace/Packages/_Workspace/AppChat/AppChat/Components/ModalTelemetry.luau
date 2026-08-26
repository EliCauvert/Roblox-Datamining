local appChat = script:FindFirstAncestor("AppChat")
local _ = require(appChat.types)
local parent = appChat.Parent
local _ = require(parent.SocialLuaAnalytics)
local _ = require(parent.AppChatNetworking)
local telemetryModule = require(appChat.Telemetry.Telemetry)
local defaultTelemetryEventsModule = require(appChat.Telemetry.DefaultTelemetryEvents)
local namedCounterConfigurationAndFormat = defaultTelemetryEventsModule.namedCounterConfigurationAndFormat
local eventIngestWithFormatFunction = defaultTelemetryEventsModule.eventIngestWithFormatFunction
local cryoModule = require(parent.Cryo)
local t = {}

local function eventIngestWithModalFormatFunction(p1, p2)
	-- upvalues: cryoModule (ref), eventIngestWithFormatFunction (ref)
	return eventIngestWithFormatFunction(function(p3, p4)
		-- upvalues: p1 (ref), cryoModule (copy), p2 (ref)
		return cryoModule.Dictionary.join({ modalSequence = p2 }, p1(p3, p4))
	end)
end

t.Events = {
	modalRenderedWithSequence = function(p1)
		-- upvalues: namedCounterConfigurationAndFormat (ref), eventIngestWithModalFormatFunction (ref), telemetryModule (ref)
		local t = {}
		local counterFormat = p1.counterFormat
		local eventStreamFormat = p1.eventStreamFormat
		
		if counterFormat then
			table.insert(t, namedCounterConfigurationAndFormat(`AppChat.Modal.{p1.modalSequence}.Rendered`, counterFormat))
		end
		if eventStreamFormat then
			table.insert(t, eventIngestWithModalFormatFunction(eventStreamFormat, p1.modalSequence))
		end
		return telemetryModule.new({
			name = "appChatModalRendered",
			description = "",
			lastUpdated = { 2025, 9, 8 },
			backendsList = t
		})
	end,
	modalActionWithSequence = function(p1)
		-- upvalues: namedCounterConfigurationAndFormat (ref), eventIngestWithModalFormatFunction (ref), telemetryModule (ref)
		local t = {}
		local counterFormat = p1.counterFormat
		local eventStreamFormat = p1.eventStreamFormat
		
		if counterFormat then
			table.insert(t, namedCounterConfigurationAndFormat(`AppChat.Modal.{p1.modalSequence}.Action`, counterFormat))
		end
		if eventStreamFormat then
			table.insert(t, eventIngestWithModalFormatFunction(eventStreamFormat, p1.modalSequence))
		end
		return telemetryModule.new({
			name = "appChatModalAction",
			description = "",
			lastUpdated = { 2025, 9, 8 },
			backendsList = t
		})
	end,
	modalActionResultWithSequence = function(p1)
		-- upvalues: namedCounterConfigurationAndFormat (ref), eventIngestWithModalFormatFunction (ref), telemetryModule (ref)
		local t = {}
		local counterFormat = p1.counterFormat
		local eventStreamFormat = p1.eventStreamFormat
		
		if counterFormat then
			table.insert(t, namedCounterConfigurationAndFormat(`AppChat.Modal.{p1.modalSequence}.ActionResult`, counterFormat))
		end
		if eventStreamFormat then
			table.insert(t, eventIngestWithModalFormatFunction(eventStreamFormat, p1.modalSequence))
		end
		return telemetryModule.new({
			name = "appChatModalActionResult",
			description = "",
			lastUpdated = { 2025, 9, 8 },
			backendsList = t
		})
	end
}
t.Enums = {
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

return t