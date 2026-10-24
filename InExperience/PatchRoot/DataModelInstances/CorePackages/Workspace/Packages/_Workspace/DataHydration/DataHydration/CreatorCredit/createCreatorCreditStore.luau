local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local CreateDataCacheModule = require(script.Parent.Parent.createDataCache)
local CreateDataResolverModule = require(script.Parent.Parent.createDataResolver)
local ConfigModule = require(script.Parent.config)
local ResponseDecodersModule = require(script.Parent.responseDecoders)
local _ = require(script.Parent.types)
local DataHydrationUtilsModule = require(DataHydration.DataHydrationUtils)
local CreateTierQuotaStoreModule = require(script.Parent.createTierQuotaStore)
local FFlagBuildExperienceModelPickerData = require(Parent.SharedFlags).FFlagBuildExperienceModelPickerData
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function(p1)
	-- upvalues: ConfigModule (copy), CreateDataCacheModule (copy), PromiseModule (copy), DataHydrationUtilsModule (copy), FFlagBuildExperienceModelPickerData (copy), CreateTierQuotaStoreModule (copy), AsPromiseFunction (copy), FetchFunction (copy), ResponseDecodersModule (copy), CreateDataResolverModule (copy)
	local P0 = p1 or {}
	local QuotaSummaryUrl = P0.quotaSummaryUrl or ConfigModule.quotaSummaryUrl
	local DailyLimitUrl = P0.dailyLimitUrl or ConfigModule.dailyLimitUrl
	local Network = P0.network
	local TtlSeconds = P0.ttlSeconds or ConfigModule.pollIntervalSeconds
	local DataCacheModule = CreateDataCacheModule(TtlSeconds, TtlSeconds)
	local DataCacheModule1 = CreateDataCacheModule(TtlSeconds, TtlSeconds)
	local Count = 0
	local Count1 = 0
	local ResolveResult = PromiseModule.resolve()
	local ResolveResult1 = PromiseModule.resolve()
	local ResolveResult2 = PromiseModule.resolve()
	local Flag = false
	local GetLocalPlayerUserId = P0.getLocalPlayerUserId or DataHydrationUtilsModule.getLocalPlayerUserId
	local TierQuotaStoreModule = if FFlagBuildExperienceModelPickerData then CreateTierQuotaStoreModule({
		quotaSummaryUrl = QuotaSummaryUrl,
		network = Network,
		ttlSeconds = TtlSeconds,
		getLocalPlayerUserId = GetLocalPlayerUserId
	}) else nil
	
	local function _()
		-- upvalues: TierQuotaStoreModule (ref)
		assert(TierQuotaStoreModule, "Tier quota requires FFlagBuildExperienceModelPickerData")
		
		return TierQuotaStoreModule
	end
	
	local function fetchQuotaSummary(_)
		-- upvalues: Count (ref), FFlagBuildExperienceModelPickerData (upval), GetLocalPlayerUserId (copy), Count1 (ref), ResolveResult (ref), Flag (ref), PromiseModule (upval), AsPromiseFunction (upval), FetchFunction (upval), QuotaSummaryUrl (copy), Network (copy), ResponseDecodersModule (upval), DataCacheModule1 (copy)
		local Count2 = Count
		local LocalPlayerUserId = if FFlagBuildExperienceModelPickerData then GetLocalPlayerUserId() else nil
		local Count3 = Count1
		local v1 = ResolveResult:catch(function()
			return nil
		end):andThen(function()
			-- upvalues: Flag (upval), Count2 (copy), Count (upval), PromiseModule (upval), FFlagBuildExperienceModelPickerData (upval), LocalPlayerUserId (copy), GetLocalPlayerUserId (upval), AsPromiseFunction (upval), FetchFunction (upval), QuotaSummaryUrl (upval), Network (upval), ResponseDecodersModule (upval), Count3 (copy), Count1 (upval), DataCacheModule1 (upval)
			return if Flag or Count2 ~= Count then PromiseModule.reject("Creator Credit store changed before queued quota read") elseif FFlagBuildExperienceModelPickerData and LocalPlayerUserId ~= GetLocalPlayerUserId() then PromiseModule.reject("Creator Credit store changed before queued quota read") else AsPromiseFunction(FetchFunction({
				method = "GET",
				analyticsKey = "creator-credit.get-quota-summary",
				url = QuotaSummaryUrl,
				network = Network,
				decode = ResponseDecodersModule.decodeQuotaSummary
			})):andThen(function(Result)
				-- upvalues: Flag (upval), Count2 (upval), Count (upval), PromiseModule (upval), FFlagBuildExperienceModelPickerData (upval), LocalPlayerUserId (upval), GetLocalPlayerUserId (upval), Count3 (upval), Count1 (upval), DataCacheModule1 (upval)
				if Flag or Count2 ~= Count then
					return PromiseModule.reject("Creator Credit store changed during quota read")
				end
				if FFlagBuildExperienceModelPickerData and LocalPlayerUserId ~= GetLocalPlayerUserId() then
					return PromiseModule.reject("Creator Credit store changed during quota read")
				end
				if Count3 ~= Count1 then
					local DataResult = DataCacheModule1.getItem("current-user").data(false)
					
					if DataResult then
						Result.limitSettings = DataResult
					end
				end
				return Result
			end)
		end)
		ResolveResult = v1
		
		return v1
	end
	
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = DataCacheModule,
		fetchFn = fetchQuotaSummary
	})
	
	local function fetchDailyLimit(_)
		-- upvalues: Count (ref), FFlagBuildExperienceModelPickerData (upval), GetLocalPlayerUserId (copy), Count1 (ref), ResolveResult1 (ref), Flag (ref), PromiseModule (upval), AsPromiseFunction (upval), FetchFunction (upval), DailyLimitUrl (copy), Network (copy), ResponseDecodersModule (upval), DataCacheModule1 (copy)
		local Count2 = Count
		local LocalPlayerUserId = if FFlagBuildExperienceModelPickerData then GetLocalPlayerUserId() else nil
		local Count3 = Count1
		local v1 = ResolveResult1:catch(function()
			return nil
		end):andThen(function()
			-- upvalues: Flag (upval), Count2 (copy), Count (upval), PromiseModule (upval), FFlagBuildExperienceModelPickerData (upval), LocalPlayerUserId (copy), GetLocalPlayerUserId (upval), AsPromiseFunction (upval), FetchFunction (upval), DailyLimitUrl (upval), Network (upval), ResponseDecodersModule (upval), Count3 (copy), Count1 (upval), DataCacheModule1 (upval)
			return if Flag or Count2 ~= Count then PromiseModule.reject("Creator Credit store changed before queued daily-limit read") elseif FFlagBuildExperienceModelPickerData and LocalPlayerUserId ~= GetLocalPlayerUserId() then PromiseModule.reject("Creator Credit store changed before queued daily-limit read") else AsPromiseFunction(FetchFunction({
				method = "GET",
				analyticsKey = "creator-credit.get-daily-limit",
				url = DailyLimitUrl,
				network = Network,
				decode = ResponseDecodersModule.decodeDailyLimitSettings
			})):andThen(function(Result)
				-- upvalues: Flag (upval), Count2 (upval), Count (upval), PromiseModule (upval), FFlagBuildExperienceModelPickerData (upval), LocalPlayerUserId (upval), GetLocalPlayerUserId (upval), Count3 (upval), Count1 (upval), DataCacheModule1 (upval)
				return if Flag or Count2 ~= Count then PromiseModule.reject("Creator Credit store changed during daily-limit read") elseif FFlagBuildExperienceModelPickerData and LocalPlayerUserId ~= GetLocalPlayerUserId() then PromiseModule.reject("Creator Credit store changed during daily-limit read") elseif Count3 == Count1 then Result else DataCacheModule1.getItem("current-user").data(false) or Result
			end)
		end)
		ResolveResult1 = v1
		
		return v1
	end
	
	local DataResolverModule1 = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = DataCacheModule1,
		fetchFn = fetchDailyLimit
	})
	
	local function clear()
		-- upvalues: Count (ref), Count1 (ref), DataResolverModule (copy), DataResolverModule1 (copy), FFlagBuildExperienceModelPickerData (upval), ResolveResult (ref), PromiseModule (upval), ResolveResult1 (ref), TierQuotaStoreModule (ref)
		Count += 1
		Count1 += 1
		DataResolverModule.clear()
		DataResolverModule1.clear()
		
		if FFlagBuildExperienceModelPickerData then
			ResolveResult = PromiseModule.resolve()
			ResolveResult1 = PromiseModule.resolve()
			assert(TierQuotaStoreModule, "Tier quota requires FFlagBuildExperienceModelPickerData")
			TierQuotaStoreModule.clear()
		end
	end
	
	local Callback = if FFlagBuildExperienceModelPickerData then (P0.observeLocalPlayerUserId or DataHydrationUtilsModule.observeLocalPlayerUserId)(clear) else nil
	local config = {
		getQuotaSummary = function()
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getAndFetchItem("current-user")
		end,
		getQuotaSummarySignals = function()
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getCachedItem("current-user")
		end,
		refreshQuotaSummary = function()
			-- upvalues: Count (ref), FFlagBuildExperienceModelPickerData (upval), GetLocalPlayerUserId (copy), fetchQuotaSummary (copy), Flag (ref), PromiseModule (upval), DataCacheModule (copy)
			local Count1 = Count
			local LocalPlayerUserId = if FFlagBuildExperienceModelPickerData then GetLocalPlayerUserId() else nil
			
			return fetchQuotaSummary("current-user"):andThen(function(Result)
				-- upvalues: Flag (upval), Count1 (copy), Count (upval), PromiseModule (upval), FFlagBuildExperienceModelPickerData (upval), LocalPlayerUserId (copy), GetLocalPlayerUserId (upval), DataCacheModule (upval)
				if Flag or Count1 ~= Count then
					return PromiseModule.reject("Creator Credit store changed during quota refresh")
				elseif FFlagBuildExperienceModelPickerData and LocalPlayerUserId ~= GetLocalPlayerUserId() then
					return PromiseModule.reject("Creator Credit store changed during quota refresh")
				else
					DataCacheModule.replaceItem("current-user", Result)
					
					return Result
				end
			end)
		end,
		getDailyLimit = function()
			-- upvalues: DataResolverModule1 (copy)
			return DataResolverModule1.getAndFetchItem("current-user")
		end,
		getDailyLimitSignals = function()
			-- upvalues: DataResolverModule1 (copy)
			return DataResolverModule1.getCachedItem("current-user")
		end,
		refreshDailyLimit = function()
			-- upvalues: Count (ref), FFlagBuildExperienceModelPickerData (upval), GetLocalPlayerUserId (copy), fetchDailyLimit (copy), Flag (ref), PromiseModule (upval), DataCacheModule1 (copy)
			local Count1 = Count
			local LocalPlayerUserId = if FFlagBuildExperienceModelPickerData then GetLocalPlayerUserId() else nil
			
			return fetchDailyLimit("current-user"):andThen(function(Result)
				-- upvalues: Flag (upval), Count1 (copy), Count (upval), PromiseModule (upval), FFlagBuildExperienceModelPickerData (upval), LocalPlayerUserId (copy), GetLocalPlayerUserId (upval), DataCacheModule1 (upval)
				if Flag or Count1 ~= Count then
					return PromiseModule.reject("Creator Credit store changed during daily-limit refresh")
				elseif FFlagBuildExperienceModelPickerData and LocalPlayerUserId ~= GetLocalPlayerUserId() then
					return PromiseModule.reject("Creator Credit store changed during daily-limit refresh")
				else
					DataCacheModule1.replaceItem("current-user", Result)
					
					return Result
				end
			end)
		end,
		setDailyLimit = function(Body)
			-- upvalues: Count (ref), FFlagBuildExperienceModelPickerData (upval), GetLocalPlayerUserId (copy), ResolveResult2 (ref), PromiseModule (upval), Flag (ref), FetchFunction (upval), DailyLimitUrl (copy), Network (copy), ResponseDecodersModule (upval), AsPromiseFunction (upval), Count1 (ref), DataCacheModule1 (copy), DataCacheModule (copy), TierQuotaStoreModule (ref)
			local Count2 = Count
			local LocalPlayerUserId = if FFlagBuildExperienceModelPickerData then GetLocalPlayerUserId() else nil
			local Promise = ResolveResult2:catch(function() end):andThen(function()
				-- upvalues: FFlagBuildExperienceModelPickerData (upval), LocalPlayerUserId (copy), GetLocalPlayerUserId (upval), PromiseModule (upval), Flag (upval), Count2 (copy), Count (upval), FetchFunction (upval), DailyLimitUrl (upval), Body (copy), Network (upval), ResponseDecodersModule (upval), AsPromiseFunction (upval)
				return if FFlagBuildExperienceModelPickerData and LocalPlayerUserId ~= GetLocalPlayerUserId() then PromiseModule.reject("Creator Credit account changed before daily-limit write") elseif Flag or Count2 ~= Count then PromiseModule.reject("Creator Credit store changed before queued daily-limit write") else AsPromiseFunction((FetchFunction({
					method = "PUT",
					analyticsKey = "creator-credit.set-daily-limit",
					url = DailyLimitUrl,
					body = Body,
					network = Network,
					decode = ResponseDecodersModule.decodeDailyLimitSettings
				})))
			end)
			ResolveResult2 = Promise
			
			return Promise:andThen(function(Result)
				-- upvalues: FFlagBuildExperienceModelPickerData (upval), LocalPlayerUserId (copy), GetLocalPlayerUserId (upval), PromiseModule (upval), Flag (upval), Count2 (copy), Count (upval), Count1 (upval), DataCacheModule1 (upval), DataCacheModule (upval), TierQuotaStoreModule (upval)
				if FFlagBuildExperienceModelPickerData and LocalPlayerUserId ~= GetLocalPlayerUserId() then
					return PromiseModule.reject("Creator Credit account changed during daily-limit write")
				end
				if not Flag and Count2 == Count then
					Count1 += 1
					DataCacheModule1.replaceItem("current-user", Result)
					local DataResult = DataCacheModule.getItem("current-user").data(false)
					
					if DataResult then
						local Copy = table.clone(DataResult)
						Copy.limitSettings = Result
						DataCacheModule.replaceItem("current-user", Copy)
					end
					if FFlagBuildExperienceModelPickerData then
						assert(TierQuotaStoreModule, "Tier quota requires FFlagBuildExperienceModelPickerData")
						TierQuotaStoreModule.invalidate()
					end
				end
				return Result
			end)
		end,
		clear = clear,
		dispose = function()
			-- upvalues: Flag (ref), Count (ref), Count1 (ref), DataResolverModule (copy), DataResolverModule1 (copy), FFlagBuildExperienceModelPickerData (upval), Callback (ref), TierQuotaStoreModule (ref)
			if Flag then return end
			Flag = true
			Count += 1
			Count1 += 1
			DataResolverModule.dispose()
			DataResolverModule1.dispose()
			
			if FFlagBuildExperienceModelPickerData then
				if Callback then
					Callback()
				end
				assert(TierQuotaStoreModule, "Tier quota requires FFlagBuildExperienceModelPickerData")
				TierQuotaStoreModule.dispose()
			end
		end
	}
	
	if FFlagBuildExperienceModelPickerData then
		assert(TierQuotaStoreModule, "Tier quota requires FFlagBuildExperienceModelPickerData")
		local TierQuotaStoreModule1 = TierQuotaStoreModule
		config.getTierQuotaSummary = TierQuotaStoreModule1.getTierQuotaSummary
		config.getTierQuotaSummarySignals = TierQuotaStoreModule1.getTierQuotaSummarySignals
		config.refreshTierQuotaSummary = TierQuotaStoreModule1.refreshTierQuotaSummary
	end
	return config
end