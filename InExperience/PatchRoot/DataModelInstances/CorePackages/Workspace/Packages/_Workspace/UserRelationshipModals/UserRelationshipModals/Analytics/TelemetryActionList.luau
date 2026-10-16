local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("UserRelationshipModals").Parent.SocialLuaAnalytics)
local SupportedTelemetryBackends = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local EventTypes = SocialLuaAnalyticsModule.Analytics.Enums.EventTypes
local Contexts = SocialLuaAnalyticsModule.Analytics.Enums.Contexts
local EventNamesModule = require(script.Parent.EventNames)

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("UserRelationshipModalsAnalyticsThrottlingThousandths", 10000)
	},
	[EventNamesModule.ModalSeen] = {
		description = "Userrelationshipsmodal was opened",
		lastUpdated = { 26, 4, 16 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter },
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 24 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = {
					eventContext = Contexts.UserRelationshipModals,
					placeId = game.PlaceId
				}
			}
		}
	},
	[EventNamesModule.ModalClosed] = {
		description = "User-relationship-modal was closed without changing the user relationship",
		lastUpdated = { 26, 4, 16 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter },
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 43 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					btn = "Close",
					eventContext = Contexts.UserRelationshipModals,
					placeId = game.PlaceId
				}
			}
		}
	},
	[EventNamesModule.CreateActionPressed] = {
		description = "User pressed on the create action button on a user-relationship-modal",
		lastUpdated = { 26, 4, 16 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter },
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function() --[[ Line: 63 ]]
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					btn = "Create",
					eventContext = Contexts.UserRelationshipModals,
					placeId = game.PlaceId
				}
			}
		}
	}
}