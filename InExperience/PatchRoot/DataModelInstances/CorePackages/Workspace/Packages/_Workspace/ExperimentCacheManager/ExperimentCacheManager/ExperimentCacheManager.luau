local AppStorageService = game:GetService("AppStorageService")
local IXPService = game:GetService("IXPService")
local HttpService = game:GetService("HttpService")
local EventIngestService = game:GetService("EventIngestService")
local Parent = script:FindFirstAncestor("ExperimentCacheManager").Parent
local EventIngest = require(Parent.Analytics).AnalyticsReporters.EventIngest
local MemoizeFunction = require(Parent.AppCommonLib).memoize
local AppStorageJsonCacheUtils = require(Parent.AppCommonLib).Utils.AppStorageJsonCacheUtils
local MutedErrorFunction = require(Parent.Loggers).mutedError
local LocalStorageKey = require(Parent.LocalStorage).Enums.LocalStorageKey
local GetExperimentCacheLayersModule = require(script.Parent.GetExperimentCacheLayers)
local EnableAppStorageJsonDecodeCache = game:DefineFastFlag("EnableAppStorageJsonDecodeCache", false)
local ExperimentCacheManager = {}
ExperimentCacheManager.__index = ExperimentCacheManager

function ExperimentCacheManager.new(EventIngestService1, p1, p2) --[[ Line: 73 ]]
	-- upvalues: IXPService (copy), EventIngest (copy), EventIngestService (copy), GetExperimentCacheLayersModule (copy), ExperimentCacheManager (copy)
	local config = {
		_loadingStatusChanged = nil,
		_hasLoggedMissingLayerError = nil,
		_ixpService = EventIngestService1 or IXPService,
		_eventIngest = p1 or EventIngest.new(EventIngestService),
		_cache = {},
		_layersToCache = p2 or GetExperimentCacheLayersModule(),
		_exposureLoggingTable = {}
	}
	setmetatable(config, ExperimentCacheManager)
	
	return config
end

function ExperimentCacheManager:_getCachedVariables() --[[ Line: 88 ]]
	-- upvalues: EnableAppStorageJsonDecodeCache (copy), AppStorageJsonCacheUtils (copy), LocalStorageKey (copy), AppStorageService (copy), HttpService (copy)
	if EnableAppStorageJsonDecodeCache then
		local CachedJsonForKey = AppStorageJsonCacheUtils.default:getCachedJsonForKey(LocalStorageKey.ExperimentCache, true)
		
		return if CachedJsonForKey == nil then {} else CachedJsonForKey
	end
	local Success, Result = pcall(function() --[[ Line: 98 ]]
		-- upvalues: AppStorageService (upval), LocalStorageKey (upval)
		return AppStorageService:GetItem(LocalStorageKey.ExperimentCache)
	end)
	
	if Success then
		local Success1, Result1 = pcall(function() --[[ Line: 103 ]]
			-- upvalues: HttpService (upval), Result (copy)
			return HttpService:JSONDecode(Result)
		end)
		
		if Success1 then
			return Result1
		end
	end
	return {}
end

function ExperimentCacheManager:_flushToCache(Input) --[[ Line: 115 ]]
	-- upvalues: HttpService (copy), AppStorageService (copy), LocalStorageKey (copy)
	assert(type(Input) == "table", "expected table type for cache to persist")
	local Success, Result = pcall(function() --[[ Line: 119 ]]
		-- upvalues: HttpService (upval), Input (copy)
		return HttpService:JSONEncode(Input)
	end)
	
	if Success then
		local Success1, Result1 = pcall(function() --[[ Line: 124 ]]
			-- upvalues: AppStorageService (upval), LocalStorageKey (upval), Result (copy)
			AppStorageService:SetItem(LocalStorageKey.ExperimentCache, Result)
			AppStorageService:Flush()
		end)
		
		if not Success1 then
			warn(Result1)
		end
	end
end

function ExperimentCacheManager:_onIXPInitialized() --[[ Line: 135 ]]
	local UserLayerLoadingStatus = self._ixpService:GetUserLayerLoadingStatus()
	
	if UserLayerLoadingStatus ~= Enum.IXPLoadingStatus.Pending and self._loadingStatusChanged then
		self._loadingStatusChanged:disconnect()
		self._loadingStatusChanged = nil
	end
	if UserLayerLoadingStatus == Enum.IXPLoadingStatus.Initialized then
		local t = {}
		
		for _, value in ipairs(self._layersToCache) do
			local UserLayerVariables = nil
			pcall(function() --[[ Line: 151 ]]
				-- upvalues: UserLayerVariables (ref), self (copy), value (copy)
				UserLayerVariables = self._ixpService:GetUserLayerVariables(value)
			end)
			t[value] = UserLayerVariables
		end
		self:_flushToCache(t)
	end
end

function ExperimentCacheManager:_logCustomExposure(LayerName) --[[ Line: 163 ]]
	assert(type(LayerName) == "string", "expected layerName to be a string")
	self._eventIngest:setRBXEventStream("experimentCacheManager", "exposureLog", { layerName = LayerName })
end

function ExperimentCacheManager._containsLayer(p1, p2) --[[ Line: 170 ]]
	-- upvalues: MemoizeFunction (copy)
	return MemoizeFunction(function(p3): boolean --[[ Line: 171 ]]
		-- upvalues: p1 (copy)
		for _, value in ipairs(p1._layersToCache) do
			if value == p3 then
				return true
			end
		end
		return false
	end)(p2)
end

function ExperimentCacheManager:initialize() --[[ Line: 183 ]]
	self._cache = self:_getCachedVariables()
	
	if self._ixpService:GetUserLayerLoadingStatus() == Enum.IXPLoadingStatus.Initialized then
		self:_onIXPInitialized()
		
		return
	else
		self._loadingStatusChanged = self._ixpService.OnUserLayerLoadingStatusChanged:Connect(function(Status) --[[ Line: 191 ]]
			-- upvalues: self (copy)
			if Status == Enum.IXPLoadingStatus.Initialized then
				self:_onIXPInitialized()
			end
		end)
	end
end

function ExperimentCacheManager:getLayerVariables(Text, _) --[[ Line: 199 ]]
	-- upvalues: MutedErrorFunction (copy)
	assert(type(Text) == "string", "expected layerName to be a string")
	
	if not self:_containsLayer(Text) and not self._hasLoggedMissingLayerError then
		self._hasLoggedMissingLayerError = true
		MutedErrorFunction("Layer " .. Text .. " has not been configured to be cached, please add layer to `GetExperimentCacheLayers`")
	end
	return self._cache[Text] or nil
end

function ExperimentCacheManager:clearCache() --[[ Line: 215 ]]
	-- upvalues: AppStorageService (copy), LocalStorageKey (copy)
	self._cache = {}
	self._exposureLoggingTable = {}
	pcall(function() --[[ Line: 219 ]]
		-- upvalues: AppStorageService (upval), LocalStorageKey (upval)
		AppStorageService:SetItem(LocalStorageKey.ExperimentCache, "")
		AppStorageService:Flush()
	end)
end

function ExperimentCacheManager:sendCustomExposureLog(LayerName) --[[ Line: 225 ]]
	if self._exposureLoggingTable[LayerName] == nil then
		self:_logCustomExposure(LayerName)
		self._exposureLoggingTable[LayerName] = true
	end
end

function ExperimentCacheManager:logLayerExposure(LayerName) --[[ Line: 233 ]]
	self._ixpService:LogUserLayerExposure(LayerName)
end

ExperimentCacheManager.default = ExperimentCacheManager.new()

return ExperimentCacheManager