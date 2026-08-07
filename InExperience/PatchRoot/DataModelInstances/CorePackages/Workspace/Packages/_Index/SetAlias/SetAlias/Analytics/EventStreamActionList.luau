local parent = script.Parent.Parent
local dash = require(parent.dependencies).Dash
local enums = require(parent.Parent.SocialLuaAnalytics).Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local eventNamesModule = require(script.Parent.Enums.EventNames)
local btnValuesModule = require(script.Parent.Enums.BtnValues)

return {
	[eventNamesModule.CustomizeNameModalOpened] = {
		context = contexts.CustomizeName,
		eventType = eventTypes.PageLoad,
		formatRulesForAdditionalInfo = { origin = dash.identity }
	},
	[eventNamesModule.CustomizeNameClearedInput] = {
		context = contexts.CustomizeName,
		eventType = eventTypes.CustomizeNameClearedInput,
		formatRulesForAdditionalInfo = { origin = dash.identity }
	},
	[eventNamesModule.CustomizeNameMaximumCharLimitTyped] = {
		context = contexts.CustomizeName,
		eventType = eventTypes.CustomizeNameMaximumCharLimitTyped,
		formatRulesForAdditionalInfo = { alias = dash.identity, origin = dash.identity }
	},
	[eventNamesModule.CustomizeNameModalClosed] = {
		context = contexts.CustomizeName,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.CloseCustomizeName },
		formatRulesForAdditionalInfo = { origin = dash.identity }
	},
	[eventNamesModule.CustomizeNameSaved] = {
		context = contexts.CustomizeName,
		eventType = eventTypes.ButtonClick,
		additionalInfo = { btn = btnValuesModule.SaveAlias },
		formatRulesForAdditionalInfo = { alias = dash.identity, origin = dash.identity }
	},
	[eventNamesModule.CustomizeNameSaveAttemptInvalidInput] = {
		context = contexts.CustomizeName,
		eventType = eventTypes.CustomizeNameSaveAttemptInvalidInput,
		formatRulesForAdditionalInfo = { alias = dash.identity, origin = dash.identity }
	}
}