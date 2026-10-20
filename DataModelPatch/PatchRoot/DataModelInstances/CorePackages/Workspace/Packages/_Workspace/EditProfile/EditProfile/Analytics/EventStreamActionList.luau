local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local DashModule = require(Parent.Dash)
local Enums = require(Parent.SocialLuaAnalytics).Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local ConstantsModule = require(EditProfile.Common.Constants)
local EventNamesModule = require(script.Parent.Enums.EventNames)
local BtnValuesModule = require(script.Parent.Enums.BtnValues)

return {
	[EventNamesModule.EditProfileOpened] = {
		context = Contexts.EditProfile,
		eventType = EventTypes.PageLoad,
		additionalInfo = { page = ConstantsModule.EditProfilePage }
	},
	[EventNamesModule.DisplayNameSaved] = {
		context = Contexts.EditProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = BtnValuesModule.SaveDisplayName },
		formatRulesForAdditionalInfo = { displayName = DashModule.identity }
	},
	[EventNamesModule.DisplayNameModalOpened] = {
		context = Contexts.EditProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = BtnValuesModule.OpenEditDisplayName }
	},
	[EventNamesModule.DisplayNameModalLoaded] = {
		context = Contexts.EditProfile,
		eventType = EventTypes.PageLoad,
		additionalInfo = { page = ConstantsModule.EditDisplayNameModal }
	},
	[EventNamesModule.EditUsernameOpened] = {
		context = Contexts.EditProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = BtnValuesModule.OpenEditUsername }
	},
	[EventNamesModule.UsernameSaved] = {
		context = Contexts.EditProfile,
		eventType = EventTypes.UsernameSaved
	},
	[EventNamesModule.FilteredDisplayName] = {
		context = Contexts.EditProfile,
		eventType = EventTypes.FilteredDisplayName,
		formatRulesForAdditionalInfo = { displayName = DashModule.identity }
	},
	[EventNamesModule.DisplayNameTooShort] = {
		context = Contexts.EditProfile,
		eventType = EventTypes.DisplayNameTooShort,
		formatRulesForAdditionalInfo = { displayName = DashModule.identity }
	},
	[EventNamesModule.DescriptionPINBlocked] = {
		context = Contexts.EditProfile,
		eventType = EventTypes.DescriptionPINBlocked
	},
	[EventNamesModule.OpenAvatarMarketplace] = {
		context = Contexts.EditProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = BtnValuesModule.OpenAvatarMarketplace }
	}
}