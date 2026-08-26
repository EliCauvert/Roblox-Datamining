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
local var1 = if fFlagLuaAppMigrateItemEventsTelemetryService then {
	eventName = "itemImpressions",
	description = "Fires when items become visible to the user, primarily through SDUI",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaAppItemImpressionsEventThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 2, 4 }
} else nil
local var2 = if fFlagLuaAppItemEventsTelemetryServiceShadowTraffic then {
	eventName = "itemImpressionsShadow",
	description = "Shadow traffic for itemImpressions event recovery percentage",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaAppItemImpressionsShadowThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 3, 4 }
} else nil
local var3 = nil
local _ = nil
local _ = nil
local var4 = tModule.union(tModule.interface({
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
local var5 = tModule.intersection(var4, tModule.interface(t))
local var6 = tModule.intersection(var4, tModule.interface(cryoModule.Dictionary.join(t, {
	sourceCarousel = tModule.string,
	friendStatuses = tModule.string,
	presences = tModule.string,
	presenceUniverseIds = tModule.string
})))

if fFlagItemImpressionsAddGameMetadata then
	var3 = tModule.intersection(var4, tModule.interface(cryoModule.Dictionary.join(t, {
		universeId_arr = tModule.string,
		placeId_arr = tModule.string
	})))
end
var6 = {
	[contentTypeModule.User] = var6,
	[contentTypeModule.Game] = if fFlagItemImpressionsAddGameMetadata and fFlagProfilePlatformEnableImpressions then var3 elseif fFlagProfilePlatformEnableImpressions then var5 else nil,
	[contentTypeModule.Song] = if fFlagEnableTopSongsSort then var5 else nil,
	[contentTypeModule.Badge] = var5
}

return function(p1, p2, p3, p4)
	-- upvalues: var6 (ref), var5 (write), discoveryEventErrorLogger (ref), fFlagLuaAppMigrateItemEventsTelemetryService (ref), telemetryService (ref), var1 (write), getPlatformTarget (ref), fFlagLuaAppItemEventsTelemetryServiceShadowTraffic (ref), var2 (write)
	local var7 = var6[p3] or var5
	
	if var7 then
		local var8, var9 = var7(p4)
		
		if not var8 then
			discoveryEventErrorLogger.reportError("ItemImpressionsEventInvalidInterface", var9)
		end
	end
	if fFlagLuaAppMigrateItemEventsTelemetryService then
		for i, v in p4 do
			if type(v) == "boolean" then
				p4[i] = if v == true then "true" elseif v == false then "false" else nil
			end
		end
		telemetryService:LogEvent(var1, {
			eventContext = p2,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = p4,
			legacyOverrideTargetForEventIngest = getPlatformTarget()
		})
	else
		p1:sendEventDeferred(p2, "itemImpressions", p4)
	end
	if fFlagLuaAppItemEventsTelemetryServiceShadowTraffic then
		local cloned = table.clone(p4)
		
		for i, v in cloned do
			if type(v) == "boolean" then
				cloned[i] = if v == true then "true" elseif v == false then "false" else nil
			end
		end
		telemetryService:LogEvent(var2, {
			eventContext = p2,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = cloned,
			legacyOverrideTargetForEventIngest = getPlatformTarget()
		})
	end
end