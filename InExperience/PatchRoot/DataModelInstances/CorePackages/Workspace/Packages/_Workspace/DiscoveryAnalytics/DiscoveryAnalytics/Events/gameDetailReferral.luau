local httpService = game:GetService("HttpService")
local appStorageService = game:GetService("AppStorageService")
local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local cryoModule = require(parent.Cryo)
local getPlatformTarget = require(parent.Analytics).getPlatformTarget
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local fFlagEnableShareLinksInGameDetailEvent = require(parent.SharedFlags).FFlagEnableShareLinksInGameDetailEvent
local fFlagEnableTopSongsSort = require(parent.SharedFlags).FFlagEnableTopSongsSort
local fFlagLuaAppGameDetailEventMobileAdsId = require(parent.SharedFlags).FFlagLuaAppGameDetailEventMobileAdsId
local fFlagLuaAppAddSubIdToHomeEvents = require(parent.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents
local fFlagLuaAppMigrateGameEventsTelemetryService = require(parent.SharedFlags).FFlagLuaAppMigrateGameEventsTelemetryService
local fFlagLuaAppGameEventsTelemetryServiceShadowTraffic = require(parent.SharedFlags).FFlagLuaAppGameEventsTelemetryServiceShadowTraffic
local fFlagLuaAppGameItemTelemetryServiceTarget = require(parent.SharedFlags).FFlagLuaAppGameItemTelemetryServiceTarget
local var5 = if fFlagLuaAppMigrateGameEventsTelemetryService then {
	eventName = "gameDetailReferral",
	description = "Fires when the user navigates to game details",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaAppGameDetailReferralEventThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 2, 4 }
} else nil
local var6 = if fFlagLuaAppGameEventsTelemetryServiceShadowTraffic then {
	eventName = "gameDetailReferralShadow",
	description = "Shadow traffic for gameDetailReferral event recovery percentage",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaAppGameDetailReferralShadowThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 3, 4 }
} else nil
local var7 = tModule.strictInterface({
	pg = tModule.string,
	universeId = tModule.union(tModule.string, tModule.number),
	navigationUniverseId = tModule.optional(tModule.string),
	pos = tModule.optional(tModule.number),
	pid = tModule.optional(tModule.union(tModule.number, tModule.string)),
	sortPos = tModule.optional(tModule.number),
	ad = tModule.optional(tModule.string),
	isAd = tModule.optional(tModule.boolean),
	nativeAdData = tModule.optional(tModule.string),
	gameSetTargetId = tModule.optional(tModule.number),
	gameSetTypeId = tModule.optional(tModule.string),
	tis = tModule.optional(tModule.number),
	refId = tModule.optional(tModule.string),
	src = tModule.optional(tModule.string),
	friendId = tModule.optional(tModule.string),
	position = tModule.optional(tModule.number),
	absolutePosition = tModule.optional(tModule.number),
	fromWhere = tModule.optional(tModule.string),
	locale = tModule.optional(tModule.string),
	conversationId = tModule.optional(tModule.number),
	shareLinkType = if fFlagEnableShareLinksInGameDetailEvent then tModule.optional(tModule.string) else nil,
	shareLinkId = if fFlagEnableShareLinksInGameDetailEvent then tModule.optional(tModule.string) else nil,
	rowOnPage = tModule.optional(tModule.number),
	appliedFilters = tModule.optional(tModule.string),
	topicDataPosition = tModule.optional(tModule.number),
	refSongId = if fFlagEnableTopSongsSort then tModule.optional(tModule.string) else nil,
	isSdui = tModule.optional(tModule.boolean),
	contentType = tModule.optional(tModule.string),
	actionType = tModule.optional(tModule.string),
	interactionUuid = tModule.optional(tModule.string),
	positionInRow = tModule.optional(tModule.number),
	rowNumber = tModule.optional(tModule.number),
	heroUnitId = tModule.optional(tModule.string),
	loadSource = tModule.optional(tModule.string),
	tileType = tModule.optional(tModule.string),
	sortSubId = if fFlagLuaAppAddSubIdToHomeEvents then tModule.optional(tModule.string) else nil,
	analyticsData = tModule.optional(tModule.table)
})

local function _(p0) --[[ line: 92 | named "addMobileAdvertisingIdToEventParams" ]]
	-- upvalues: appStorageService (ref)
	local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
	
	if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
		p0.mobileAdvertisingId = mobileAdvertisingIdItem
	end
end

return function(p1, p2, p3) --[[ line: 99 ]]
	-- upvalues: var7 (ref), discoveryEventErrorLogger (ref), httpService (ref), fFlagLuaAppGameDetailEventMobileAdsId (ref), appStorageService (ref), cryoModule (ref), fFlagLuaAppMigrateGameEventsTelemetryService (ref), telemetryService (ref), var5 (write), fFlagLuaAppGameItemTelemetryServiceTarget (ref), getPlatformTarget (ref), fFlagLuaAppGameEventsTelemetryServiceShadowTraffic (ref), var6 (write)
	local var9, var10 = var7(p3)
	
	if not var9 then
		discoveryEventErrorLogger.reportError("GameDetailReferralInvalidInterface", var10)
	end
	if not p3.interactionUuid then
		p3.interactionUuid = httpService:GenerateGUID(false)
	end
	if not p3.contentType then
		p3.contentType = "Game"
	end
	if not p3.actionType then
		p3.actionType = "OpenGameDetails"
	end
	if fFlagLuaAppGameDetailEventMobileAdsId then
		local var11 = p3
		local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
		
		if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
			var11.mobileAdvertisingId = mobileAdvertisingIdItem
		end
	end
	if p3.analyticsData then
		p3 = cryoModule.Dictionary.join(p3.analyticsData, p3, { analyticsData = cryoModule.None })
	end
	if fFlagLuaAppMigrateGameEventsTelemetryService then
		p3.isSdui = if p3.isSdui == true then "true" elseif p3.isSdui == false then "false" else nil
		p3.isAd = if p3.isAd == true then "true" elseif p3.isAd == false then "false" else nil
		telemetryService:LogEvent(var5, {
			eventContext = p2,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = p3,
			legacyOverrideTargetForEventIngest = if fFlagLuaAppGameItemTelemetryServiceTarget then getPlatformTarget() else nil
		})
	else
		p1:sendEventDeferred(p2, "gameDetailReferral", p3)
	end
	if fFlagLuaAppGameEventsTelemetryServiceShadowTraffic then
		local cloned = table.clone(p3)
		cloned.isSdui = if cloned.isSdui == true then "true" elseif cloned.isSdui == false then "false" else cloned.isSdui
		cloned.isAd = if cloned.isAd == true then "true" elseif cloned.isAd == false then "false" else cloned.isAd
		telemetryService:LogEvent(var6, {
			eventContext = p2,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = cloned,
			legacyOverrideTargetForEventIngest = if fFlagLuaAppGameItemTelemetryServiceTarget then getPlatformTarget() else nil
		})
	end
end