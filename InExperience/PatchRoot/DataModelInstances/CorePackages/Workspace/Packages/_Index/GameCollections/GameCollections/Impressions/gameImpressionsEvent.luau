local HttpService = game:GetService("HttpService")
local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("GameCollections").Parent
local CryoModule = require(Parent.Cryo)
local GetPlatformTargetFunction = require(Parent.Analytics).getPlatformTarget
local TModule = require(Parent.t)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local ContentType = require(Parent.UnifiedLogging).ContentType
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local FFlagSearchOmniAutocompletePage = require(Parent.SharedFlags).FFlagSearchOmniAutocompletePage
local FFlagLuaAppGameImpressionsMobileAdsId = require(Parent.SharedFlags).FFlagLuaAppGameImpressionsMobileAdsId
local FFlagTraversalHistoryDiscoveryTelemetry = require(Parent.SharedFlags).FFlagTraversalHistoryDiscoveryTelemetry
local FFlagLuaAppMigrateGameEventsTelemetryService = require(Parent.SharedFlags).FFlagLuaAppMigrateGameEventsTelemetryService
local FFlagLuaAppGameEventsTelemetryServiceShadowTraffic = require(Parent.SharedFlags).FFlagLuaAppGameEventsTelemetryServiceShadowTraffic
local LuaAppGameImpressionsEventThrottlingHundredthsPercent = game:DefineFastInt("LuaAppGameImpressionsEventThrottlingHundredthsPercent", 10000)
local LuaAppGameImpressionsShadowThrottlingHundredthsPercent = game:DefineFastInt("LuaAppGameImpressionsShadowThrottlingHundredthsPercent", 10000)
local FFlagLuaAppGameImpressionsAddUnifiedFields = require(Parent.SharedFlags).FFlagLuaAppGameImpressionsAddUnifiedFields
local FFlagLuaAppSduiLandingPageEnabled = require(Parent.SharedFlags).FFlagLuaAppSduiLandingPageEnabled
local FFlagLuaAppAddAnalyticsDataToSeeAllImpressions = require(Parent.SharedFlags).FFlagLuaAppAddAnalyticsDataToSeeAllImpressions
local FFlagSduiSearchResultsPageEnabled = require(Parent.SharedFlags).FFlagSduiSearchResultsPageEnabled
local FFlagLuaAppSearchResultsPageGameTileVideo = require(Parent.SharedFlags).FFlagLuaAppSearchResultsPageGameTileVideo
local FFlagLuaAppDiscoveryMomentVideoTelemetry = require(Parent.SharedFlags).FFlagLuaAppDiscoveryMomentVideoTelemetry
local Config = if FFlagLuaAppMigrateGameEventsTelemetryService then {
	eventName = "gameImpressions",
	description = "Fires when game tiles become visible to the user",
	backends = { "EventIngest" },
	throttlingPercentage = LuaAppGameImpressionsEventThrottlingHundredthsPercent,
	lastUpdated = { 26, 2, 4 }
} else nil
local Config1 = if FFlagLuaAppGameEventsTelemetryServiceShadowTraffic then {
	eventName = "gameImpressionsShadow",
	description = "Shadow traffic for gameImpressions event recovery percentage",
	backends = { "EventIngest" },
	throttlingPercentage = LuaAppGameImpressionsShadowThrottlingHundredthsPercent,
	lastUpdated = { 26, 3, 4 }
} else nil
local StrictInterfaceResult = TModule.strictInterface({
	absPositions = TModule.string,
	topicDataPositions = TModule.string,
	rootPlaceIds = TModule.string,
	universeIds = TModule.string,
	gameSetTypeId = TModule.string,
	sortPos = TModule.number,
	locale = TModule.string,
	thumbnailAssetIds = TModule.optional(TModule.string),
	thumbnailListIds = TModule.optional(TModule.string),
	videoThumbnailAssetIds = TModule.optional(TModule.string),
	videoIsMoment_arr = if FFlagLuaAppDiscoveryMomentVideoTelemetry then TModule.optional(TModule.string) else nil,
	componentType = TModule.optional(TModule.string),
	gameSetTargetId = TModule.optional(TModule.number),
	pageId = TModule.optional(TModule.string),
	adFlags = TModule.optional(TModule.string),
	adIds = TModule.optional(TModule.string),
	rows = TModule.optional(TModule.string),
	rowsOnPage = TModule.optional(TModule.string),
	positionsInRows = TModule.optional(TModule.string),
	tileBadgeContexts = TModule.optional(TModule.string),
	appliedFilters = TModule.optional(TModule.string),
	mobileAdvertisingId = if FFlagLuaAppGameImpressionsMobileAdsId then TModule.optional(TModule.string) else nil,
	footerTextLiterals = TModule.optional(TModule.string),
	footerLocalizationKeys = TModule.optional(TModule.string),
	loadSource = TModule.optional(TModule.string),
	tileTypes = TModule.optional(TModule.string),
	sortSubId = TModule.optional(TModule.string),
	analyticsData = TModule.optional(TModule.table),
	contentType = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.string) else nil,
	interactionUuid = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.string) else nil,
	hasSponsoredContent = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.boolean) else nil
})
local StrictInterfaceResult1 = TModule.strictInterface({
	absPositions = TModule.string,
	topicDataPositions = TModule.string,
	rootPlaceIds = TModule.string,
	universeIds = TModule.string,
	gameSetTypeId = TModule.string,
	locale = TModule.string,
	seeAllFlag = TModule.number,
	gameSetTargetId = TModule.optional(TModule.number),
	pageId = TModule.optional(TModule.string),
	adFlags = TModule.optional(TModule.string),
	adIds = TModule.optional(TModule.string),
	thumbnailAssetIds = TModule.optional(TModule.string),
	thumbnailListIds = TModule.optional(TModule.string),
	videoThumbnailAssetIds = TModule.optional(TModule.string),
	videoIsMoment_arr = if FFlagLuaAppDiscoveryMomentVideoTelemetry then TModule.optional(TModule.string) else nil,
	tileBadgeContexts = TModule.optional(TModule.string),
	mobileAdvertisingId = if FFlagLuaAppGameImpressionsMobileAdsId then TModule.optional(TModule.string) else nil,
	appliedFilters = TModule.optional(TModule.string),
	footerTextLiterals = TModule.optional(TModule.string),
	footerLocalizationKeys = TModule.optional(TModule.string),
	tileTypes = TModule.optional(TModule.string),
	analyticsData = if FFlagLuaAppAddAnalyticsDataToSeeAllImpressions then TModule.optional(TModule.table) else nil,
	contentType = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.string) else nil,
	interactionUuid = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.string) else nil,
	hasSponsoredContent = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.boolean) else nil
})
local StrictInterfaceResult2 = if FFlagSearchOmniAutocompletePage then TModule.strictInterface({
	absPositions = TModule.string,
	topicDataPositions = TModule.string,
	rootPlaceIds = TModule.string,
	universeIds = TModule.string,
	sortPos = TModule.number,
	gameSetTypeId = TModule.optional(TModule.string),
	locale = TModule.optional(TModule.string),
	thumbnailAssetIds = TModule.optional(TModule.string),
	videoThumbnailAssetIds = TModule.optional(TModule.string),
	videoIsMoment_arr = if FFlagLuaAppDiscoveryMomentVideoTelemetry then TModule.optional(TModule.string) else nil,
	componentType = TModule.optional(TModule.string),
	rowsOnPage = TModule.optional(TModule.string),
	positionsInRows = TModule.optional(TModule.string),
	mobileAdvertisingId = if FFlagLuaAppGameImpressionsMobileAdsId then TModule.optional(TModule.string) else nil,
	gameSetTargetId = TModule.optional(TModule.number),
	adFlags = TModule.optional(TModule.string),
	adIds = TModule.optional(TModule.string),
	tileBadgeContexts = TModule.optional(TModule.string),
	thumbnailListIds = TModule.optional(TModule.string),
	tileTypes = TModule.optional(TModule.string),
	contentType = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.string) else nil,
	interactionUuid = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.string) else nil,
	hasSponsoredContent = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.boolean) else nil
}) else nil
local config = {
	[AppPage.Home] = StrictInterfaceResult,
	[AppPage.Games] = StrictInterfaceResult,
	[AppPage.SduiLandingPage] = if FFlagLuaAppSduiLandingPageEnabled then StrictInterfaceResult else nil,
	[AppPage.SearchPage] = TModule.strictInterface({
		absPositions = TModule.string,
		topicDataPositions = TModule.string,
		rootPlaceIds = TModule.string,
		universeIds = TModule.string,
		searchUuid = TModule.string,
		emphasisFlag = TModule.number,
		seeAllFlag = TModule.number,
		sortPos = TModule.optional(TModule.number),
		gameSetTypeId = TModule.optional(TModule.string),
		locale = TModule.optional(TModule.string),
		adFlags = TModule.optional(TModule.string),
		adIds = TModule.optional(TModule.string),
		rows = TModule.optional(TModule.string),
		rowsOnPage = TModule.optional(TModule.string),
		positionsInRows = TModule.optional(TModule.string),
		mobileAdvertisingId = if FFlagLuaAppGameImpressionsMobileAdsId then TModule.optional(TModule.string) else nil,
		thumbnailAssetIds = TModule.optional(TModule.string),
		thumbnailListIds = TModule.optional(TModule.string),
		videoThumbnailAssetIds = if FFlagLuaAppSearchResultsPageGameTileVideo then TModule.optional(TModule.string) else nil,
		videoIsMoment_arr = if FFlagLuaAppDiscoveryMomentVideoTelemetry then TModule.optional(TModule.string) else nil,
		footerTextLiterals = TModule.optional(TModule.string),
		footerLocalizationKeys = TModule.optional(TModule.string),
		tileBadgeContexts = TModule.optional(TModule.string),
		componentType = TModule.optional(TModule.string),
		tileTypes = TModule.optional(TModule.string),
		analyticsData = if FFlagSduiSearchResultsPageEnabled then TModule.optional(TModule.table) else nil,
		contentType = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.string) else nil,
		interactionUuid = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.string) else nil,
		hasSponsoredContent = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.boolean) else nil
	}),
	[AppPage.SearchLandingPage] = if FFlagSearchOmniAutocompletePage then StrictInterfaceResult2 else nil,
	recommended = TModule.strictInterface({
		absPositions = TModule.string,
		topicDataPositions = TModule.string,
		rootPlaceIds = TModule.string,
		universeIds = TModule.string,
		refId = TModule.string,
		adFlags = TModule.optional(TModule.string),
		adIds = TModule.optional(TModule.string),
		locale = TModule.optional(TModule.string),
		tileBadgeContexts = TModule.optional(TModule.string),
		mobileAdvertisingId = if FFlagLuaAppGameImpressionsMobileAdsId then TModule.optional(TModule.string) else nil,
		tileTypes = TModule.optional(TModule.string),
		contentType = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.string) else nil,
		interactionUuid = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.string) else nil,
		hasSponsoredContent = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.boolean) else nil
	}),
	Deeplink = StrictInterfaceResult1,
	InExpHistoryPage = if FFlagTraversalHistoryDiscoveryTelemetry then TModule.strictInterface({
		absPositions = TModule.string,
		positionsInRows = TModule.optional(TModule.string),
		rootPlaceIds = TModule.string,
		rows = TModule.string,
		rowsOnPage = TModule.string,
		topicDataPositions = TModule.string,
		universeIds = TModule.string,
		locale = TModule.optional(TModule.string),
		tileBadgeContexts = TModule.optional(TModule.string),
		contentType = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.string) else nil,
		interactionUuid = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.string) else nil,
		hasSponsoredContent = if FFlagLuaAppGameImpressionsAddUnifiedFields then TModule.optional(TModule.boolean) else nil
	}) else nil
}

