local httpService = game:GetService("HttpService")
local appStorageService = game:GetService("AppStorageService")
local telemetryService = game:GetService("TelemetryService")
local discoveryAnalytics = script:FindFirstAncestor("DiscoveryAnalytics")
local parent = discoveryAnalytics.Parent
local cryoModule = require(parent.Cryo)
local getPlatformTarget = require(parent.Analytics).getPlatformTarget
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local fFlagLuaAppGamePlayIntentEventMobileAdsId = require(parent.SharedFlags).FFlagLuaAppGamePlayIntentEventMobileAdsId
local fFlagTraversalHistoryDiscoveryTelemetry = require(parent.SharedFlags).FFlagTraversalHistoryDiscoveryTelemetry
local luaAppRemoveNumericalSortIndexSearch = game:DefineFastFlag("LuaAppRemoveNumericalSortIndexSearch", false)
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagLuaAppMigrateGameEventsTelemetryService = require(parent.SharedFlags).FFlagLuaAppMigrateGameEventsTelemetryService
local fFlagLuaAppGameEventsTelemetryServiceShadowTraffic = require(parent.SharedFlags).FFlagLuaAppGameEventsTelemetryServiceShadowTraffic
local fFlagLuaAppContinueSortInstantPlay = require(parent.SharedFlags).FFlagLuaAppContinueSortInstantPlay
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local luaAppGamePlayIntentEventThrottlingHundredthsPercent = game:DefineFastInt("LuaAppGamePlayIntentEventThrottlingHundredthsPercent", 10000)
local luaAppGamePlayIntentShadowThrottlingHundredthsPercent = game:DefineFastInt("LuaAppGamePlayIntentShadowThrottlingHundredthsPercent", 10000)
local constantsModule = require(discoveryAnalytics.Constants)
local var10 = if fFlagLuaAppMigrateGameEventsTelemetryService then {
	eventName = "gamePlayIntent",
	description = "Fires when the user clicks on a Play Button",
	backends = { "EventIngest" },
	throttlingPercentage = luaAppGamePlayIntentEventThrottlingHundredthsPercent,
	lastUpdated = { 26, 2, 4 }
} else nil
local var11 = if fFlagLuaAppGameEventsTelemetryServiceShadowTraffic then {
	eventName = "gamePlayIntentShadow",
	description = "Shadow traffic for gamePlayIntent event recovery percentage",
	backends = { "EventIngest" },
	throttlingPercentage = luaAppGamePlayIntentShadowThrottlingHundredthsPercent,
	lastUpdated = { 26, 3, 4 }
} else nil
local var12 = tModule.strictInterface({
	placeId = tModule.string,
	rootPlaceId = tModule.number,
	universeId = tModule.string,
	referralSource = tModule.optional(tModule.string),
	sortIndex = tModule.string,
	sortEntryIndex = tModule.string,
	gameSetTypeId = tModule.optional(tModule.string),
	gameSetTargetId = tModule.optional(tModule.number),
	appliedFilters = tModule.optional(tModule.string),
	topicDataPosition = tModule.optional(tModule.number),
	nativeAdData = tModule.optional(tModule.string),
	pageName = tModule.optional(tModule.string),
	positionInRow = tModule.optional(tModule.number),
	rowNumber = tModule.optional(tModule.number),
	feedRowNumber = tModule.optional(tModule.number),
	heroUnitId = tModule.optional(tModule.string),
	loadSource = tModule.optional(tModule.string),
	launchData = tModule.optional(tModule.string),
	sortSubId = tModule.optional(tModule.string),
	tileType = tModule.string,
	analyticsData = tModule.optional(tModule.table),
	actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then tModule.optional(tModule.string) else nil
})
local t = {
	PlayButton = tModule.strictInterface({
		placeId = tModule.union(tModule.string, tModule.number),
		rootPlaceId = tModule.union(tModule.number, tModule.string),
		referralSource = tModule.optional(tModule.string),
		universeId = tModule.string,
		launchData = tModule.optional(tModule.string),
		tileType = tModule.optional(tModule.string),
		nativeAdData = tModule.optional(tModule.string),
		pageName = if fFlagSduiExperienceDetailsSupport then tModule.optional(tModule.string) else nil,
		actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then tModule.optional(tModule.string) else nil
	}),
	[constantsModule.Context.ExperienceTile] = var12,
	[constantsModule.Context.SearchExperienceTile] = tModule.strictInterface({
		placeId = tModule.string,
		rootPlaceId = tModule.number,
		universeId = tModule.string,
		sortEntryIndex = tModule.string,
		gameSetTypeId = tModule.string,
		sortIndex = if luaAppRemoveNumericalSortIndexSearch then tModule.string else tModule.union(tModule.string, tModule.number),
		rowOnPage = tModule.optional(tModule.number),
		topicDataPosition = tModule.optional(tModule.number),
		nativeAdData = tModule.optional(tModule.string),
		pageName = tModule.optional(tModule.string),
		launchData = tModule.optional(tModule.string),
		tileType = tModule.string,
		positionInRow = tModule.optional(tModule.number),
		rowNumber = tModule.optional(tModule.number),
		feedRowNumber = tModule.optional(tModule.number),
		actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then tModule.optional(tModule.string) else nil
	}),
	[constantsModule.Context.PeopleListInHomePage] = tModule.strictInterface({
		placeId = tModule.string,
		rootPlaceId = tModule.number,
		joinAttemptId = tModule.optional(tModule.string),
		friendId = tModule.string,
		pageName = if fFlagSduiExperienceDetailsSupport then tModule.optional(tModule.string) else nil
	}),
	[constantsModule.Context.GamePlayIntentInPlacesList] = tModule.strictInterface({
		placeId = tModule.string,
		rootPlaceId = tModule.number,
		joinAttemptId = tModule.optional(tModule.string),
		friendId = tModule.string,
		pageName = if fFlagSduiExperienceDetailsSupport then tModule.optional(tModule.string) else nil
	}),
	shareLinks = tModule.strictInterface({
		placeId = tModule.union(tModule.string, tModule.number),
		rootPlaceId = tModule.union(tModule.number, tModule.string),
		linkId = tModule.string,
		linkType = tModule.string,
		linkStatus = tModule.string,
		joinAttemptId = tModule.optional(tModule.string),
		pageName = if fFlagSduiExperienceDetailsSupport then tModule.optional(tModule.string) else nil
	}),
	PlayGameFromPlayTogether = tModule.strictInterface({
		placeId = tModule.union(tModule.string, tModule.number),
		rootPlaceId = tModule.union(tModule.number, tModule.string),
		referralSource = tModule.optional(tModule.string),
		sortIndex = tModule.optional(tModule.string),
		sortEntryIndex = tModule.optional(tModule.string),
		gameSetTypeId = tModule.optional(tModule.string),
		gameSetTargetId = tModule.optional(tModule.number),
		linkId = tModule.optional(tModule.union(tModule.string, tModule.number)),
		linkType = tModule.optional(tModule.string),
		linkStatus = tModule.optional(tModule.string),
		conversationId = tModule.optional(tModule.union(tModule.number, tModule.string)),
		joinAttemptId = tModule.optional(tModule.string),
		uid = tModule.optional(tModule.string),
		launchData = tModule.optional(tModule.string),
		pageName = if fFlagSduiExperienceDetailsSupport then tModule.optional(tModule.string) else nil
	}),
	PlayGameFromLinkCard = tModule.strictInterface({
		placeId = tModule.string,
		rootPlaceId = tModule.number,
		joinAttemptId = tModule.optional(tModule.string),
		conversationId = tModule.optional(tModule.string),
		pageName = if fFlagSduiExperienceDetailsSupport then tModule.optional(tModule.string) else nil
	}),
	[constantsModule.Context.PlayerContextualMenu] = tModule.strictInterface({
		friendId = tModule.string,
		pageName = tModule.string,
		placeId = tModule.optional(tModule.string),
		rootPlaceId = tModule.optional(tModule.string),
		joinAttemptId = tModule.string
	}),
	[constantsModule.Context.HoldToPlayLauncher] = tModule.strictInterface({
		placeId = tModule.string,
		rootPlaceId = tModule.number,
		universeId = tModule.string,
		referralSource = tModule.string,
		sortIndex = tModule.string,
		sortEntryIndex = tModule.string,
		gameSetTypeId = tModule.string,
		gameSetTargetId = tModule.optional(tModule.number),
		topicDataPosition = tModule.optional(tModule.number),
		nativeAdData = tModule.optional(tModule.string),
		pageName = tModule.optional(tModule.string),
		tileType = tModule.string,
		actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then tModule.optional(tModule.string) else nil
	}),
	[constantsModule.Context.InExpHistoryTile] = if fFlagTraversalHistoryDiscoveryTelemetry then if fFlagTraversalHistoryDiscoveryTelemetry then tModule.strictInterface({
		placeId = tModule.string,
		universeId = tModule.string,
		sortEntryIndex = tModule.string,
		pageName = if fFlagSduiExperienceDetailsSupport then tModule.optional(tModule.string) else nil
	}) else nil else nil,
	[constantsModule.Context.InstantPlay] = if fFlagLuaAppContinueSortInstantPlay then var12 else nil
}

