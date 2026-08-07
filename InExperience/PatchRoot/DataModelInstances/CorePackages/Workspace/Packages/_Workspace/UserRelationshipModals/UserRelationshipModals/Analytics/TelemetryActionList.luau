local socialLuaAnalyticsModule = require(script:FindFirstAncestor("UserRelationshipModals").Parent.SocialLuaAnalytics)
local supportedTelemetryBackends = socialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local eventTypes = socialLuaAnalyticsModule.Analytics.Enums.EventTypes
local contexts = socialLuaAnalyticsModule.Analytics.Enums.Contexts
local eventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("UserRelationshipModalsAnalyticsThrottlingThousandths", 10000)
	},
	[eventNamesModule.ModalSeen] = {
		description = "Userrelationshipsmodal was opened",
		lastUpdated = { 26, 4, 16 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter },
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 24 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = contexts.UserRelationshipModals,
					placeId = game.PlaceId
				}
			}
		}
	},
	[eventNamesModule.ModalClosed] = {
		description = "User-relationship-modal was closed without changing the user relationship",
		lastUpdated = { 26, 4, 16 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter },
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 43 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					btn = "Close",
					eventContext = contexts.UserRelationshipModals,
					placeId = game.PlaceId
				}
			}
		}
	},
	[eventNamesModule.CreateActionPressed] = {
		description = "User pressed on the create action button on a user-relationship-modal",
		lastUpdated = { 26, 4, 16 },
		backendsList = {
			{ type = supportedTelemetryBackends.RobloxTelemetryCounter },
			{
				type = supportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ line: 63 ]]
					-- upvalues: eventTypes (ref)
					return eventTypes.ButtonClick
				end,
				staticCustomFields = {
					btn = "Create",
					eventContext = contexts.UserRelationshipModals,
					placeId = game.PlaceId
				}
			}
		}
	}
}