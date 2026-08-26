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

local function sendAnalyticsEvent(p1, p2)
	-- upvalues: cryoModule (ref), telemetryService (ref), t_1 (ref)
	telemetryService:LogEvent(t_1, {
		customFields = cryoModule.Dictionary.join(p1 or {}, p2),
		standardizedFields = { "addSessionInfo" }
	})
end

return {
	TelemetryEventType = t,
	sendEditProfileOpened = function()
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ page = "EditProfilePage" }, { sub_event_type = t.EditProfileOpened })
	end,
	sendDisplayNameModalOpened = function()
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ btn = "openEditDisplayName" }, { sub_event_type = t.DisplayNameModalOpened })
	end,
	sendDisplayNameModalLoaded = function(p1)
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ page = "EditDisplayNameModal", statValue = p1 }, {
			sub_event_type = t.DisplayNameModalLoaded,
			statValue = p1
		})
	end,
	sendDisplayNameSaved = function(p1, p2)
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({
			btn = "saveDisplayName",
			displayName = p1,
			statValue = p2
		}, {
			sub_event_type = t.DisplayNameSaved,
			displayName = p1,
			statValue = p2
		})
	end,
	sendDisplayNameTooShort = function(p1)
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ displayName = p1 }, { sub_event_type = t.DisplayNameTooShort, displayName = p1 })
	end,
	sendFilteredDisplayName = function(p1)
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ displayName = p1 }, { sub_event_type = t.FilteredDisplayName, displayName = p1 })
	end,
	sendEditUsernameOpened = function()
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ btn = "openEditUsername" }, { sub_event_type = t.EditUsernameOpened })
	end,
	sendUsernameSaved = function(p1)
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ statValue = p1 }, { sub_event_type = t.UsernameSaved, statValue = p1 })
	end,
	sendOpenAvatarMarketplace = function()
		-- upvalues: sendAnalyticsEvent (ref), t (ref)
		sendAnalyticsEvent({ btn = "openAvatarMarketplace" }, { sub_event_type = t.OpenAvatarMarketplace })
	end,
	sendError = function(p1)
		-- upvalues: constantsModule (ref), sendAnalyticsEvent (ref), t (ref)
		if p1 == constantsModule.DescriptionErrorCodes.PinLocked then
			sendAnalyticsEvent(nil, { sub_event_type = t.DescriptionPINBlocked })
		end
	end
}