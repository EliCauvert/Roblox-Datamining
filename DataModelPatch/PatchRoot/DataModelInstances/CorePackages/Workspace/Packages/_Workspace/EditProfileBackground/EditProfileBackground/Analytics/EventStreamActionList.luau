local Enums = require(script:FindFirstAncestor("EditProfileBackground").Parent.SocialLuaAnalytics).Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local EventNamesModule = require(script.Parent.Enums.EventNames)
local ButtonNamesModule = require(script.Parent.Enums.ButtonNames)

return {
	[EventNamesModule.EditProfileBackgroundOpened] = {
		context = Contexts.EditProfile,
		eventType = EventTypes.PageLoad,
		additionalInfo = { btn = ButtonNamesModule.EditProfileBackgroundOpened }
	},
	[EventNamesModule.BackgroundSelected] = {
		context = Contexts.EditProfile,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = ButtonNamesModule.BackgroundSelected }
	}
}