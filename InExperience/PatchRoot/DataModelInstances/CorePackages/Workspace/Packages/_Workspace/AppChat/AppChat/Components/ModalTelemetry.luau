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

local function eventIngestWithModalFormatFunction(p0, p1) --[[ line: 37 ]]
	-- upvalues: cryoModule (ref), eventIngestWithFormatFunction (ref)
	return eventIngestWithFormatFunction(function(p2, p3) --[[ line: 38 ]]
		-- upvalues: p0 (ref), cryoModule (copy), p1 (ref)
		return cryoModule.Dictionary.join({ modalSequence = p1 }, p0(p2, p3))
	end)
end

t.Events = {
	modalRenderedWithSequence = function(p4) --[[ line: 48 ]]
		-- upvalues: namedCounterConfigurationAndFormat (ref), eventIngestWithModalFormatFunction (ref), telemetryModule (ref)
		local t = {}
		local counterFormat = p4.counterFormat
		local eventStreamFormat = p4.eventStreamFormat
		
		if counterFormat then
			table.insert(t, namedCounterConfigurationAndFormat(`AppChat.Modal.{p4.modalSequence}.Rendered`, counterFormat))
		end
		if eventStreamFormat then
			table.insert(t, eventIngestWithModalFormatFunction(eventStreamFormat, p4.modalSequence))
		end
		return telemetryModule.new({
			name = "appChatModalRendered",
			description = "",
			lastUpdated = { 2025, 9, 8 },
			backendsList = t
		})
	end,
	modalActionWithSequence = function(p5) --[[ line: 79 ]]
		-- upvalues: namedCounterConfigurationAndFormat (ref), eventIngestWithModalFormatFunction (ref), telemetryModule (ref)
		local t = {}
		local counterFormat = p5.counterFormat
		local eventStreamFormat = p5.eventStreamFormat
		
		if counterFormat then
			table.insert(t, namedCounterConfigurationAndFormat(`AppChat.Modal.{p5.modalSequence}.Action`, counterFormat))
		end
		if eventStreamFormat then
			table.insert(t, eventIngestWithModalFormatFunction(eventStreamFormat, p5.modalSequence))
		end
		return telemetryModule.new({
			name = "appChatModalAction",
			description = "",
			lastUpdated = { 2025, 9, 8 },
			backendsList = t
		})
	end,
	modalActionResultWithSequence = function(p6) --[[ line: 113 ]]
		-- upvalues: namedCounterConfigurationAndFormat (ref), eventIngestWithModalFormatFunction (ref), telemetryModule (ref)
		local t = {}
		local counterFormat = p6.counterFormat
		local eventStreamFormat = p6.eventStreamFormat
		
		if counterFormat then
			table.insert(t, namedCounterConfigurationAndFormat(`AppChat.Modal.{p6.modalSequence}.ActionResult`, counterFormat))
		end
		if eventStreamFormat then
			table.insert(t, eventIngestWithModalFormatFunction(eventStreamFormat, p6.modalSequence))
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