local function _(p0)
	-- upvalues: appStorageService (ref)
	local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
	
	if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
		p0.mobileAdvertisingId = mobileAdvertisingIdItem
	end
end

return function(p1, p2, p3)
	-- upvalues: t (ref), discoveryEventErrorLogger (ref), httpService (ref), fFlagLuaAppGamePlayIntentEventMobileAdsId (ref), appStorageService (ref), fFlagLuaAppMigrateGameEventsTelemetryService (ref), cryoModule (ref), telemetryService (ref), var10 (write), getPlatformTarget (ref), fFlagLuaAppGameEventsTelemetryServiceShadowTraffic (ref), var11 (write)
	if t[p2] == nil then
		discoveryEventErrorLogger.reportError("GamePlayIntentMissingInterface", `Missing interface for eventContext {p2} to type check gamePlayIntent event parameters`, { eventContext = p2 })
	else
		local var15, var16 = t[p2](p3)
		
		if not var15 then
			discoveryEventErrorLogger.reportError("GamePlayIntentInvalidInterface", var16)
		end
	end
	local analyticsData = p3.analyticsData
	
	if not p3.interactionUuid then
		p3.interactionUuid = httpService:GenerateGUID(false)
	end
	if not p3.contentType then
		p3.contentType = "Game"
	end
	if not p3.actionType then
		p3.actionType = "PlayButtonClick"
	end
	if fFlagLuaAppGamePlayIntentEventMobileAdsId then
		local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
		
		if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
			p3.mobileAdvertisingId = mobileAdvertisingIdItem
		end
	end
	if fFlagLuaAppMigrateGameEventsTelemetryService then
		local t_1 = {
			placeId = p3.placeId,
			rootPlaceId = p3.rootPlaceId,
			universeId = p3.universeId,
			referralSource = p3.referralSource,
			sortIndex = p3.sortIndex,
			sortEntryIndex = p3.sortEntryIndex,
			gameSetTypeId = p3.gameSetTypeId,
			gameSetTargetId = p3.gameSetTargetId,
			linkId = p3.linkId,
			linkType = p3.linkType,
			linkStatus = p3.linkStatus,
			conversationId = p3.conversationId,
			joinAttemptId = p3.joinAttemptId,
			friendId = p3.friendId,
			pageName = p3.pageName,
			rowOnPage = p3.rowOnPage,
			appliedFilters = p3.appliedFilters,
			topicDataPosition = p3.topicDataPosition,
			nativeAdData = p3.nativeAdData,
			interactionUuid = p3.interactionUuid,
			contentType = p3.contentType,
			actionType = p3.actionType,
			positionInRow = p3.positionInRow,
			rowNumber = p3.rowNumber,
			feedRowNumber = p3.feedRowNumber,
			heroUnitId = p3.heroUnitId,
			mobileAdvertisingId = if fFlagLuaAppGamePlayIntentEventMobileAdsId then p3.mobileAdvertisingId else nil,
			loadSource = p3.loadSource,
			launchData = if p3.launchData then p3.launchData else nil,
			sortSubId = p3.sortSubId,
			tileType = p3.tileType
		}
		
		if analyticsData then
			t_1 = cryoModule.Dictionary.join(analyticsData, t_1)
		end
		telemetryService:LogEvent(var10, {
			eventContext = p2,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = t_1,
			legacyOverrideTargetForEventIngest = getPlatformTarget()
		})
	else
		local t_1 = {
			placeId = p3.placeId,
			rootPlaceId = p3.rootPlaceId,
			universeId = p3.universeId,
			referralSource = p3.referralSource,
			sortIndex = p3.sortIndex,
			sortEntryIndex = p3.sortEntryIndex,
			gameSetTypeId = p3.gameSetTypeId,
			gameSetTargetId = p3.gameSetTargetId,
			linkId = p3.linkId,
			linkType = p3.linkType,
			linkStatus = p3.linkStatus,
			conversationId = p3.conversationId,
			joinAttemptId = p3.joinAttemptId,
			friendId = p3.friendId,
			pageName = p3.pageName,
			rowOnPage = p3.rowOnPage,
			appliedFilters = p3.appliedFilters,
			topicDataPosition = p3.topicDataPosition,
			nativeAdData = p3.nativeAdData,
			interactionUuid = p3.interactionUuid,
			contentType = p3.contentType,
			actionType = p3.actionType,
			positionInRow = p3.positionInRow,
			rowNumber = p3.rowNumber,
			feedRowNumber = p3.feedRowNumber,
			heroUnitId = p3.heroUnitId,
			mobileAdvertisingId = if fFlagLuaAppGamePlayIntentEventMobileAdsId then p3.mobileAdvertisingId else nil,
			loadSource = p3.loadSource,
			launchData = if p3.launchData then p3.launchData else nil,
			sortSubId = p3.sortSubId,
			tileType = p3.tileType
		}
		
		if analyticsData then
			t_1 = cryoModule.Dictionary.join(analyticsData, t_1)
		end
		p1:sendEventDeferred(p2, "gamePlayIntent", t_1)
	end
	if fFlagLuaAppGameEventsTelemetryServiceShadowTraffic then
		telemetryService:LogEvent(var11, {
			eventContext = p2,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = {
				placeId = p3.placeId,
				rootPlaceId = p3.rootPlaceId,
				universeId = p3.universeId,
				referralSource = p3.referralSource,
				sortIndex = p3.sortIndex,
				sortEntryIndex = p3.sortEntryIndex,
				gameSetTypeId = p3.gameSetTypeId,
				gameSetTargetId = p3.gameSetTargetId,
				linkId = p3.linkId,
				linkType = p3.linkType,
				linkStatus = p3.linkStatus,
				conversationId = p3.conversationId,
				joinAttemptId = p3.joinAttemptId,
				friendId = p3.friendId,
				pageName = p3.pageName,
				rowOnPage = p3.rowOnPage,
				appliedFilters = p3.appliedFilters,
				topicDataPosition = p3.topicDataPosition,
				nativeAdData = p3.nativeAdData,
				interactionUuid = p3.interactionUuid,
				contentType = p3.contentType,
				actionType = p3.actionType,
				positionInRow = p3.positionInRow,
				rowNumber = p3.rowNumber,
				feedRowNumber = p3.feedRowNumber,
				heroUnitId = p3.heroUnitId,
				mobileAdvertisingId = if fFlagLuaAppGamePlayIntentEventMobileAdsId then p3.mobileAdvertisingId else nil,
				loadSource = p3.loadSource,
				launchData = if p3.launchData then p3.launchData else nil,
				sortSubId = p3.sortSubId,
				tileType = p3.tileType
			},
			legacyOverrideTargetForEventIngest = getPlatformTarget()
		})
	end
end