local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local telemetryService = game:GetService("TelemetryService")
local discoveryUtils = script:FindFirstAncestor("DiscoveryUtils")
local discoveryEventErrorLoggerModule = require(discoveryUtils.Telemetry.DiscoveryEventErrorLogger)
local localStorageKey = require(discoveryUtils.Parent.LocalStorage).Enums.LocalStorageKey
local luaAppDiscoveryClientAppStorageCacheTtlDays = game:DefineFastInt("LuaAppDiscoveryClientAppStorageCacheTtlDays", 30)
local luaAppDiscoveryClientAppStorageEmptyCacheTelemetry = game:DefineFastFlag("LuaAppDiscoveryClientAppStorageEmptyCacheTelemetry", false)
local t = {
	HomeOmniFeedCache = localStorageKey.DiscoveryClientFallbackCache
}
local var1 = luaAppDiscoveryClientAppStorageEmptyCacheTelemetry and ({
	eventName = "discoveryClientAppStorageEmptyCache",
	description = "Cached data not found after omni recommendations fetch fails",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("DiscoveryClientAppStorageGetItemErrorThrottleHundredthsPercent", 10000),
	lastUpdated = { 25, 11, 19 }
} or nil)

function getJsonStorageData(p1, p2)
	-- upvalues: appStorageService (ref), luaAppDiscoveryClientAppStorageEmptyCacheTelemetry (ref), telemetryService (ref), var1 (ref), httpService (ref), discoveryEventErrorLoggerModule (ref), luaAppDiscoveryClientAppStorageCacheTtlDays (ref)
	if not game:GetEngineFeature("UniversalAppDiscoveryClientFallbackCacheStorageKey") then
		return nil
	end
	local var2 = appStorageService:GetItem(p1)
	
	if var2 == nil or var2 == "" then
		if luaAppDiscoveryClientAppStorageEmptyCacheTelemetry then
			telemetryService:LogEvent(var1, {
				standardizedFields = { "addSessionInfo" },
				customFields = { cacheKey = p1 }
			})
		end
		return nil
	else
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), var2 (ref)
			return httpService:JSONDecode(var2)
		end)
		
		if not ok then
			discoveryEventErrorLoggerModule.reportError("DiscoveryClientAppStorageDataError", status)
			error(`Failed to decode cache data for key: {p1}`)
		end
		if not status.version then
			discoveryEventErrorLoggerModule.reportError("DiscoveryClientAppStorageDataError", `Cached data version not found for key: {p1}`)
			error(`Cached data version not found for key: {p1}`)
		end
		if not status.lastUpdatedTime then
			discoveryEventErrorLoggerModule.reportError("DiscoveryClientAppStorageDataError", `Cached data time not found for key: {p1}`)
			error(`Cached data time not found for key: {p1}`)
		end
		return if status.version == p2 and (not status.lastUpdatedTime or status.lastUpdatedTime >= os.time() - 86400 * luaAppDiscoveryClientAppStorageCacheTtlDays) then status.data else nil
	end
end

function setJsonStorageData(value, p3, p4)
	-- upvalues: httpService (ref), appStorageService (ref)
	if game:GetEngineFeature("UniversalAppDiscoveryClientFallbackCacheStorageKey") then
		appStorageService:SetItem(value, httpService:JSONEncode({ data = p3, lastUpdatedTime = os.time(), version = p4 }))
		
		return
	end
end

return {
	CacheKey = t,
	getJsonStorageData = getJsonStorageData,
	setJsonStorageData = setJsonStorageData
}