return {
	SduiAvatarExperienceRegister = require(script.System.SduiAvatarExperienceRegister),
	MarketplaceCatalogSduiSelectionBridge = require(script.System.MarketplaceCatalogSduiSelectionBridge),
	useCatalogSelectionReader = require(script.hooks.useCatalogSelectionReader),
	Context = {
		SduiWidgetTTITileLatencyContext = require(script.Context.SduiWidgetTTITileLatencyContext),
		CatalogSelectionReaderContext = require(script.Context.CatalogSelectionReaderContext)
	},
	["jest.config"] = script["jest.config"]
}