local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")
local TelemetryService = game:GetService("TelemetryService")
local DiscoveryAnalytics = script:FindFirstAncestor("DiscoveryAnalytics")
local Parent = DiscoveryAnalytics.Parent
local CryoModule = require(Parent.Cryo)
local GetPlatformTargetFunction = require(Parent.Analytics).getPlatformTarget
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local FFlagEnableInGameExitModalNextUpUi = require(Parent.SharedFlags).FFlagEnableInGameExitModalNextUpUi
local FFlagLuaAppGamePlayIntentEventMobileAdsId = require(Parent.SharedFlags).FFlagLuaAppGamePlayIntentEventMobileAdsId
local FFlagTraversalHistoryDiscoveryTelemetry = require(Parent.SharedFlags).FFlagTraversalHistoryDiscoveryTelemetry
local FFlagLuaAppAddSubIdToHomeEvents = require(Parent.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents
local FFlagLuaAppFixCustomTileBugs = require(Parent.SharedFlags).FFlagLuaAppFixCustomTileBugs
local FFlagLuaAppFixCustomTileBugs1 = game:DefineFastFlag("LuaAppRemoveNumericalSortIndexSearch", false) and FFlagLuaAppFixCustomTileBugs
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagLuaAppMigrateGameEventsTelemetryService = require(Parent.SharedFlags).FFlagLuaAppMigrateGameEventsTelemetryService
local FFlagLuaAppGameEventsTelemetryServiceShadowTraffic = require(Parent.SharedFlags).FFlagLuaAppGameEventsTelemetryServiceShadowTraffic
local FFlagLuaAppGameItemTelemetryServiceTarget = require(Parent.SharedFlags).FFlagLuaAppGameItemTelemetryServiceTarget
local LuaAppGamePlayIntentEventThrottlingHundredthsPercent = game:DefineFastInt("LuaAppGamePlayIntentEventThrottlingHundredthsPercent", 10000)
local LuaAppGamePlayIntentShadowThrottlingHundredthsPercent = game:DefineFastInt("LuaAppGamePlayIntentShadowThrottlingHundredthsPercent", 10000)
local ConstantsModule = require(DiscoveryAnalytics.Constants)
local Config = if FFlagLuaAppMigrateGameEventsTelemetryService then {
	eventName = "gamePlayIntent",
	description = "Fires when the user clicks on a Play Button",
	backends = { "EventIngest" },
	throttlingPercentage = LuaAppGamePlayIntentEventThrottlingHundredthsPercent,
	lastUpdated = { 26, 2, 4 }
} else nil
local Config1 = if FFlagLuaAppGameEventsTelemetryServiceShadowTraffic then {
	eventName = "gamePlayIntentShadow",
	description = "Shadow traffic for gamePlayIntent event recovery percentage",
	backends = { "EventIngest" },
	throttlingPercentage = LuaAppGamePlayIntentShadowThrottlingHundredthsPercent,
	lastUpdated = { 26, 3, 4 }
} else nil
local StrictInterfaceResult = if FFlagEnableInGameExitModalNextUpUi then TModule.strictInterface({
	placeId = TModule.string,
	rootPlaceId = TModule.number,
	universeId = TModule.string,
	sortEntryIndex = TModule.string,
	gameSetTypeId = TModule.string,
	joinAttemptId = TModule.string,
	pageName = if FFlagSduiExperienceDetailsSupport then TModule.optional(TModule.string) else nil
}) else nil
local StrictInterfaceResult1 = if FFlagTraversalHistoryDiscoveryTelemetry then TModule.strictInterface({
	placeId = TModule.string,
	universeId = TModule.string,
	sortEntryIndex = TModule.string,
	pageName = if FFlagSduiExperienceDetailsSupport then TModule.optional(TModule.string) else nil
}) else nil
local config = {
	PlayButton = TModule.strictInterface({
		placeId = TModule.union(TModule.string, TModule.number),
		rootPlaceId = TModule.union(TModule.number, TModule.string),
		referralSource = TModule.optional(TModule.string),
		universeId = TModule.string,
		launchData = TModule.optional(TModule.string),
		tileType = TModule.optional(TModule.string),
		nativeAdData = TModule.optional(TModule.string),
		pageName = if FFlagSduiExperienceDetailsSupport then TModule.optional(TModule.string) else nil
	}),
	[ConstantsModule.Context.ExperienceTile] = TModule.strictInterface({
		placeId = TModule.string,
		rootPlaceId = TModule.number,
		universeId = TModule.string,
		referralSource = TModule.optional(TModule.string),
		sortIndex = TModule.string,
		sortEntryIndex = TModule.string,
		gameSetTypeId = TModule.optional(TModule.string),
		gameSetTargetId = TModule.optional(TModule.number),
		appliedFilters = TModule.optional(TModule.string),
		topicDataPosition = TModule.optional(TModule.number),
		nativeAdData = TModule.optional(TModule.string),
		pageName = TModule.optional(TModule.string),
		positionInRow = TModule.optional(TModule.number),
		rowNumber = TModule.optional(TModule.number),
		feedRowNumber = TModule.optional(TModule.number),
		heroUnitId = TModule.optional(TModule.string),
		loadSource = TModule.optional(TModule.string),
		launchData = TModule.optional(TModule.string),
		sortSubId = if FFlagLuaAppAddSubIdToHomeEvents then TModule.optional(TModule.string) else nil,
		tileType = TModule.string,
		analyticsData = TModule.optional(TModule.table)
	}),
	[ConstantsModule.Context.SearchExperienceTile] = TModule.strictInterface({
		placeId = TModule.string,
		rootPlaceId = TModule.number,
		universeId = TModule.string,
		sortEntryIndex = TModule.string,
		gameSetTypeId = TModule.string,
		sortIndex = if FFlagLuaAppFixCustomTileBugs1 then TModule.string elseif FFlagLuaAppFixCustomTileBugs then TModule.union(TModule.string, TModule.number) else TModule.number,
		rowOnPage = TModule.optional(TModule.number),
		topicDataPosition = TModule.optional(TModule.number),
		nativeAdData = TModule.optional(TModule.string),
		pageName = TModule.optional(TModule.string),
		launchData = TModule.optional(TModule.string),
		tileType = TModule.string,
		positionInRow = if FFlagLuaAppFixCustomTileBugs then TModule.optional(TModule.number) else nil,
		rowNumber = if FFlagLuaAppFixCustomTileBugs then TModule.optional(TModule.number) else nil,
		feedRowNumber = if FFlagLuaAppFixCustomTileBugs then TModule.optional(TModule.number) else nil
	}),
	[ConstantsModule.Context.PeopleListInHomePage] = TModule.strictInterface({
		placeId = TModule.string,
		rootPlaceId = TModule.number,
		joinAttemptId = TModule.optional(TModule.string),
		friendId = TModule.string,
		pageName = if FFlagSduiExperienceDetailsSupport then TModule.optional(TModule.string) else nil
	}),
	[ConstantsModule.Context.GamePlayIntentInPlacesList] = TModule.strictInterface({
		placeId = TModule.string,
		rootPlaceId = TModule.number,
		joinAttemptId = TModule.optional(TModule.string),
		friendId = TModule.string,
		pageName = if FFlagSduiExperienceDetailsSupport then TModule.optional(TModule.string) else nil
	}),
	shareLinks = TModule.strictInterface({
		placeId = TModule.union(TModule.string, TModule.number),
		rootPlaceId = TModule.union(TModule.number, TModule.string),
		linkId = TModule.string,
		linkType = TModule.string,
		linkStatus = TModule.string,
		joinAttemptId = TModule.optional(TModule.string),
		pageName = if FFlagSduiExperienceDetailsSupport then TModule.optional(TModule.string) else nil
	}),
	PlayGameFromPlayTogether = TModule.strictInterface({
		placeId = TModule.union(TModule.string, TModule.number),
		rootPlaceId = TModule.union(TModule.number, TModule.string),
		referralSource = TModule.optional(TModule.string),
		sortIndex = TModule.optional(TModule.string),
		sortEntryIndex = TModule.optional(TModule.string),
		gameSetTypeId = TModule.optional(TModule.string),
		gameSetTargetId = TModule.optional(TModule.number),
		linkId = TModule.optional(TModule.union(TModule.string, TModule.number)),
		linkType = TModule.optional(TModule.string),
		linkStatus = TModule.optional(TModule.string),
		conversationId = TModule.optional(TModule.union(TModule.number, TModule.string)),
		joinAttemptId = TModule.optional(TModule.string),
		uid = TModule.optional(TModule.string),
		launchData = TModule.optional(TModule.string),
		pageName = if FFlagSduiExperienceDetailsSupport then TModule.optional(TModule.string) else nil
	}),
	PlayGameFromLinkCard = TModule.strictInterface({
		placeId = TModule.string,
		rootPlaceId = TModule.number,
		joinAttemptId = TModule.optional(TModule.string),
		conversationId = TModule.optional(TModule.string),
		pageName = if FFlagSduiExperienceDetailsSupport then TModule.optional(TModule.string) else nil
	}),
	[ConstantsModule.Context.PlayerContextualMenu] = TModule.strictInterface({
		friendId = TModule.string,
		pageName = TModule.string,
		placeId = TModule.optional(TModule.string),
		rootPlaceId = TModule.optional(TModule.string),
		joinAttemptId = TModule.string
	}),
	[ConstantsModule.Context.HoldToPlayLauncher] = TModule.strictInterface({
		placeId = TModule.string,
		rootPlaceId = TModule.number,
		universeId = TModule.string,
		referralSource = TModule.string,
		sortIndex = TModule.string,
		sortEntryIndex = TModule.string,
		gameSetTypeId = TModule.string,
		gameSetTargetId = TModule.optional(TModule.number),
		topicDataPosition = TModule.optional(TModule.number),
		nativeAdData = TModule.optional(TModule.string),
		pageName = TModule.optional(TModule.string),
		tileType = TModule.string
	}),
	[ConstantsModule.Context.InExpHistoryTile] = if FFlagTraversalHistoryDiscoveryTelemetry then StrictInterfaceResult1 else nil,
	InGameExitPage = if FFlagEnableInGameExitModalNextUpUi then StrictInterfaceResult else nil
}

local function _(p1)
	-- upvalues: AppStorageService (copy)
	local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
	
	if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
		p1.mobileAdvertisingId = MobileAdvertisingIdItem
	end
end

return function(p1, EventContext, JoinResult)
	-- upvalues: config (copy), DiscoveryEventErrorLogger (copy), HttpService (copy), FFlagLuaAppGamePlayIntentEventMobileAdsId (copy), AppStorageService (copy), FFlagLuaAppMigrateGameEventsTelemetryService (copy), FFlagLuaAppAddSubIdToHomeEvents (copy), CryoModule (copy), TelemetryService (copy), Config (ref), FFlagLuaAppGameItemTelemetryServiceTarget (copy), GetPlatformTargetFunction (copy), FFlagLuaAppGameEventsTelemetryServiceShadowTraffic (copy), Config1 (ref)
	if config[EventContext] == nil then
		DiscoveryEventErrorLogger.reportError("GamePlayIntentMissingInterface", `Missing interface for eventContext {EventContext} to type check gamePlayIntent event parameters`, { eventContext = EventContext })
	else
		local v1, v2 = config[EventContext](JoinResult)
		
		if not v1 then
			DiscoveryEventErrorLogger.reportError("GamePlayIntentInvalidInterface", v2)
		end
	end
	local AnalyticsData = JoinResult.analyticsData
	
	if not JoinResult.interactionUuid then
		JoinResult.interactionUuid = HttpService:GenerateGUID(false)
	end
	if not JoinResult.contentType then
		JoinResult.contentType = "Game"
	end
	if not JoinResult.actionType then
		JoinResult.actionType = "PlayButtonClick"
	end
	if FFlagLuaAppGamePlayIntentEventMobileAdsId then
		local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
		
		if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
			JoinResult.mobileAdvertisingId = MobileAdvertisingIdItem
		end
	end
	if FFlagLuaAppMigrateGameEventsTelemetryService then
		local JoinResult1 = {
			placeId = JoinResult.placeId,
			rootPlaceId = JoinResult.rootPlaceId,
			universeId = JoinResult.universeId,
			referralSource = JoinResult.referralSource,
			sortIndex = JoinResult.sortIndex,
			sortEntryIndex = JoinResult.sortEntryIndex,
			gameSetTypeId = JoinResult.gameSetTypeId,
			gameSetTargetId = JoinResult.gameSetTargetId,
			linkId = JoinResult.linkId,
			linkType = JoinResult.linkType,
			linkStatus = JoinResult.linkStatus,
			conversationId = JoinResult.conversationId,
			joinAttemptId = JoinResult.joinAttemptId,
			friendId = JoinResult.friendId,
			pageName = JoinResult.pageName,
			rowOnPage = JoinResult.rowOnPage,
			appliedFilters = JoinResult.appliedFilters,
			topicDataPosition = JoinResult.topicDataPosition,
			nativeAdData = JoinResult.nativeAdData,
			interactionUuid = JoinResult.interactionUuid,
			contentType = JoinResult.contentType,
			actionType = JoinResult.actionType,
			positionInRow = JoinResult.positionInRow,
			rowNumber = JoinResult.rowNumber,
			feedRowNumber = JoinResult.feedRowNumber,
			heroUnitId = JoinResult.heroUnitId,
			mobileAdvertisingId = if FFlagLuaAppGamePlayIntentEventMobileAdsId then JoinResult.mobileAdvertisingId else nil,
			loadSource = JoinResult.loadSource,
			launchData = if JoinResult.launchData then JoinResult.launchData else nil,
			sortSubId = if FFlagLuaAppAddSubIdToHomeEvents then JoinResult.sortSubId else nil,
			tileType = JoinResult.tileType
		}
		
		if AnalyticsData then
			JoinResult1 = CryoModule.Dictionary.join(AnalyticsData, JoinResult1)
		end
		TelemetryService:LogEvent(Config, {
			eventContext = EventContext,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = JoinResult1,
			legacyOverrideTargetForEventIngest = if FFlagLuaAppGameItemTelemetryServiceTarget then GetPlatformTargetFunction() else nil
		})
	else
		local JoinResult2 = {
			placeId = JoinResult.placeId,
			rootPlaceId = JoinResult.rootPlaceId,
			universeId = JoinResult.universeId,
			referralSource = JoinResult.referralSource,
			sortIndex = JoinResult.sortIndex,
			sortEntryIndex = JoinResult.sortEntryIndex,
			gameSetTypeId = JoinResult.gameSetTypeId,
			gameSetTargetId = JoinResult.gameSetTargetId,
			linkId = JoinResult.linkId,
			linkType = JoinResult.linkType,
			linkStatus = JoinResult.linkStatus,
			conversationId = JoinResult.conversationId,
			joinAttemptId = JoinResult.joinAttemptId,
			friendId = JoinResult.friendId,
			pageName = JoinResult.pageName,
			rowOnPage = JoinResult.rowOnPage,
			appliedFilters = JoinResult.appliedFilters,
			topicDataPosition = JoinResult.topicDataPosition,
			nativeAdData = JoinResult.nativeAdData,
			interactionUuid = JoinResult.interactionUuid,
			contentType = JoinResult.contentType,
			actionType = JoinResult.actionType,
			positionInRow = JoinResult.positionInRow,
			rowNumber = JoinResult.rowNumber,
			feedRowNumber = JoinResult.feedRowNumber,
			heroUnitId = JoinResult.heroUnitId,
			mobileAdvertisingId = if FFlagLuaAppGamePlayIntentEventMobileAdsId then JoinResult.mobileAdvertisingId else nil,
			loadSource = JoinResult.loadSource,
			launchData = if JoinResult.launchData then JoinResult.launchData else nil,
			sortSubId = if FFlagLuaAppAddSubIdToHomeEvents then JoinResult.sortSubId else nil,
			tileType = JoinResult.tileType
		}
		
		if AnalyticsData then
			JoinResult2 = CryoModule.Dictionary.join(AnalyticsData, JoinResult2)
		end
		p1:sendEventDeferred(EventContext, "gamePlayIntent", JoinResult2)
	end
	if FFlagLuaAppGameEventsTelemetryServiceShadowTraffic then
		TelemetryService:LogEvent(Config1, {
			eventContext = EventContext,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = {
				placeId = JoinResult.placeId,
				rootPlaceId = JoinResult.rootPlaceId,
				universeId = JoinResult.universeId,
				referralSource = JoinResult.referralSource,
				sortIndex = JoinResult.sortIndex,
				sortEntryIndex = JoinResult.sortEntryIndex,
				gameSetTypeId = JoinResult.gameSetTypeId,
				gameSetTargetId = JoinResult.gameSetTargetId,
				linkId = JoinResult.linkId,
				linkType = JoinResult.linkType,
				linkStatus = JoinResult.linkStatus,
				conversationId = JoinResult.conversationId,
				joinAttemptId = JoinResult.joinAttemptId,
				friendId = JoinResult.friendId,
				pageName = JoinResult.pageName,
				rowOnPage = JoinResult.rowOnPage,
				appliedFilters = JoinResult.appliedFilters,
				topicDataPosition = JoinResult.topicDataPosition,
				nativeAdData = JoinResult.nativeAdData,
				interactionUuid = JoinResult.interactionUuid,
				contentType = JoinResult.contentType,
				actionType = JoinResult.actionType,
				positionInRow = JoinResult.positionInRow,
				rowNumber = JoinResult.rowNumber,
				feedRowNumber = JoinResult.feedRowNumber,
				heroUnitId = JoinResult.heroUnitId,
				mobileAdvertisingId = if FFlagLuaAppGamePlayIntentEventMobileAdsId then JoinResult.mobileAdvertisingId else nil,
				loadSource = JoinResult.loadSource,
				launchData = if JoinResult.launchData then JoinResult.launchData else nil,
				sortSubId = if FFlagLuaAppAddSubIdToHomeEvents then JoinResult.sortSubId else nil,
				tileType = JoinResult.tileType
			},
			legacyOverrideTargetForEventIngest = if FFlagLuaAppGameItemTelemetryServiceTarget then GetPlatformTargetFunction() else nil
		})
	end
end