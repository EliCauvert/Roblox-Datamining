local dependenciesModule = require(script.Parent.Parent.dependencies)
local eventNamesModule = require(script.Parent.Enums.EventNames)
local dash = dependenciesModule.Dash
local enums = dependenciesModule.SocialLuaAnalytics.Analytics.Enums
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local btnValuesModule = require(script.Parent.Enums.BtnValues)

return {
	[eventNamesModule.DiscoverabilityModalLoad] = {
		context = contexts.ContactImport,
		eventType = eventTypes.DiscoverabilityModalLoad,
		formatRulesForAdditionalInfo = { version = dash.identity, wordingVersion = dash.identity }
	},
	[eventNamesModule.DiscoverabilityModalContinue] = {
		context = contexts.ContactImport,
		eventType = eventTypes.DiscoverabilityModalClick,
		additionalInfo = { btn = btnValuesModule.ContactImporter },
		formatRulesForAdditionalInfo = { selected = dash.identity }
	},
	[eventNamesModule.DiscoverabilityModalClose] = {
		context = contexts.ContactImport,
		eventType = eventTypes.DiscoverabilityModalClick,
		additionalInfo = { btn = btnValuesModule.Close },
		formatRulesForAdditionalInfo = { selected = dash.identity }
	},
	[eventNamesModule.DiscoverabilityModalRadioButtonClick] = {
		context = contexts.ContactImport,
		eventType = eventTypes.DiscoverabilityModalRadioButtonClick,
		formatRulesForAdditionalInfo = { selected = dash.identity }
	}
}