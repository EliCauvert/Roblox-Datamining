local telemetryService = game:GetService("TelemetryService")
local unifiedLogging = script:FindFirstAncestor("UnifiedLogging")
local parent = unifiedLogging.Parent
local cryoModule = require(parent.Cryo)
local getPlatformTarget = require(parent.Analytics).getPlatformTarget
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local contentTypeModule = require(unifiedLogging.ContentType)
local fFlagLuaAppLoosenCollectionIdTypeInterface = require(parent.SharedFlags).FFlagLuaAppLoosenCollectionIdTypeInterface
local fFlagProfilePlatformEnableImpressions = require(parent.SharedFlags).FFlagProfilePlatformEnableImpressions
local fFlagItemImpressionsAddGameMetadata = require(parent.SharedFlags).FFlagItemImpressionsAddGameMetadata
local fFlagEnableTopSongsSort = require(parent.SharedFlags).FFlagEnableTopSongsSort
local fFlagLuaAppMigrateItemEventsTelemetryService = require(parent.SharedFlags).FFlagLuaAppMigrateItemEventsTelemetryService
local fFlagLuaAppItemEventsTelemetryServiceShadowTraffic = require(parent.SharedFlags).FFlagLuaAppItemEventsTelemetryServiceShadowTraffic
local var5 = if fFlagLuaAppMigrateItemEventsTelemetryService then {
	eventName = "itemImpressions",
	description = "Fires when items become visible to the user, primarily through SDUI",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaAppItemImpressionsEventThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 2, 4 }
} else nil
local var6 = if fFlagLuaAppItemEventsTelemetryServiceShadowTraffic then {
	eventName = "itemImpressionsShadow",
	description = "Shadow traffic for itemImpressions event recovery percentage",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaAppItemImpressionsShadowThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 3, 4 }
} else nil
local var7 = nil
local _ = nil
local _ = nil
local var8 = tModule.union(tModule.interface({
	collectionId = if fFlagLuaAppLoosenCollectionIdTypeInterface then tModule.union(tModule.string, tModule.number) else tModule.number,
	collectionIdStr = tModule.optional(tModule.string)
}), tModule.interface({
	collectionId = tModule.optional(if fFlagLuaAppLoosenCollectionIdTypeInterface then tModule.union(tModule.string, tModule.number) else tModule.number),
	collectionIdStr = tModule.string
}))
local t = {
	collectionPosition = tModule.number,
	totalNumberOfItems = tModule.number,
	contentType = tModule.string,
	itemIds = tModule.string,
	itemPositions = tModule.string,
	rowNumbers = tModule.optional(tModule.string),
	feedRowNumbers = tModule.optional(tModule.string),
	positionsInRow = tModule.optional(tModule.string),
	positionsInTopic = tModule.optional(tModule.string)
}
local var10 = tModule.intersection(var8, tModule.interface(t))
local var11 = tModule.intersection(var8, tModule.interface(cryoModule.Dictionary.join(t, {
	sourceCarousel = tModule.string,
	friendStatuses = tModule.string,
	presences = tModule.string,
	presenceUniverseIds = tModule.string
})))

if fFlagItemImpressionsAddGameMetadata then
	var7 = tModule.intersection(var8, tModule.interface(cryoModule.Dictionary.join(t, {
		universeId_arr = tModule.string,
		placeId_arr = tModule.string
	})))
end
var11 = {
	[contentTypeModule.User] = var11,
	[contentTypeModule.Game] = if fFlagItemImpressionsAddGameMetadata and fFlagProfilePlatformEnableImpressions then var7 elseif fFlagProfilePlatformEnableImpressions then var10 else nil,
	[contentTypeModule.Song] = if fFlagEnableTopSongsSort then var10 else nil,
	[contentTypeModule.Badge] = var10
}

return function(p0, p1, p2, p3)
	-- upvalues: var11 (ref), var10 (write), discoveryEventErrorLogger (ref), fFlagLuaAppMigrateItemEventsTelemetryService (ref), telemetryService (ref), var5 (write), getPlatformTarget (ref), fFlagLuaAppItemEventsTelemetryServiceShadowTraffic (ref), var6 (write)
	local var12 = var11[p2] or var10
	
	if var12 then
		local var13, var14 = var12(p3)
		
		if not var13 then
			discoveryEventErrorLogger.reportError("ItemImpressionsEventInvalidInterface", var14)
		end
	end
	if fFlagLuaAppMigrateItemEventsTelemetryService then
		for i, v in p3 do
			if type(v) == "boolean" then
				p3[i] = if v == true then "true" elseif v == false then "false" else nil
			end
		end
		telemetryService:LogEvent(var5, {
			eventContext = p1,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = p3,
			legacyOverrideTargetForEventIngest = getPlatformTarget()
		})
	else
		p0:sendEventDeferred(p1, "itemImpressions", p3)
	end
	if fFlagLuaAppItemEventsTelemetryServiceShadowTraffic then
		local cloned = table.clone(p3)
		
		for i, v in cloned do
			if type(v) == "boolean" then
				cloned[i] = if v == true then "true" elseif v == false then "false" else nil
			end
		end
		telemetryService:LogEvent(var6, {
			eventContext = p1,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = cloned,
			legacyOverrideTargetForEventIngest = getPlatformTarget()
		})
	end
end