local EditProfile = script:FindFirstAncestor("EditProfile")
local TelemetryService = game:GetService("TelemetryService")
local CryoModule = require(EditProfile.Parent.Cryo)
local ConstantsModule = require(EditProfile.Common.Constants)
local TelemetryEventType = {
	EditProfileOpened = "EditProfileOpened",
	DisplayNameModalOpened = "DisplayNameModalOpened",
	DisplayNameModalLoaded = "DisplayNameModalLoaded",
	DisplayNameSaved = "DisplayNameSaved",
	DisplayNameTooShort = "DisplayNameTooShort",
	FilteredDisplayName = "FilteredDisplayName",
	EditUsernameOpened = "EditUsernameOpened",
	UsernameSaved = "UsernameSaved",
	DescriptionPINBlocked = "DescriptionPINBlocked",
	OpenAvatarMarketplace = "OpenAvatarMarketplace"
}
local config = {
	eventName = "EditProfileEvent",
	description = "Event to track edit profile",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/edit_profile/lua_edit_profile_button_events.proto",
	lastUpdated = { 2025, 1, 20 },
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("EditProfileThrottleHundredthsPercent", 10000)
}

local function sendAnalyticsEvent(p1, p2) --[[ Line: 68 ]]
	-- upvalues: CryoModule (copy), TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config, {
		customFields = CryoModule.Dictionary.join(p1 or {}, p2),
		standardizedFields = { "addSessionInfo" }
	})
end

return {
	TelemetryEventType = TelemetryEventType,
	sendEditProfileOpened = function() --[[ Line: 89 ]]
		-- upvalues: sendAnalyticsEvent (copy), TelemetryEventType (copy)
		sendAnalyticsEvent({ page = "EditProfilePage" }, { sub_event_type = TelemetryEventType.EditProfileOpened })
	end,
	sendDisplayNameModalOpened = function() --[[ Line: 93 ]]
		-- upvalues: sendAnalyticsEvent (copy), TelemetryEventType (copy)
		sendAnalyticsEvent({ btn = "openEditDisplayName" }, {
			sub_event_type = TelemetryEventType.DisplayNameModalOpened
		})
	end,
	sendDisplayNameModalLoaded = function(StatValue) --[[ Line: 100 ]]
		-- upvalues: sendAnalyticsEvent (copy), TelemetryEventType (copy)
		sendAnalyticsEvent({ page = "EditDisplayNameModal", statValue = StatValue }, {
			sub_event_type = TelemetryEventType.DisplayNameModalLoaded,
			statValue = StatValue
		})
	end,
	sendDisplayNameSaved = function(DisplayName, StatValue) --[[ Line: 107 ]]
		-- upvalues: sendAnalyticsEvent (copy), TelemetryEventType (copy)
		sendAnalyticsEvent({
			btn = "saveDisplayName",
			displayName = DisplayName,
			statValue = StatValue
		}, {
			sub_event_type = TelemetryEventType.DisplayNameSaved,
			displayName = DisplayName,
			statValue = StatValue
		})
	end,
	sendDisplayNameTooShort = function(DisplayName) --[[ Line: 114 ]]
		-- upvalues: sendAnalyticsEvent (copy), TelemetryEventType (copy)
		sendAnalyticsEvent({ displayName = DisplayName }, {
			sub_event_type = TelemetryEventType.DisplayNameTooShort,
			displayName = DisplayName
		})
	end,
	sendFilteredDisplayName = function(DisplayName) --[[ Line: 121 ]]
		-- upvalues: sendAnalyticsEvent (copy), TelemetryEventType (copy)
		sendAnalyticsEvent({ displayName = DisplayName }, {
			sub_event_type = TelemetryEventType.FilteredDisplayName,
			displayName = DisplayName
		})
	end,
	sendEditUsernameOpened = function() --[[ Line: 128 ]]
		-- upvalues: sendAnalyticsEvent (copy), TelemetryEventType (copy)
		sendAnalyticsEvent({ btn = "openEditUsername" }, { sub_event_type = TelemetryEventType.EditUsernameOpened })
	end,
	sendUsernameSaved = function(StatValue) --[[ Line: 132 ]]
		-- upvalues: sendAnalyticsEvent (copy), TelemetryEventType (copy)
		sendAnalyticsEvent({ statValue = StatValue }, {
			sub_event_type = TelemetryEventType.UsernameSaved,
			statValue = StatValue
		})
	end,
	sendOpenAvatarMarketplace = function() --[[ Line: 145 ]]
		-- upvalues: sendAnalyticsEvent (copy), TelemetryEventType (copy)
		sendAnalyticsEvent({ btn = "openAvatarMarketplace" }, {
			sub_event_type = TelemetryEventType.OpenAvatarMarketplace
		})
	end,
	sendError = function(PinLocked) --[[ Line: 139 ]]
		-- upvalues: ConstantsModule (copy), sendAnalyticsEvent (copy), TelemetryEventType (copy)
		if PinLocked == ConstantsModule.DescriptionErrorCodes.PinLocked then
			sendAnalyticsEvent(nil, {
				sub_event_type = TelemetryEventType.DescriptionPINBlocked
			})
		end
	end
}