local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")
local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local CryoModule = require(Parent.Cryo)
local GetPlatformTargetFunction = require(Parent.Analytics).getPlatformTarget
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local FFlagEnableShareLinksInGameDetailEvent = require(Parent.SharedFlags).FFlagEnableShareLinksInGameDetailEvent
local FFlagEnableTopSongsSort = require(Parent.SharedFlags).FFlagEnableTopSongsSort
local FFlagLuaAppGameDetailEventMobileAdsId = require(Parent.SharedFlags).FFlagLuaAppGameDetailEventMobileAdsId
local FFlagLuaAppAddSubIdToHomeEvents = require(Parent.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents
local FFlagLuaAppMigrateGameEventsTelemetryService = require(Parent.SharedFlags).FFlagLuaAppMigrateGameEventsTelemetryService
local FFlagLuaAppGameEventsTelemetryServiceShadowTraffic = require(Parent.SharedFlags).FFlagLuaAppGameEventsTelemetryServiceShadowTraffic
local FFlagLuaAppGameItemTelemetryServiceTarget = require(Parent.SharedFlags).FFlagLuaAppGameItemTelemetryServiceTarget
local LuaAppGameDetailReferralEventThrottlingHundredthsPercent = game:DefineFastInt("LuaAppGameDetailReferralEventThrottlingHundredthsPercent", 10000)
local LuaAppGameDetailReferralShadowThrottlingHundredthsPercent = game:DefineFastInt("LuaAppGameDetailReferralShadowThrottlingHundredthsPercent", 10000)
local Config = if FFlagLuaAppMigrateGameEventsTelemetryService then {
	eventName = "gameDetailReferral",
	description = "Fires when the user navigates to game details",
	backends = { "EventIngest" },
	throttlingPercentage = LuaAppGameDetailReferralEventThrottlingHundredthsPercent,
	lastUpdated = { 26, 2, 4 }
} else nil
local Config1 = if FFlagLuaAppGameEventsTelemetryServiceShadowTraffic then {
	eventName = "gameDetailReferralShadow",
	description = "Shadow traffic for gameDetailReferral event recovery percentage",
	backends = { "EventIngest" },
	throttlingPercentage = LuaAppGameDetailReferralShadowThrottlingHundredthsPercent,
	lastUpdated = { 26, 3, 4 }
} else nil
local StrictInterfaceResult = TModule.strictInterface({
	pg = TModule.string,
	universeId = TModule.union(TModule.string, TModule.number),
	navigationUniverseId = TModule.optional(TModule.string),
	pos = TModule.optional(TModule.number),
	pid = TModule.optional(TModule.union(TModule.number, TModule.string)),
	sortPos = TModule.optional(TModule.number),
	ad = TModule.optional(TModule.string),
	isAd = TModule.optional(TModule.boolean),
	nativeAdData = TModule.optional(TModule.string),
	gameSetTargetId = TModule.optional(TModule.number),
	gameSetTypeId = TModule.optional(TModule.string),
	tis = TModule.optional(TModule.number),
	refId = TModule.optional(TModule.string),
	src = TModule.optional(TModule.string),
	friendId = TModule.optional(TModule.string),
	position = TModule.optional(TModule.number),
	absolutePosition = TModule.optional(TModule.number),
	fromWhere = TModule.optional(TModule.string),
	locale = TModule.optional(TModule.string),
	conversationId = TModule.optional(TModule.number),
	shareLinkType = if FFlagEnableShareLinksInGameDetailEvent then TModule.optional(TModule.string) else nil,
	shareLinkId = if FFlagEnableShareLinksInGameDetailEvent then TModule.optional(TModule.string) else nil,
	rowOnPage = TModule.optional(TModule.number),
	appliedFilters = TModule.optional(TModule.string),
	topicDataPosition = TModule.optional(TModule.number),
	refSongId = if FFlagEnableTopSongsSort then TModule.optional(TModule.string) else nil,
	isSdui = TModule.optional(TModule.boolean),
	contentType = TModule.optional(TModule.string),
	actionType = TModule.optional(TModule.string),
	interactionUuid = TModule.optional(TModule.string),
	positionInRow = TModule.optional(TModule.number),
	rowNumber = TModule.optional(TModule.number),
	heroUnitId = TModule.optional(TModule.string),
	loadSource = TModule.optional(TModule.string),
	tileType = TModule.optional(TModule.string),
	sortSubId = if FFlagLuaAppAddSubIdToHomeEvents then TModule.optional(TModule.string) else nil,
	analyticsData = TModule.optional(TModule.table)
})

local function _(p1)
	-- upvalues: AppStorageService (copy)
	local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
	
	if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
		p1.mobileAdvertisingId = MobileAdvertisingIdItem
	end
end

return function(p1, EventContext, Tbl)
	-- upvalues: StrictInterfaceResult (copy), DiscoveryEventErrorLogger (copy), HttpService (copy), FFlagLuaAppGameDetailEventMobileAdsId (copy), AppStorageService (copy), CryoModule (copy), FFlagLuaAppMigrateGameEventsTelemetryService (copy), TelemetryService (copy), Config (ref), FFlagLuaAppGameItemTelemetryServiceTarget (copy), GetPlatformTargetFunction (copy), FFlagLuaAppGameEventsTelemetryServiceShadowTraffic (copy), Config1 (ref)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(Tbl)
	
	if not StrictInterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("GameDetailReferralInvalidInterface", StrictInterfaceResultResult2)
	end
	if not Tbl.interactionUuid then
		Tbl.interactionUuid = HttpService:GenerateGUID(false)
	end
	if not Tbl.contentType then
		Tbl.contentType = "Game"
	end
	if not Tbl.actionType then
		Tbl.actionType = "OpenGameDetails"
	end
	if FFlagLuaAppGameDetailEventMobileAdsId then
		local JoinResult = Tbl
		local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
		
		if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
			JoinResult.mobileAdvertisingId = MobileAdvertisingIdItem
		end
	end
	if Tbl.analyticsData then
		Tbl = CryoModule.Dictionary.join(Tbl.analyticsData, Tbl, { analyticsData = CryoModule.None })
	end
	if FFlagLuaAppMigrateGameEventsTelemetryService then
		Tbl.isSdui = if Tbl.isSdui == true then "true" elseif Tbl.isSdui == false then "false" else nil
		Tbl.isAd = if Tbl.isAd == true then "true" elseif Tbl.isAd == false then "false" else nil
		TelemetryService:LogEvent(Config, {
			eventContext = EventContext,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = Tbl,
			legacyOverrideTargetForEventIngest = if FFlagLuaAppGameItemTelemetryServiceTarget then GetPlatformTargetFunction() else nil
		})
	else
		p1:sendEventDeferred(EventContext, "gameDetailReferral", Tbl)
	end
	if FFlagLuaAppGameEventsTelemetryServiceShadowTraffic then
		local Copy = table.clone(Tbl)
		Copy.isSdui = if Copy.isSdui == true then "true" elseif Copy.isSdui == false then "false" else Copy.isSdui
		Copy.isAd = if Copy.isAd == true then "true" elseif Copy.isAd == false then "false" else Copy.isAd
		TelemetryService:LogEvent(Config1, {
			eventContext = EventContext,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = Copy,
			legacyOverrideTargetForEventIngest = if FFlagLuaAppGameItemTelemetryServiceTarget then GetPlatformTargetFunction() else nil
		})
	end
end