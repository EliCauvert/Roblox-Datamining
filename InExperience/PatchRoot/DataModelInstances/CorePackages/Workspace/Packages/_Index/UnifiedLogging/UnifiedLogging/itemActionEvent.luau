local HttpService = game:GetService("HttpService")
local TelemetryService = game:GetService("TelemetryService")
local UnifiedLogging = script:FindFirstAncestor("UnifiedLogging")
local Parent = UnifiedLogging.Parent
local GetPlatformTargetFunction = require(Parent.Analytics).getPlatformTarget
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local ContentTypeModule = require(UnifiedLogging.ContentType)
local FFlagLuaAppLoosenCollectionIdTypeInterface = require(Parent.SharedFlags).FFlagLuaAppLoosenCollectionIdTypeInterface
local FFlagLuaAppUnifiedLoggingDialogContentTypeModule = require(script.Parent.FFlagLuaAppUnifiedLoggingDialogContentType)
local FFlagLuaAppMigrateItemEventsTelemetryService = require(Parent.SharedFlags).FFlagLuaAppMigrateItemEventsTelemetryService
local FFlagLuaAppItemEventsTelemetryServiceShadowTraffic = require(Parent.SharedFlags).FFlagLuaAppItemEventsTelemetryServiceShadowTraffic
local LuaAppItemActionEventThrottlingHundredthsPercent = game:DefineFastInt("LuaAppItemActionEventThrottlingHundredthsPercent", 10000)
local LuaAppItemActionShadowThrottlingHundredthsPercent = game:DefineFastInt("LuaAppItemActionShadowThrottlingHundredthsPercent", 10000)
local Config = if FFlagLuaAppMigrateItemEventsTelemetryService then {
	eventName = "itemAction",
	description = "Fires for default user actions, primarily through SDUI",
	backends = { "EventIngest" },
	throttlingPercentage = LuaAppItemActionEventThrottlingHundredthsPercent,
	lastUpdated = { 26, 2, 4 }
} else nil
local Config1 = if FFlagLuaAppItemEventsTelemetryServiceShadowTraffic then {
	eventName = "itemActionShadow",
	description = "Shadow traffic for itemAction event recovery percentage",
	backends = { "EventIngest" },
	throttlingPercentage = LuaAppItemActionShadowThrottlingHundredthsPercent,
	lastUpdated = { 26, 3, 4 }
} else nil
local IntersectionResult = nil
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
	itemId = TModule.optional(TModule.string),
	itemPosition = TModule.optional(TModule.number),
	positionInRow = TModule.optional(TModule.number),
	rowNumber = TModule.optional(TModule.number),
	feedRowNumber = TModule.optional(TModule.number),
	positionInTopic = TModule.optional(TModule.number),
	actionType = TModule.string,
	interactionUuid = TModule.optional(TModule.string)
}
IntersectionResult = TModule.intersection(UnionResult, TModule.interface(config))
local InterfaceResult = if FFlagLuaAppUnifiedLoggingDialogContentTypeModule then TModule.interface({
	contentType = TModule.string,
	actionType = TModule.string,
	interactionUuid = TModule.optional(TModule.string)
}) else nil
local config1 = {
	[ContentTypeModule.User] = TModule.intersection(UnionResult, TModule.interface(require(Parent.Cryo).Dictionary.join(config, {
		itemId = TModule.string,
		itemPosition = TModule.number,
		sourceCarousel = TModule.string,
		friendStatus = TModule.string,
		presence = TModule.string,
		presenceUniverseId = TModule.string
	})))
}

if FFlagLuaAppUnifiedLoggingDialogContentTypeModule then
	config1[ContentTypeModule.Dialog] = InterfaceResult
end
return function(p1, EventContext, p2, Tbl)
	-- upvalues: config1 (copy), IntersectionResult (ref), DiscoveryEventErrorLogger (copy), HttpService (copy), FFlagLuaAppMigrateItemEventsTelemetryService (copy), TelemetryService (copy), Config (ref), GetPlatformTargetFunction (copy), FFlagLuaAppItemEventsTelemetryServiceShadowTraffic (copy), Config1 (ref)
	local Entry = config1[p2] or IntersectionResult
	
	if Entry then
		local EntryResult, EntryResult2 = Entry(Tbl)
		
		if not EntryResult then
			DiscoveryEventErrorLogger.reportError("ItemActionEventInvalidInterface", EntryResult2)
		end
	end
	if not Tbl.interactionUuid then
		Tbl.interactionUuid = HttpService:GenerateGUID(false)
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
		p1:sendEventDeferred(EventContext, "itemAction", Tbl)
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