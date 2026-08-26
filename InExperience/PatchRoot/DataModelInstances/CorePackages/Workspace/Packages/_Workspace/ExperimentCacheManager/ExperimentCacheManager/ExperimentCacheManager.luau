local appStorageService = game:GetService("AppStorageService")
local IXPService = game:GetService("IXPService")
local httpService = game:GetService("HttpService")
local eventIngestService = game:GetService("EventIngestService")
local parent = script:FindFirstAncestor("ExperimentCacheManager").Parent
local eventIngest = require(parent.Analytics).AnalyticsReporters.EventIngest
local memoize = require(parent.AppCommonLib).memoize
local appStorageJsonCacheUtils = require(parent.AppCommonLib).Utils.AppStorageJsonCacheUtils
local mutedError = require(parent.Loggers).mutedError
local localStorageKey = require(parent.LocalStorage).Enums.LocalStorageKey
local getExperimentCacheLayersModule = require(script.Parent.GetExperimentCacheLayers)
local enableAppStorageJsonDecodeCache = game:DefineFastFlag("EnableAppStorageJsonDecodeCache", false)
local t = {}
t.__index = t

function t.new(p1, p2, p3)
	-- upvalues: IXPService (ref), eventIngest (ref), eventIngestService (ref), getExperimentCacheLayersModule (ref), t (ref)
	local t_1 = {
		_loadingStatusChanged = nil,
		_hasLoggedMissingLayerError = nil,
		_ixpService = p1 or IXPService,
		_eventIngest = p2 or eventIngest.new(eventIngestService),
		_cache = {},
		_layersToCache = p3 or getExperimentCacheLayersModule(),
		_exposureLoggingTable = {}
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t._getCachedVariables(_)
	-- upvalues: enableAppStorageJsonDecodeCache (ref), appStorageJsonCacheUtils (ref), localStorageKey (ref), appStorageService (ref), httpService (ref)
	if enableAppStorageJsonDecodeCache then
		local experimentCacheCachedJsonForKey = appStorageJsonCacheUtils.default:getCachedJsonForKey(localStorageKey.ExperimentCache, true)
		
		return if experimentCacheCachedJsonForKey == nil then {} else experimentCacheCachedJsonForKey
	end
	local ok, status = pcall(function()
		-- upvalues: appStorageService (copy), localStorageKey (copy)
		return appStorageService:GetItem(localStorageKey.ExperimentCache)
	end)
	
	if ok then
		local ok_1, status_1 = pcall(function()
			-- upvalues: httpService (copy), status (ref)
			return httpService:JSONDecode(status)
		end)
		
		return if ok_1 then status_1 else {}
	end
end

function t._flushToCache(_, p1)
	-- upvalues: httpService (ref), appStorageService (ref), localStorageKey (ref)
	assert(type(p1) == "table", "expected table type for cache to persist")
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), p1 (ref)
		return httpService:JSONEncode(p1)
	end)
	
	if ok then
		local ok_1, status_1 = pcall(function()
			-- upvalues: appStorageService (copy), localStorageKey (copy), status (ref)
			appStorageService:SetItem(localStorageKey.ExperimentCache, status)
			appStorageService:Flush()
		end)
		
		if not ok_1 then
			warn(status_1)
		end
	end
end

function t:_onIXPInitialized()
	local userLayerLoadingStatus = self._ixpService:GetUserLayerLoadingStatus()
	
	if userLayerLoadingStatus ~= Enum.IXPLoadingStatus.Pending and self._loadingStatusChanged then
		self._loadingStatusChanged:disconnect()
		self._loadingStatusChanged = nil
	end
	if userLayerLoadingStatus == Enum.IXPLoadingStatus.Initialized then
		local t = {}
		
		for i, v in ipairs(self._layersToCache) do
			local var1 = nil
			pcall(function()
				-- upvalues: var1 (write), self (ref), v (ref)
				var1 = self._ixpService:GetUserLayerVariables(v)
			end)
			t[v] = var1
		end
		self:_flushToCache(t)
	end
end

function t:_logCustomExposure(p1)
	assert(type(p1) == "string", "expected layerName to be a string")
	self._eventIngest:setRBXEventStream("experimentCacheManager", "exposureLog", { layerName = p1 })
end

function t._containsLayer(p1, p2)
	-- upvalues: memoize (ref)
	return memoize(function(p3)
		-- upvalues: p1 (ref)
		for i, v in ipairs(p1._layersToCache) do
			if v == p3 then
				return true
			end
		end
		return false
	end)(p2)
end

function t:initialize()
	self._cache = self:_getCachedVariables()
	
	if self._ixpService:GetUserLayerLoadingStatus() == Enum.IXPLoadingStatus.Initialized then
		self:_onIXPInitialized()
		
		return
	end
	self._loadingStatusChanged = self._ixpService.OnUserLayerLoadingStatusChanged:Connect(function(p3)
		-- upvalues: self (ref)
		if p3 == Enum.IXPLoadingStatus.Initialized then
			self:_onIXPInitialized()
		end
	end)
end

function t:getLayerVariables(p3, _)
	-- upvalues: mutedError (ref)
	assert(type(p3) == "string", "expected layerName to be a string")
	
	if not self:_containsLayer(p3) and not self._hasLoggedMissingLayerError then
		self._hasLoggedMissingLayerError = true
		mutedError("Layer " .. p9 .. " has not been configured to be cached, please add layer to `GetExperimentCacheLayers`")
	end
	return self._cache[p3] or nil
end

function t:clearCache()
	-- upvalues: appStorageService (ref), localStorageKey (ref)
	self._cache = {}
	self._exposureLoggingTable = {}
	pcall(function()
		-- upvalues: appStorageService (copy), localStorageKey (copy)
		appStorageService:SetItem(localStorageKey.ExperimentCache, "")
		appStorageService:Flush()
	end)
end

function t:sendCustomExposureLog(p3)
	if self._exposureLoggingTable[p3] == nil then
		self:_logCustomExposure(p3)
		self._exposureLoggingTable[p3] = true
	end
end

function t:logLayerExposure(p3)
	self._ixpService:LogUserLayerExposure(p3)
end

t.default = t.new()

return t