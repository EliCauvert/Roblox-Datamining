local enums = require(script:FindFirstAncestor("EditProfileBackground").Parent.SocialLuaAnalytics).Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local eventNamesModule = require(script.Parent.Enums.EventNames)
local buttonNamesModule = require(script.Parent.Enums.ButtonNames)

return {
	[eventNamesModule.EditProfileBackgroundOpened] = {
		context = contexts.EditProfile,
		eventType = eventTypes.PageLoad,
		additionalInfo = { btn = buttonNamesModule.EditProfileBackgroundOpened }
	},
	[eventNamesModule.BackgroundSelected] = {
		context = contexts.EditProfile,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = buttonNamesModule.BackgroundSelected }
	}
}