return function(p1, EventContext, CustomFields)
	-- upvalues: AppPage (copy), StrictInterfaceResult1 (copy), config (copy), DiscoveryEventErrorLogger (copy), FFlagLuaAppGameImpressionsAddUnifiedFields (copy), CryoModule (copy), HttpService (copy), ContentType (copy), FFlagLuaAppMigrateGameEventsTelemetryService (copy), TelemetryService (copy), Config (ref), GetPlatformTargetFunction (copy), FFlagLuaAppGameEventsTelemetryServiceShadowTraffic (copy), Config1 (ref)
	local StrictInterfaceResult = if CustomFields.seeAllFlag and (EventContext == AppPage.Home or EventContext == AppPage.Games) then StrictInterfaceResult1 else config[EventContext]
	
	if StrictInterfaceResult then
		local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
		
		if not StrictInterfaceResultResult then
			DiscoveryEventErrorLogger.reportError("GameImpressionsEventInvalidInterface", StrictInterfaceResultResult2)
		end
	else
		DiscoveryEventErrorLogger.reportError("GameImpressionsEventMissingInterface", `Missing interface for eventContext {EventContext} to type check gameImpressions event parameters`, { eventContext = EventContext })
	end
	if FFlagLuaAppGameImpressionsAddUnifiedFields then
		CustomFields = CryoModule.Dictionary.join({
			interactionUuid = HttpService:GenerateGUID(false),
			contentType = ContentType.Game
		}, CustomFields)
	end
	if CustomFields.analyticsData then
		CustomFields = CryoModule.Dictionary.join(CustomFields.analyticsData, CustomFields, { analyticsData = CryoModule.None })
	end
	if FFlagLuaAppMigrateGameEventsTelemetryService then
		TelemetryService:LogEvent(Config, {
			eventContext = EventContext,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = CustomFields,
			legacyOverrideTargetForEventIngest = GetPlatformTargetFunction()
		})
	else
		p1:sendEventDeferred(EventContext, "gameImpressions", CustomFields)
	end
	if FFlagLuaAppGameEventsTelemetryServiceShadowTraffic then
		TelemetryService:LogEvent(Config1, {
			eventContext = EventContext,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = CustomFields,
			legacyOverrideTargetForEventIngest = GetPlatformTargetFunction()
		})
	end
end