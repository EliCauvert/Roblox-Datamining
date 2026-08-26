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
local var1 = if fFlagLuaAppMigrateItemEventsTelemetryService then {
	eventName = "itemAction",
	description = "Fires for default user actions, primarily through SDUI",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaAppItemActionEventThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 2, 4 }
} else nil
local var2 = if fFlagLuaAppItemEventsTelemetryServiceShadowTraffic then {
	eventName = "itemActionShadow",
	description = "Shadow traffic for itemAction event recovery percentage",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("LuaAppItemActionShadowThrottlingHundredthsPercent", 10000),
	lastUpdated = { 26, 3, 4 }
} else nil
local _ = nil
local _ = nil
local var3 = tModule.intersection(tModule.union(tModule.interface({
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
local var4 = if fFlagLuaAppUnifiedLoggingDialogContentTypeModule then tModule.interface({
	contentType = tModule.string,
	actionType = tModule.string,
	interactionUuid = tModule.optional(tModule.string)
}) else nil
local t = { [contentTypeModule.User] = u215 }

if fFlagLuaAppUnifiedLoggingDialogContentTypeModule then
	t[contentTypeModule.Dialog] = var4
end
return function(p1, p2, p3, p4)
	-- upvalues: t (ref), var3 (write), discoveryEventErrorLogger (ref), httpService (ref), fFlagLuaAppMigrateItemEventsTelemetryService (ref), telemetryService (ref), var1 (write), getPlatformTarget (ref), fFlagLuaAppItemEventsTelemetryServiceShadowTraffic (ref), var2 (write)
	local var5 = t[p3] or var3
	
	if var5 then
		local var6, var7 = var5(p4)
		
		if not var6 then
			discoveryEventErrorLogger.reportError("ItemActionEventInvalidInterface", var7)
		end
	end
	if not p4.interactionUuid then
		p4.interactionUuid = httpService:GenerateGUID(false)
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
		p1:sendEventDeferred(p2, "itemAction", p4)
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