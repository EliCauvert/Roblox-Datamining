local editProfile = script:FindFirstAncestor("EditProfile")
local telemetryService = game:GetService("TelemetryService")
local cryoModule = require(editProfile.Parent.Cryo)
local constantsModule = require(editProfile.Common.Constants)
local _ = {
	OpenEditDisplayName = "openEditDisplayName",
	SaveDisplayName = "saveDisplayName",
	OpenEditUsername = "openEditUsername",
	OpenAvatarMarketplace = "openAvatarMarketplace"
}
local _ = {
	EditProfilePage = "EditProfilePage",
	EditDisplayNameModal = "EditDisplayNameModal"
}
local t = {
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
local t_1 = {
	eventName = "EditProfileEvent",
	description = "Event to track edit profile",
	links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/edit_profile/lua_edit_profile_button_events.proto",
	lastUpdated = { 2025, 1, 20 },
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("EditProfileThrottleHundredthsPercent", 10000)
}

local function sendAnalyticsEvent(p0, p1) --[[ line: 68 ]]
	-- upvalues: cryoModule (ref), telemetryService (ref), t_1 (ref)
	telemetryService:LogEvent(t_1, {
		customFields = cryoModule.Dictionary.join(p0 or {}, p1),
		standardizedFields = { "addSessionInfo" }
	})
end

return {
	TelemetryEventType = t,
	sendEditProfileOpened = function() --[[ line: 89 ]]
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ page = "EditProfilePage" }, { sub_event_type = t.EditProfileOpened })
	end,
	sendDisplayNameModalOpened = function() --[[ line: 93 ]]
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ btn = "openEditDisplayName" }, { sub_event_type = t.DisplayNameModalOpened })
	end,
	sendDisplayNameModalLoaded = function(p2) --[[ line: 100 ]]
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ page = "EditDisplayNameModal", statValue = p2 }, {
			sub_event_type = t.DisplayNameModalLoaded,
			statValue = p2
		})
	end,
	sendDisplayNameSaved = function(p3, p4) --[[ line: 107 ]]
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({
			btn = "saveDisplayName",
			displayName = p3,
			statValue = p4
		}, {
			sub_event_type = t.DisplayNameSaved,
			displayName = p3,
			statValue = p4
		})
	end,
	sendDisplayNameTooShort = function(p5) --[[ line: 114 ]]
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ displayName = p5 }, { sub_event_type = t.DisplayNameTooShort, displayName = p5 })
	end,
	sendFilteredDisplayName = function(p6) --[[ line: 121 ]]
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ displayName = p6 }, { sub_event_type = t.FilteredDisplayName, displayName = p6 })
	end,
	sendEditUsernameOpened = function() --[[ line: 128 ]]
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ btn = "openEditUsername" }, { sub_event_type = t.EditUsernameOpened })
	end,
	sendUsernameSaved = function(p7) --[[ line: 132 ]]
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ statValue = p7 }, { sub_event_type = t.UsernameSaved, statValue = p7 })
	end,
	sendOpenAvatarMarketplace = function() --[[ line: 145 ]]
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ btn = "openAvatarMarketplace" }, { sub_event_type = t.OpenAvatarMarketplace })
	end,
	sendError = function(p8) --[[ line: 139 ]]
		-- upvalues: constantsModule (ref), sendAnalyticsEvent (ref), t (ref)
		if p8 == constantsModule.DescriptionErrorCodes.PinLocked then
			sendAnalyticsEvent(nil, { sub_event_type = t.DescriptionPINBlocked })
		end
	end
}