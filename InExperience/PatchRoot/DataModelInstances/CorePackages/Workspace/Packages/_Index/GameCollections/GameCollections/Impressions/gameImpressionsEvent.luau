local httpService = game:GetService("HttpService")
local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("GameCollections").Parent
local cryoModule = require(parent.Cryo)
local getPlatformTarget = require(parent.Analytics).getPlatformTarget
local tModule = require(parent.t)
local appPage = require(parent.RobloxAppEnums).AppPage
local contentType = require(parent.UnifiedLogging).ContentType
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local fFlagSearchOmniAutocompletePage = require(parent.SharedFlags).FFlagSearchOmniAutocompletePage
local fFlagLuaAppGameImpressionsMobileAdsId = require(parent.SharedFlags).FFlagLuaAppGameImpressionsMobileAdsId
local fFlagTraversalHistoryDiscoveryTelemetry = require(parent.SharedFlags).FFlagTraversalHistoryDiscoveryTelemetry
local fFlagLuaAppAddComponentTypeToSearchImpressions = require(parent.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions
local fFlagLuaAppMigrateGameEventsTelemetryService = require(parent.SharedFlags).FFlagLuaAppMigrateGameEventsTelemetryService
local fFlagLuaAppGameEventsTelemetryServiceShadowTraffic = require(parent.SharedFlags).FFlagLuaAppGameEventsTelemetryServiceShadowTraffic
local luaAppGameImpressionsEventThrottlingHundredthsPercent = game:DefineFastInt("LuaAppGameImpressionsEventThrottlingHundredthsPercent", 10000)
local luaAppGameImpressionsShadowThrottlingHundredthsPercent = game:DefineFastInt("LuaAppGameImpressionsShadowThrottlingHundredthsPercent", 10000)
local luaAppFixRecommendedImpressionsInterface = game:DefineFastFlag("LuaAppFixRecommendedImpressionsInterface", false)
local fFlagLuaAppGameImpressionsAddUnifiedFields = require(parent.SharedFlags).FFlagLuaAppGameImpressionsAddUnifiedFields
local fFlagLuaAppSduiLandingPageEnabled = require(parent.SharedFlags).FFlagLuaAppSduiLandingPageEnabled
local fFlagLuaAppAddAnalyticsDataToSeeAllImpressions = require(parent.SharedFlags).FFlagLuaAppAddAnalyticsDataToSeeAllImpressions
local fFlagSduiSearchResultsPageEnabled = require(parent.SharedFlags).FFlagSduiSearchResultsPageEnabled
local fFlagLuaAppSearchResultsPageGameTileVideo = require(parent.SharedFlags).FFlagLuaAppSearchResultsPageGameTileVideo
local var7 = if fFlagLuaAppMigrateGameEventsTelemetryService then {
	eventName = "gameImpressions",
	description = "Fires when game tiles become visible to the user",
	backends = { "EventIngest" },
	throttlingPercentage = luaAppGameImpressionsEventThrottlingHundredthsPercent,
	lastUpdated = { 26, 2, 4 }
} else nil
local var8 = if fFlagLuaAppGameEventsTelemetryServiceShadowTraffic then {
	eventName = "gameImpressionsShadow",
	description = "Shadow traffic for gameImpressions event recovery percentage",
	backends = { "EventIngest" },
	throttlingPercentage = luaAppGameImpressionsShadowThrottlingHundredthsPercent,
	lastUpdated = { 26, 3, 4 }
} else nil
local var9 = tModule.strictInterface({
	absPositions = tModule.string,
	topicDataPositions = tModule.string,
	rootPlaceIds = tModule.string,
	universeIds = tModule.string,
	gameSetTypeId = tModule.string,
	sortPos = tModule.number,
	locale = tModule.string,
	thumbnailAssetIds = tModule.optional(tModule.string),
	thumbnailListIds = tModule.optional(tModule.string),
	videoThumbnailAssetIds = tModule.optional(tModule.string),
	componentType = tModule.optional(tModule.string),
	gameSetTargetId = tModule.optional(tModule.number),
	pageId = tModule.optional(tModule.string),
	adFlags = tModule.optional(tModule.string),
	adIds = tModule.optional(tModule.string),
	rows = tModule.optional(tModule.string),
	rowsOnPage = tModule.optional(tModule.string),
	positionsInRows = tModule.optional(tModule.string),
	tileBadgeContexts = tModule.optional(tModule.string),
	appliedFilters = tModule.optional(tModule.string),
	mobileAdvertisingId = if fFlagLuaAppGameImpressionsMobileAdsId then tModule.optional(tModule.string) else nil,
	footerTextLiterals = tModule.optional(tModule.string),
	footerLocalizationKeys = tModule.optional(tModule.string),
	loadSource = tModule.optional(tModule.string),
	tileTypes = tModule.optional(tModule.string),
	sortSubId = tModule.optional(tModule.string),
	analyticsData = tModule.optional(tModule.table),
	contentType = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.string) else nil,
	interactionUuid = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.string) else nil,
	hasSponsoredContent = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.boolean) else nil
})
local var10 = tModule.strictInterface({
	absPositions = tModule.string,
	topicDataPositions = tModule.string,
	rootPlaceIds = tModule.string,
	universeIds = tModule.string,
	gameSetTypeId = tModule.string,
	locale = tModule.string,
	seeAllFlag = tModule.number,
	gameSetTargetId = tModule.optional(tModule.number),
	pageId = tModule.optional(tModule.string),
	adFlags = tModule.optional(tModule.string),
	adIds = tModule.optional(tModule.string),
	thumbnailAssetIds = tModule.optional(tModule.string),
	thumbnailListIds = tModule.optional(tModule.string),
	videoThumbnailAssetIds = tModule.optional(tModule.string),
	tileBadgeContexts = tModule.optional(tModule.string),
	mobileAdvertisingId = if fFlagLuaAppGameImpressionsMobileAdsId then tModule.optional(tModule.string) else nil,
	appliedFilters = tModule.optional(tModule.string),
	footerTextLiterals = tModule.optional(tModule.string),
	footerLocalizationKeys = tModule.optional(tModule.string),
	tileTypes = tModule.optional(tModule.string),
	analyticsData = if fFlagLuaAppAddAnalyticsDataToSeeAllImpressions then tModule.optional(tModule.table) else nil,
	contentType = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.string) else nil,
	interactionUuid = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.string) else nil,
	hasSponsoredContent = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.boolean) else nil
})
local t = {
	[appPage.Home] = var9,
	[appPage.Games] = var9,
	[appPage.SduiLandingPage] = if fFlagLuaAppSduiLandingPageEnabled then var9 else nil,
	[appPage.SearchPage] = tModule.strictInterface({
		absPositions = tModule.string,
		topicDataPositions = tModule.string,
		rootPlaceIds = tModule.string,
		universeIds = tModule.string,
		searchUuid = tModule.string,
		emphasisFlag = tModule.number,
		seeAllFlag = tModule.number,
		sortPos = tModule.optional(tModule.number),
		gameSetTypeId = tModule.optional(tModule.string),
		locale = tModule.optional(tModule.string),
		adFlags = tModule.optional(tModule.string),
		adIds = tModule.optional(tModule.string),
		rows = tModule.optional(tModule.string),
		rowsOnPage = tModule.optional(tModule.string),
		positionsInRows = tModule.optional(tModule.string),
		mobileAdvertisingId = if fFlagLuaAppGameImpressionsMobileAdsId then tModule.optional(tModule.string) else nil,
		thumbnailAssetIds = tModule.optional(tModule.string),
		thumbnailListIds = tModule.optional(tModule.string),
		videoThumbnailAssetIds = if fFlagLuaAppSearchResultsPageGameTileVideo then tModule.optional(tModule.string) else nil,
		footerTextLiterals = tModule.optional(tModule.string),
		footerLocalizationKeys = tModule.optional(tModule.string),
		tileBadgeContexts = tModule.optional(tModule.string),
		componentType = if fFlagLuaAppAddComponentTypeToSearchImpressions then tModule.optional(tModule.string) else nil,
		tileTypes = tModule.optional(tModule.string),
		analyticsData = if fFlagSduiSearchResultsPageEnabled then tModule.optional(tModule.table) else nil,
		contentType = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.string) else nil,
		interactionUuid = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.string) else nil,
		hasSponsoredContent = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.boolean) else nil
	}),
	[appPage.SearchLandingPage] = if fFlagSearchOmniAutocompletePage then if fFlagSearchOmniAutocompletePage then tModule.strictInterface({
		absPositions = tModule.string,
		topicDataPositions = tModule.string,
		rootPlaceIds = tModule.string,
		universeIds = tModule.string,
		sortPos = tModule.number,
		gameSetTypeId = tModule.optional(tModule.string),
		locale = tModule.optional(tModule.string),
		thumbnailAssetIds = tModule.optional(tModule.string),
		videoThumbnailAssetIds = tModule.optional(tModule.string),
		componentType = tModule.optional(tModule.string),
		rowsOnPage = tModule.optional(tModule.string),
		positionsInRows = tModule.optional(tModule.string),
		mobileAdvertisingId = if fFlagLuaAppGameImpressionsMobileAdsId then tModule.optional(tModule.string) else nil,
		gameSetTargetId = tModule.optional(tModule.number),
		adFlags = tModule.optional(tModule.string),
		adIds = tModule.optional(tModule.string),
		tileBadgeContexts = tModule.optional(tModule.string),
		thumbnailListIds = tModule.optional(tModule.string),
		tileTypes = tModule.optional(tModule.string),
		contentType = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.string) else nil,
		interactionUuid = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.string) else nil,
		hasSponsoredContent = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.boolean) else nil
	}) else nil else nil,
	recommended = tModule.strictInterface({
		absPositions = tModule.string,
		topicDataPositions = tModule.string,
		rootPlaceIds = tModule.string,
		universeIds = tModule.string,
		refId = tModule.string,
		adFlags = tModule.optional(tModule.string),
		adIds = tModule.optional(tModule.string),
		locale = tModule.optional(tModule.string),
		tileBadgeContexts = tModule.optional(tModule.string),
		mobileAdvertisingId = if fFlagLuaAppGameImpressionsMobileAdsId then tModule.optional(tModule.string) else nil,
		tileTypes = if luaAppFixRecommendedImpressionsInterface then tModule.optional(tModule.string) else nil,
		contentType = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.string) else nil,
		interactionUuid = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.string) else nil,
		hasSponsoredContent = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.boolean) else nil
	}),
	Deeplink = var10,
	InExpHistoryPage = if fFlagTraversalHistoryDiscoveryTelemetry then tModule.strictInterface({
		absPositions = tModule.string,
		positionsInRows = tModule.optional(tModule.string),
		rootPlaceIds = tModule.string,
		rows = tModule.string,
		rowsOnPage = tModule.string,
		topicDataPositions = tModule.string,
		universeIds = tModule.string,
		locale = tModule.optional(tModule.string),
		tileBadgeContexts = tModule.optional(tModule.string),
		contentType = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.string) else nil,
		interactionUuid = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.string) else nil,
		hasSponsoredContent = if fFlagLuaAppGameImpressionsAddUnifiedFields then tModule.optional(tModule.boolean) else nil
	}) else nil
}

