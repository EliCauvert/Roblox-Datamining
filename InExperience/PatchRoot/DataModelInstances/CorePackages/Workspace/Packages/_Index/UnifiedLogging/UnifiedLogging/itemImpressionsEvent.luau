local TelemetryService = game:GetService("TelemetryService")
local UnifiedLogging = script:FindFirstAncestor("UnifiedLogging")
local Parent = UnifiedLogging.Parent
local CryoModule = require(Parent.Cryo)
local GetPlatformTargetFunction = require(Parent.Analytics).getPlatformTarget
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local ContentTypeModule = require(UnifiedLogging.ContentType)
local FFlagLuaAppLoosenCollectionIdTypeInterface = require(Parent.SharedFlags).FFlagLuaAppLoosenCollectionIdTypeInterface
local FFlagProfilePlatformEnableImpressions = require(Parent.SharedFlags).FFlagProfilePlatformEnableImpressions
local FFlagItemImpressionsAddGameMetadata = require(Parent.SharedFlags).FFlagItemImpressionsAddGameMetadata
local FFlagEnableTopSongsSort = require(Parent.SharedFlags).FFlagEnableTopSongsSort
local FFlagLuaAppMigrateItemEventsTelemetryService = require(Parent.SharedFlags).FFlagLuaAppMigrateItemEventsTelemetryService
local FFlagLuaAppItemEventsTelemetryServiceShadowTraffic = require(Parent.SharedFlags).FFlagLuaAppItemEventsTelemetryServiceShadowTraffic
local LuaAppItemImpressionsEventThrottlingHundredthsPercent = game:DefineFastInt("LuaAppItemImpressionsEventThrottlingHundredthsPercent", 10000)
local LuaAppItemImpressionsShadowThrottlingHundredthsPercent = game:DefineFastInt("LuaAppItemImpressionsShadowThrottlingHundredthsPercent", 10000)
local Config = if FFlagLuaAppMigrateItemEventsTelemetryService then {
	eventName = "itemImpressions",
	description = "Fires when items become visible to the user, primarily through SDUI",
	backends = { "EventIngest" },
	throttlingPercentage = LuaAppItemImpressionsEventThrottlingHundredthsPercent,
	lastUpdated = { 26, 2, 4 }
} else nil
local Config1 = if FFlagLuaAppItemEventsTelemetryServiceShadowTraffic then {
	eventName = "itemImpressionsShadow",
	description = "Shadow traffic for itemImpressions event recovery percentage",
	backends = { "EventIngest" },
	throttlingPercentage = LuaAppItemImpressionsShadowThrottlingHundredthsPercent,
	lastUpdated = { 26, 3, 4 }
} else nil
local IntersectionResult = nil
local IntersectionResult1 = nil
local UnionResult = TModule.union(TModule.interface({
	collectionId = if FFlagLuaAppLoosenCollectionIdTypeInterface then TModule.union(TModule.string, TModule.number) else TModule.number,
	collectionIdStr = TModule.optional(TModule.string)
}), TModule.interface({
	collectionId = TModule.optional(if FFlagLuaAppLoosenCollectionIdTypeInterface then TModule.union(TModule.string, TModule.number) else TModule.number),
	collectionIdStr = TModule.string
}))
local config = {
	collectionPosition = TModule.number,
	totalNumberOfItems = TModule.number,
	contentType = TModule.string,
	itemIds = TModule.string,
	itemPositions = TModule.string,
	rowNumbers = TModule.optional(TModule.string),
	feedRowNumbers = TModule.optional(TModule.string),
	positionsInRow = TModule.optional(TModule.string),
	positionsInTopic = TModule.optional(TModule.string)
}
IntersectionResult1 = TModule.intersection(UnionResult, TModule.interface(config))
local IntersectionResult2 = TModule.intersection(UnionResult, TModule.interface(CryoModule.Dictionary.join(config, {
	sourceCarousel = TModule.string,
	friendStatuses = TModule.string,
	presences = TModule.string,
	presenceUniverseIds = TModule.string
})))

if FFlagItemImpressionsAddGameMetadata then
	IntersectionResult = TModule.intersection(UnionResult, TModule.interface(CryoModule.Dictionary.join(config, {
		universeId_arr = TModule.string,
		placeId_arr = TModule.string
	})))
end
local config1 = {
	[ContentTypeModule.User] = IntersectionResult2,
	[ContentTypeModule.Game] = if FFlagItemImpressionsAddGameMetadata and FFlagProfilePlatformEnableImpressions then IntersectionResult elseif FFlagProfilePlatformEnableImpressions then IntersectionResult1 else nil,
	[ContentTypeModule.Song] = if FFlagEnableTopSongsSort then IntersectionResult1 else nil,
	[ContentTypeModule.Badge] = IntersectionResult1
}

return function(p1, EventContext, p2, Tbl) --[[ Line: 117 ]]
	-- upvalues: config1 (copy), IntersectionResult1 (ref), DiscoveryEventErrorLogger (copy), FFlagLuaAppMigrateItemEventsTelemetryService (copy), TelemetryService (copy), Config (ref), GetPlatformTargetFunction (copy), FFlagLuaAppItemEventsTelemetryServiceShadowTraffic (copy), Config1 (ref)
	local Entry = config1[p2] or IntersectionResult1
	
	if Entry then
		local EntryResult, EntryResult2 = Entry(Tbl)
		
		if not EntryResult then
			DiscoveryEventErrorLogger.reportError("ItemImpressionsEventInvalidInterface", EntryResult2)
		end
	end
	if FFlagLuaAppMigrateItemEventsTelemetryService then
		for i, value in Tbl do
			if type(value) == "boolean" then
				Tbl[i] = if value == true then "true" elseif value == false then "false" else nil
			end
		end
		TelemetryService:LogEvent(Config, {
			eventContext = EventContext,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = Tbl,
			legacyOverrideTargetForEventIngest = GetPlatformTargetFunction()
		})
	else
		p1:sendEventDeferred(EventContext, "itemImpressions", Tbl)
	end
	if FFlagLuaAppItemEventsTelemetryServiceShadowTraffic then
		local Copy = table.clone(Tbl)
		
		for i1, value1 in Copy do
			if type(value1) == "boolean" then
				Copy[i1] = if value1 == true then "true" elseif value1 == false then "false" else nil
			end
		end
		TelemetryService:LogEvent(Config1, {
			eventContext = EventContext,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = Copy,
			legacyOverrideTargetForEventIngest = GetPlatformTargetFunction()
		})
	end
end