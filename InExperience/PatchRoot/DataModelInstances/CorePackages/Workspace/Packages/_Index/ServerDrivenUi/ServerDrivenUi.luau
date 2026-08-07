local sduiCoreSystemModule = require(script.Parent.SduiCoreSystem)

return {
	["jest.config"] = script["jest.config"],
	SduiComponent = sduiCoreSystemModule.SduiComponent,
	SduiComponentType = sduiCoreSystemModule.SduiComponentType,
	SduiOmniFeedItem = require(script.Migration.SduiOmniFeedItem),
	SduiV2OmniFeedItem = require(script.Migration.SduiV2OmniFeedItem),
	SduiV2OmniFeedConstants = require(script.Migration.SduiV2OmniFeedConstants),
	SduiSeeAllGrid = require(script.Migration.SduiSeeAllGrid),
	AddSduiRootConfig = require(script.Rodux.AddSduiRootConfig),
	RemoveSduiRootConfig = require(script.Rodux.RemoveSduiRootConfig),
	SduiConfigReducer = require(script.Rodux.SduiConfigReducer),
	useSduiContext = require(script.System.useSduiContext),
	isSduiGameOmniFeedItem = require(script.Migration.isSduiGameOmniFeedItem),
	useSduiContextFromRoduxAndProcessConfigs = require(script.Migration.useSduiContextFromRoduxAndProcessConfigs),
	useApportioningPreprocessingFromOmniRecommendations = if require(script.Parent.SharedFlags).FFlagLuaAppRfySignalApportioning then require(script.Migration.useApportioningPreprocessingFromOmniRecommendations) else nil,
	seedHomeOmniSduiV2Payload = require(script.Migration.seedHomeOmniSduiV2Payload),
	validateSduiComponentConfig = sduiCoreSystemModule.validateSduiComponentConfig,
	useSduiContextFromSignalAndProcessConfigs = require(script.Migration.useSduiContextFromSignalAndProcessConfigs),
	getSduiFeedStore = require(script.DataStore.getSduiFeedStore),
	useSduiEdpFeedItemConfigs = require(script.Migration.useSduiEdpFeedItemConfigs),
	SduiErrors = sduiCoreSystemModule.SduiErrors,
	SduiLogger = sduiCoreSystemModule.SduiLogger,
	SduiDiscoveryDependencyUpdater = require(script.System.SduiDiscoveryDependencyUpdater),
	SearchPageTabSwitchBridge = require(script.System.SearchPageTabSwitchBridge),
	OpenSearchResultsWithQueryBridge = require(script.System.OpenSearchResultsWithQueryBridge),
	ItemHeightMode = require(script.Content.Collections.ItemHeightMode)
}