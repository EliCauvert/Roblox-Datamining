local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local CreateDataCacheModule = require(script.Parent.Parent.createDataCache)
local CreateDataResolverModule = require(script.Parent.Parent.createDataResolver)
local ConfigModule = require(script.Parent.config)
local ResponseDecodersModule = require(script.Parent.responseDecoders)
local _ = require(script.Parent.types)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function(p1) --[[ Line: 30 | Named "createCreatorCreditStore" ]]
	-- upvalues: ConfigModule (copy), CreateDataCacheModule (copy), PromiseModule (copy), AsPromiseFunction (copy), FetchFunction (copy), ResponseDecodersModule (copy), CreateDataResolverModule (copy)
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
	
	local function fetchQuotaSummary(_) --[[ Line: 46 ]]
		-- upvalues: Count (ref), Count1 (ref), ResolveResult (ref), Flag (ref), PromiseModule (upval), AsPromiseFunction (upval), FetchFunction (upval), QuotaSummaryUrl (copy), Network (copy), ResponseDecodersModule (upval), DataCacheModule1 (copy)
		local Count2 = Count
		local Count3 = Count1
		local v1 = ResolveResult:catch(function() --[[ Line: 49 ]]
			return nil
		end):andThen(function() --[[ Line: 52 ]]
			-- upvalues: Flag (upval), Count2 (copy), Count (upval), PromiseModule (upval), AsPromiseFunction (upval), FetchFunction (upval), QuotaSummaryUrl (upval), Network (upval), ResponseDecodersModule (upval), Count3 (copy), Count1 (upval), DataCacheModule1 (upval)
			return if Flag or Count2 ~= Count then PromiseModule.reject("Creator Credit store changed before queued quota read") else AsPromiseFunction(FetchFunction({
				method = "GET",
				analyticsKey = "creator-credit.get-quota-summary",
				url = QuotaSummaryUrl,
				network = Network,
				decode = ResponseDecodersModule.decodeQuotaSummary
			})):andThen(function(Result) --[[ Line: 62 ]]
				-- upvalues: Flag (upval), Count2 (upval), Count (upval), PromiseModule (upval), Count3 (upval), Count1 (upval), DataCacheModule1 (upval)
				if Flag or Count2 ~= Count then
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
	
	local function fetchDailyLimit(_) --[[ Line: 85 ]]
		-- upvalues: Count (ref), Count1 (ref), ResolveResult1 (ref), Flag (ref), PromiseModule (upval), AsPromiseFunction (upval), FetchFunction (upval), DailyLimitUrl (copy), Network (copy), ResponseDecodersModule (upval), DataCacheModule1 (copy)
		local Count2 = Count
		local Count3 = Count1
		local v1 = ResolveResult1:catch(function() --[[ Line: 88 ]]
			return nil
		end):andThen(function() --[[ Line: 91 ]]
			-- upvalues: Flag (upval), Count2 (copy), Count (upval), PromiseModule (upval), AsPromiseFunction (upval), FetchFunction (upval), DailyLimitUrl (upval), Network (upval), ResponseDecodersModule (upval), Count3 (copy), Count1 (upval), DataCacheModule1 (upval)
			return if Flag or Count2 ~= Count then PromiseModule.reject("Creator Credit store changed before queued daily-limit read") else AsPromiseFunction(FetchFunction({
				method = "GET",
				analyticsKey = "creator-credit.get-daily-limit",
				url = DailyLimitUrl,
				network = Network,
				decode = ResponseDecodersModule.decodeDailyLimitSettings
			})):andThen(function(Result) --[[ Line: 101 ]]
				-- upvalues: Flag (upval), Count2 (upval), Count (upval), PromiseModule (upval), Count3 (upval), Count1 (upval), DataCacheModule1 (upval)
				return if Flag or Count2 ~= Count then PromiseModule.reject("Creator Credit store changed during daily-limit read") elseif Count3 == Count1 then Result else DataCacheModule1.getItem("current-user").data(false) or Result
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
	
	return {
		getQuotaSummary = function() --[[ Line: 121 ]]
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getAndFetchItem("current-user")
		end,
		getQuotaSummarySignals = function() --[[ Line: 125 ]]
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getCachedItem("current-user")
		end,
		refreshQuotaSummary = function() --[[ Line: 129 ]]
			-- upvalues: Count (ref), fetchQuotaSummary (copy), Flag (ref), PromiseModule (upval), DataCacheModule (copy)
			local Count1 = Count
			
			return fetchQuotaSummary("current-user"):andThen(function(Result) --[[ Line: 131 ]]
				-- upvalues: Flag (upval), Count1 (copy), Count (upval), PromiseModule (upval), DataCacheModule (upval)
				if Flag or Count1 ~= Count then
					return PromiseModule.reject("Creator Credit store changed during quota refresh")
				else
					DataCacheModule.replaceItem("current-user", Result)
					
					return Result
				end
			end)
		end,
		getDailyLimit = function() --[[ Line: 140 ]]
			-- upvalues: DataResolverModule1 (copy)
			return DataResolverModule1.getAndFetchItem("current-user")
		end,
		getDailyLimitSignals = function() --[[ Line: 144 ]]
			-- upvalues: DataResolverModule1 (copy)
			return DataResolverModule1.getCachedItem("current-user")
		end,
		refreshDailyLimit = function() --[[ Line: 148 ]]
			-- upvalues: Count (ref), fetchDailyLimit (copy), Flag (ref), PromiseModule (upval), DataCacheModule1 (copy)
			local Count1 = Count
			
			return fetchDailyLimit("current-user"):andThen(function(Result) --[[ Line: 150 ]]
				-- upvalues: Flag (upval), Count1 (copy), Count (upval), PromiseModule (upval), DataCacheModule1 (upval)
				if Flag or Count1 ~= Count then
					return PromiseModule.reject("Creator Credit store changed during daily-limit refresh")
				else
					DataCacheModule1.replaceItem("current-user", Result)
					
					return Result
				end
			end)
		end,
		setDailyLimit = function(Body) --[[ Line: 159 ]]
			-- upvalues: Count (ref), ResolveResult2 (ref), Flag (ref), PromiseModule (upval), FetchFunction (upval), DailyLimitUrl (copy), Network (copy), ResponseDecodersModule (upval), AsPromiseFunction (upval), Count1 (ref), DataCacheModule1 (copy), DataCacheModule (copy)
			local Count2 = Count
			local Promise = ResolveResult2:catch(function() --[[ Line: 161 ]] end):andThen(function() --[[ Line: 162 ]]
				-- upvalues: Flag (upval), Count2 (copy), Count (upval), PromiseModule (upval), FetchFunction (upval), DailyLimitUrl (upval), Body (copy), Network (upval), ResponseDecodersModule (upval), AsPromiseFunction (upval)
				return if Flag or Count2 ~= Count then PromiseModule.reject("Creator Credit store changed before queued daily-limit write") else AsPromiseFunction((FetchFunction({
					method = "PUT",
					analyticsKey = "creator-credit.set-daily-limit",
					url = DailyLimitUrl,
					body = Body,
					network = Network,
					decode = ResponseDecodersModule.decodeDailyLimitSettings
				})))
			end)
			ResolveResult2 = Promise
			
			return Promise:andThen(function(Result) --[[ Line: 179 ]]
				-- upvalues: Flag (upval), Count2 (copy), Count (upval), Count1 (upval), DataCacheModule1 (upval), DataCacheModule (upval)
				if not Flag and Count2 == Count then
					Count1 += 1
					DataCacheModule1.replaceItem("current-user", Result)
					local DataResult = DataCacheModule.getItem("current-user").data(false)
					
					if DataResult then
						local Copy = table.clone(DataResult)
						Copy.limitSettings = Result
						DataCacheModule.replaceItem("current-user", Copy)
					end
				end
				return Result
			end)
		end,
		clear = function() --[[ Line: 194 ]]
			-- upvalues: Count (ref), Count1 (ref), DataResolverModule (copy), DataResolverModule1 (copy)
			Count += 1
			Count1 += 1
			DataResolverModule.clear()
			DataResolverModule1.clear()
		end,
		dispose = function() --[[ Line: 201 ]]
			-- upvalues: Flag (ref), Count (ref), Count1 (ref), DataResolverModule (copy), DataResolverModule1 (copy)
			if not Flag then
				Flag = true
				Count += 1
				Count1 += 1
				DataResolverModule.dispose()
				DataResolverModule1.dispose()
				
				return
			end
		end
	}
end