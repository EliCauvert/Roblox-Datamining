return {
	AnalyticsService = require(script.AnalyticsService),
	AvatarExperienceAnalyticsService = require(script.AvatarExperienceAnalyticsService),
	AXUnifiedEventFilter = require(script.AXUnifiedEventFilter),
	addUnifiedEventLogging = require(script.addUnifiedEventLogging),
	useUnifiedEventListener = require(script.useUnifiedEventListener),
	sendUnifiedEventLog = require(script.sendUnifiedEventLog),
	sendUnifiedEventLogForInstance = require(script.sendUnifiedEventLogForInstance),
	logWidgetLoaded = require(script.logWidgetLoaded),
	sendUnifiedEventForDeferredAction = require(script.sendUnifiedEventForDeferredAction),
	sendUnifiedClickItemDetailsEvent = require(script.sendUnifiedClickItemDetailsEvent),
	sendUnifiedEventsForMultiItemShopping = require(script.sendUnifiedEventsForMultiItemShopping),
	UnifiedEventLogConstants = require(script.UnifiedEventLogConstants),
	UnifiedEventLogEnums = require(script.UnifiedEventLogEnums),
	useUnifiedEventImpressionsReporter = require(script.useUnifiedEventImpressionsReporter),
	useUnifiedEventTagging = require(script.useUnifiedEventTagging),
	TagBasedImpressionsDetector = require(script.TagBasedImpressionsDetector),
	AvatarExperienceImpressionsDetector = require(script.AvatarExperienceImpressionsDetector),
	AvatarExperienceScreenSizeImpressionsDetector = require(script.AvatarExperienceScreenSizeImpressionsDetector),
	sendAXStat = require(script.sendAXStat),
	sendAXCounterV2 = require(script.sendAXCounterV2),
	getAvatarEventCounterNameWithPlatform = require(script.getAvatarEventCounterNameWithPlatform),
	reportAvatarEventCounterNoAnalyticsArgument = require(script.reportAvatarEventCounterNoAnalyticsArgument),
	reportAvatarEventCounterV1 = require(script.reportAvatarEventCounterV1),
	Flags = {
		FFlagAllowCustomUnifiedEventFilter = require(script.FFlagAllowCustomUnifiedEventFilter)
	},
	reportBackgroundUserActionCounter = require(script.reportBackgroundUserActionCounter),
	Enums = { ImpressionEnums = require(script.Enums.ImpressionEnums) },
	Lib = { CartIdService = require(script.Lib.CartIdService) },
	Store = {
		SeenImpressionsStore = require(script.Store.SeenImpressionsStore),
		UnifiedSelectionListStore = require(script.Store.UnifiedSelectionListStore)
	},
	Surfaces = {
		SlotBasedEditorAnalytics = require(script.Surfaces.SlotBasedEditorAnalytics)
	},
	Utils = {
		UnifiedEventLoggingUtils = require(script.Utils.UnifiedEventLoggingUtils),
		getMarketplaceUnifiedItemType = require(script.Utils.getMarketplaceUnifiedItemType),
		getTimedOptionForItemData = require(script.Utils.getTimedOptionForItemData),
		getUnifiedEventsForMIS = require(script.Utils.getUnifiedEventsForMIS),
		getUnifiedLoggingSurface = require(script.Utils.getUnifiedLoggingSurface),
		getUnifiedLoggingSurfaceForAppPage = require(script.Utils.getUnifiedLoggingSurfaceForAppPage),
		getUnifiedLoggingSurfaceForRoute = require(script.Utils.getUnifiedLoggingSurfaceForRoute),
		mapMarketplaceSurfaceToUnifiedLoggingSurface = require(script.Utils.mapMarketplaceSurfaceToUnifiedLoggingSurface),
		getItemSelectionAction = require(script.Utils.getItemSelectionAction),
		getCatalogItemUnifiedLoggingFields = require(script.Utils.getCatalogItemUnifiedLoggingFields)
	},
	Constants = require(script.Constants),
	ImpressionsReporter = {
		ImpressionsUtil = require(script.ImpressionsReporter.ImpressionsUtil),
		OrganicEventImpressionsSchema = require(script.ImpressionsReporter.OrganicEventImpressionsSchema)
	},
	Events = {
		BulkPurchaseMissingPurchaseOptionsCounter = require(script.Events.BulkPurchaseMissingPurchaseOptionsCounter)
	},
	["jest.config"] = script["jest.config"]
}