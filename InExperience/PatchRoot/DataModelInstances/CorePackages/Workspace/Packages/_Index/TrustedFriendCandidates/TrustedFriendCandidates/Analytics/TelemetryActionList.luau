local SocialLuaAnalyticsModule = require(script:FindFirstAncestor("TrustedFriendCandidates").Parent.SocialLuaAnalytics)
local SupportedTelemetryBackends = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local EventTypes = SocialLuaAnalyticsModule.Analytics.Enums.EventTypes
local Contexts = SocialLuaAnalyticsModule.Analytics.Enums.Contexts
local Sources = SocialLuaAnalyticsModule.Analytics.Enums.Sources
local ButtonNamesModule = require(script.Parent.ButtonNames)
local EventNamesModule = require(script.Parent.EventNames)

local function identity(p1)
	return p1
end

local FriendsLandingTrustedCandidates = Sources.FriendsLandingTrustedCandidates
local DynamicCustomFields = {
	targetUserId = identity,
	absolutePosition = identity,
	contextType = identity,
	friendRequestOriginSource = identity,
	candidateState = identity
}

local function rowEvent(Description, ButtonClick, StaticCustomFields)
	-- upvalues: SupportedTelemetryBackends (copy), DynamicCustomFields (copy)
	return {
		description = Description,
		lastUpdated = { 26, 11, 11 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: ButtonClick (copy)
					return ButtonClick
				end,
				staticCustomFields = StaticCustomFields,
				dynamicCustomFields = DynamicCustomFields
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	}
end

return {
	defaults = {
		links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/trusted_connections.proto",
		throttlingThousandths = game:DefineFastInt("TrustedFriendCandidatesAnalyticsThrottlingThousandths", 10000)
	},
	[EventNamesModule.SectionSeen] = {
		description = "Trusted friend candidates section shown",
		lastUpdated = { 26, 11, 11 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = {
					namespace = "TrustedFriendCandidates",
					eventContext = Contexts.FriendsLanding,
					source = FriendsLandingTrustedCandidates
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.RowSeen] = rowEvent("Trusted friend candidate rows shown", EventTypes.UserSeen, {
		namespace = "TrustedFriendCandidates",
		eventContext = Contexts.FriendsLanding,
		source = FriendsLandingTrustedCandidates
	}),
	[EventNamesModule.AddClicked] = rowEvent("Trusted friend candidate Add button clicked", EventTypes.ButtonClick, {
		namespace = "TrustedFriendCandidates",
		eventContext = Contexts.FriendsLanding,
		source = FriendsLandingTrustedCandidates,
		btn = ButtonNamesModule.AddTrustedConnection
	}),
	[EventNamesModule.AcceptClicked] = rowEvent("Trusted friend candidate Accept button clicked", EventTypes.ButtonClick, {
		namespace = "TrustedFriendCandidates",
		eventContext = Contexts.FriendsLanding,
		source = FriendsLandingTrustedCandidates,
		btn = ButtonNamesModule.AcceptTrustedConnection
	})
}