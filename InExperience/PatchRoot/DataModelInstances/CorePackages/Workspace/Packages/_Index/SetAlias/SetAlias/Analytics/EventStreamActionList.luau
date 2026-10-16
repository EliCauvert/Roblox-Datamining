local Parent = script.Parent.Parent
local Dash = require(Parent.dependencies).Dash
local Enums = require(Parent.Parent.SocialLuaAnalytics).Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local EventNamesModule = require(script.Parent.Enums.EventNames)
local BtnValuesModule = require(script.Parent.Enums.BtnValues)

return {
	[EventNamesModule.CustomizeNameModalOpened] = {
		context = Contexts.CustomizeName,
		eventType = EventTypes.PageLoad,
		formatRulesForAdditionalInfo = { origin = Dash.identity }
	},
	[EventNamesModule.CustomizeNameClearedInput] = {
		context = Contexts.CustomizeName,
		eventType = EventTypes.CustomizeNameClearedInput,
		formatRulesForAdditionalInfo = { origin = Dash.identity }
	},
	[EventNamesModule.CustomizeNameMaximumCharLimitTyped] = {
		context = Contexts.CustomizeName,
		eventType = EventTypes.CustomizeNameMaximumCharLimitTyped,
		formatRulesForAdditionalInfo = { alias = Dash.identity, origin = Dash.identity }
	},
	[EventNamesModule.CustomizeNameModalClosed] = {
		context = Contexts.CustomizeName,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = BtnValuesModule.CloseCustomizeName },
		formatRulesForAdditionalInfo = { origin = Dash.identity }
	},
	[EventNamesModule.CustomizeNameSaved] = {
		context = Contexts.CustomizeName,
		eventType = EventTypes.ButtonClick,
		additionalInfo = { btn = BtnValuesModule.SaveAlias },
		formatRulesForAdditionalInfo = { alias = Dash.identity, origin = Dash.identity }
	},
	[EventNamesModule.CustomizeNameSaveAttemptInvalidInput] = {
		context = Contexts.CustomizeName,
		eventType = EventTypes.CustomizeNameSaveAttemptInvalidInput,
		formatRulesForAdditionalInfo = { alias = Dash.identity, origin = Dash.identity }
	}
}