return function(p0, p1, p2) --[[ line: 236 ]]
	-- upvalues: appPage (ref), var10 (ref), t (ref), discoveryEventErrorLogger (ref), fFlagLuaAppGameImpressionsAddUnifiedFields (ref), cryoModule (ref), httpService (ref), contentType (ref), fFlagLuaAppMigrateGameEventsTelemetryService (ref), telemetryService (ref), var7 (write), getPlatformTarget (ref), fFlagLuaAppGameEventsTelemetryServiceShadowTraffic (ref), var8 (write)
	local _ = nil
	local var12 = if p2.seeAllFlag and (p1 == appPage.Home or p1 == appPage.Games) then var10 else t[p1]
	
	if var12 then
		local var13, var14 = var12(p2)
		
		if not var13 then
			discoveryEventErrorLogger.reportError("GameImpressionsEventInvalidInterface", var14)
		end
	else
		discoveryEventErrorLogger.reportError("GameImpressionsEventMissingInterface", `Missing interface for eventContext {p1} to type check gameImpressions event parameters`, { eventContext = p1 })
	end
	if fFlagLuaAppGameImpressionsAddUnifiedFields then
		p2 = cryoModule.Dictionary.join({
			interactionUuid = httpService:GenerateGUID(false),
			contentType = contentType.Game
		}, p2)
	end
	if p2.analyticsData then
		p2 = cryoModule.Dictionary.join(p2.analyticsData, p2, { analyticsData = cryoModule.None })
	end
	if fFlagLuaAppMigrateGameEventsTelemetryService then
		telemetryService:LogEvent(var7, {
			eventContext = p1,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = p2,
			legacyOverrideTargetForEventIngest = getPlatformTarget()
		})
	else
		p0:sendEventDeferred(p1, "gameImpressions", p2)
	end
	if fFlagLuaAppGameEventsTelemetryServiceShadowTraffic then
		telemetryService:LogEvent(var8, {
			eventContext = p1,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = p2,
			legacyOverrideTargetForEventIngest = getPlatformTarget()
		})
	end
end