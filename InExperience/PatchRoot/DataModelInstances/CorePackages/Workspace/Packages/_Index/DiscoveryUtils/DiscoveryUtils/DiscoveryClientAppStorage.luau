local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local TelemetryService = game:GetService("TelemetryService")
local DiscoveryUtils = script:FindFirstAncestor("DiscoveryUtils")
local DiscoveryEventErrorLoggerModule = require(DiscoveryUtils.Telemetry.DiscoveryEventErrorLogger)
local LuaAppDiscoveryClientAppStorageCacheTtlDays = game:DefineFastInt("LuaAppDiscoveryClientAppStorageCacheTtlDays", 30)
local LuaAppDiscoveryClientAppStorageEmptyCacheTelemetry = game:DefineFastFlag("LuaAppDiscoveryClientAppStorageEmptyCacheTelemetry", false)
local DiscoveryClientAppStorageGetItemErrorThrottleHundredthsPercent = game:DefineFastInt("DiscoveryClientAppStorageGetItemErrorThrottleHundredthsPercent", 10000)
local CacheKey = {
	HomeOmniFeedCache = require(DiscoveryUtils.Parent.LocalStorage).Enums.LocalStorageKey.DiscoveryClientFallbackCache
}
local Config = LuaAppDiscoveryClientAppStorageEmptyCacheTelemetry and {
	eventName = "discoveryClientAppStorageEmptyCache",
	description = "Cached data not found after omni recommendations fetch fails",
	backends = { "EventIngest" },
	throttlingPercentage = DiscoveryClientAppStorageGetItemErrorThrottleHundredthsPercent,
	lastUpdated = { 25, 11, 19 }
} or nil

function getJsonStorageData(CacheKey, Version) --[[ Line: 54 ]]
	-- upvalues: AppStorageService (copy), LuaAppDiscoveryClientAppStorageEmptyCacheTelemetry (copy), TelemetryService (copy), Config (copy), HttpService (copy), DiscoveryEventErrorLoggerModule (copy), LuaAppDiscoveryClientAppStorageCacheTtlDays (copy)
	if not game:GetEngineFeature("UniversalAppDiscoveryClientFallbackCacheStorageKey") then
		return nil
	end
	local Item = AppStorageService:GetItem(CacheKey)
	
	if Item == nil or Item == "" then
		if LuaAppDiscoveryClientAppStorageEmptyCacheTelemetry then
			TelemetryService:LogEvent(Config, {
				standardizedFields = { "addSessionInfo" },
				customFields = { cacheKey = CacheKey }
			})
		end
		return nil
	else
		local Success, Result = pcall(function() --[[ Line: 74 ]]
			-- upvalues: HttpService (upval), Item (copy)
			return HttpService:JSONDecode(Item)
		end)
		
		if not Success then
			DiscoveryEventErrorLoggerModule.reportError("DiscoveryClientAppStorageDataError", Result)
			error(`Failed to decode cache data for key: {CacheKey}`)
		end
		if not Result.version then
			DiscoveryEventErrorLoggerModule.reportError("DiscoveryClientAppStorageDataError", `Cached data version not found for key: {CacheKey}`)
			error(`Cached data version not found for key: {CacheKey}`)
		end
		if not Result.lastUpdatedTime then
			DiscoveryEventErrorLoggerModule.reportError("DiscoveryClientAppStorageDataError", `Cached data time not found for key: {CacheKey}`)
			error(`Cached data time not found for key: {CacheKey}`)
		end
		return if Result.version == Version and (not Result.lastUpdatedTime or Result.lastUpdatedTime >= os.time() - 86400 * LuaAppDiscoveryClientAppStorageCacheTtlDays) then Result.data else nil
	end
end

function setJsonStorageData(Key, Data, Version) --[[ Line: 120 ]]
	-- upvalues: HttpService (copy), AppStorageService (copy)
	if game:GetEngineFeature("UniversalAppDiscoveryClientFallbackCacheStorageKey") then
		AppStorageService:SetItem(Key, (HttpService:JSONEncode({
			data = Data,
			lastUpdatedTime = os.time(),
			version = Version
		})))
		
		return
	end
end

return {
	CacheKey = CacheKey,
	getJsonStorageData = getJsonStorageData,
	setJsonStorageData = setJsonStorageData
}