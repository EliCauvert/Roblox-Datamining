local httpService = game:GetService("HttpService")
local telemetryService = game:GetService("TelemetryService")
local unifiedLogging = script:FindFirstAncestor("UnifiedLogging")
local parent = unifiedLogging.Parent
local _ = require(parent.Cryo)
local getPlatformTarget = require(parent.Analytics).getPlatformTarget
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local contentTypeModule = require(unifiedLogging.ContentType)
local fFlagLuaAppLoosenCollectionIdTypeInterface = require(parent.SharedFlags).FFlagLuaAppLoosenCollectionIdTypeInterface
local fFlagLuaAppUnifiedLoggingDialogContentTypeModule = require(script.Parent.FFlagLuaAppUnifiedLoggingDialogContentType)
local fFlagLuaAppMigrateItemEventsTelemetryService = require(parent.SharedFlags).FFlagLuaAppMigrateItemEventsTelemetryService
local fFlagLuaAppItemEventsTelemetryServiceShadowTraffic = require(parent.SharedFlags).FFlagLuaAppItemEventsTelemetryServiceShadowTraffic
local var6 = if fFlagLuaAppMigrateItemEventsTelemetryService then {
	eventName = "itemAction",
	description = "Fires for default user actions, primarily through SDUI",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaAppItemActionEventThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 2, 4 }
} else nil
local var7 = if fFlagLuaAppItemEventsTelemetryServiceShadowTraffic then {
	eventName = "itemActionShadow",
	description = "Shadow traffic for itemAction event recovery percentage",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaAppItemActionShadowThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 3, 4 }
} else nil
local _ = nil
local _ = nil
local var8 = tModule.intersection(tModule.union(tModule.interface({
	collectionId = if fFlagLuaAppLoosenCollectionIdTypeInterface then tModule.union(tModule.string, tModule.number) else tModule.number,
	collectionIdStr = tModule.optional(tModule.string)
}), tModule.interface({
	collectionId = tModule.optional(if fFlagLuaAppLoosenCollectionIdTypeInterface then tModule.union(tModule.string, tModule.number) else tModule.number),
	collectionIdStr = tModule.string
})), tModule.interface({
	collectionPosition = tModule.number,
	totalNumberOfItems = tModule.number,
	contentType = tModule.string,
	itemId = tModule.optional(tModule.string),
	itemPosition = tModule.optional(tModule.number),
	positionInRow = tModule.optional(tModule.number),
	rowNumber = tModule.optional(tModule.number),
	feedRowNumber = tModule.optional(tModule.number),
	positionInTopic = tModule.optional(tModule.number),
	actionType = tModule.string,
	interactionUuid = tModule.optional(tModule.string)
}))
local var9 = if fFlagLuaAppUnifiedLoggingDialogContentTypeModule then tModule.interface({
	contentType = tModule.string,
	actionType = tModule.string,
	interactionUuid = tModule.optional(tModule.string)
}) else nil
local t = { [contentTypeModule.User] = u215 }

if fFlagLuaAppUnifiedLoggingDialogContentTypeModule then
	t[contentTypeModule.Dialog] = var9
end
return function(p0, p1, p2, p3)
	-- upvalues: t (ref), var8 (write), discoveryEventErrorLogger (ref), httpService (ref), fFlagLuaAppMigrateItemEventsTelemetryService (ref), telemetryService (ref), var6 (write), getPlatformTarget (ref), fFlagLuaAppItemEventsTelemetryServiceShadowTraffic (ref), var7 (write)
	local var11 = t[p2] or var8
	
	if var11 then
		local var12, var13 = var11(p3)
		
		if not var12 then
			discoveryEventErrorLogger.reportError("ItemActionEventInvalidInterface", var13)
		end
	end
	if not p3.interactionUuid then
		p3.interactionUuid = httpService:GenerateGUID(false)
	end
	if fFlagLuaAppMigrateItemEventsTelemetryService then
		for i, v in p3 do
			if type(v) == "boolean" then
				p3[i] = if v == true then "true" elseif v == false then "false" else nil
			end
		end
		telemetryService:LogEvent(var6, {
			eventContext = p1,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = p3,
			legacyOverrideTargetForEventIngest = getPlatformTarget()
		})
	else
		p0:sendEventDeferred(p1, "itemAction", p3)
	end
	if fFlagLuaAppItemEventsTelemetryServiceShadowTraffic then
		local cloned = table.clone(p3)
		
		for i, v in cloned do
			if type(v) == "boolean" then
				cloned[i] = if v == true then "true" elseif v == false then "false" else nil
			end
		end
		telemetryService:LogEvent(var7, {
			eventContext = p1,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = cloned,
			legacyOverrideTargetForEventIngest = getPlatformTarget()
		})
	end
end