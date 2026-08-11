local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local dashModule = require(parent.Dash)
local enums = require(parent.SocialLuaAnalytics).Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local constantsModule = require(editProfile.Common.Constants)
local eventNamesModule = require(script.Parent.Enums.EventNames)
local btnValuesModule = require(script.Parent.Enums.BtnValues)

return {
	[eventNamesModule.EditProfileOpened] = {
		context = contexts.EditProfile,
		eventType = eventTypes.PageLoad,
		additionalInfo = { page = constantsModule.EditProfilePage }
	},
	[eventNamesModule.DisplayNameSaved] = {
		context = contexts.EditProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.SaveDisplayName },
		formatRulesForAdditionalInfo = { displayName = dashModule.identity }
	},
	[eventNamesModule.DisplayNameModalOpened] = {
		context = contexts.EditProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.OpenEditDisplayName }
	},
	[eventNamesModule.DisplayNameModalLoaded] = {
		context = contexts.EditProfile,
		eventType = eventTypes.PageLoad,
		additionalInfo = { page = constantsModule.EditDisplayNameModal }
	},
	[eventNamesModule.EditUsernameOpened] = {
		context = contexts.EditProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.OpenEditUsername }
	},
	[eventNamesModule.UsernameSaved] = {
		context = contexts.EditProfile,
		eventType = eventTypes.UsernameSaved
	},
	[eventNamesModule.FilteredDisplayName] = {
		context = contexts.EditProfile,
		eventType = eventTypes.FilteredDisplayName,
		formatRulesForAdditionalInfo = { displayName = dashModule.identity }
	},
	[eventNamesModule.DisplayNameTooShort] = {
		context = contexts.EditProfile,
		eventType = eventTypes.DisplayNameTooShort,
		formatRulesForAdditionalInfo = { displayName = dashModule.identity }
	},
	[eventNamesModule.DescriptionPINBlocked] = {
		context = contexts.EditProfile,
		eventType = eventTypes.DescriptionPINBlocked
	},
	[eventNamesModule.OpenAvatarMarketplace] = {
		context = contexts.EditProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.OpenAvatarMarketplace }
	}
}