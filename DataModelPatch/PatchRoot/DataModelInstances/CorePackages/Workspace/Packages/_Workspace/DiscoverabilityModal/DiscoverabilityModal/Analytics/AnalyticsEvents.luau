local DependenciesModule = require(script.Parent.Parent.dependencies)
local EventNamesModule = require(script.Parent.Enums.EventNames)
local Dash = DependenciesModule.Dash
local Enums = DependenciesModule.SocialLuaAnalytics.Analytics.Enums
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
local BtnValuesModule = require(script.Parent.Enums.BtnValues)

return {
	[EventNamesModule.DiscoverabilityModalLoad] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.DiscoverabilityModalLoad,
		formatRulesForAdditionalInfo = { version = Dash.identity, wordingVersion = Dash.identity }
	},
	[EventNamesModule.DiscoverabilityModalContinue] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.DiscoverabilityModalClick,
		additionalInfo = { btn = BtnValuesModule.ContactImporter },
		formatRulesForAdditionalInfo = { selected = Dash.identity }
	},
	[EventNamesModule.DiscoverabilityModalClose] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.DiscoverabilityModalClick,
		additionalInfo = { btn = BtnValuesModule.Close },
		formatRulesForAdditionalInfo = { selected = Dash.identity }
	},
	[EventNamesModule.DiscoverabilityModalRadioButtonClick] = {
		context = Contexts.ContactImport,
		eventType = EventTypes.DiscoverabilityModalRadioButtonClick,
		formatRulesForAdditionalInfo = { selected = Dash.identity }
	}
}