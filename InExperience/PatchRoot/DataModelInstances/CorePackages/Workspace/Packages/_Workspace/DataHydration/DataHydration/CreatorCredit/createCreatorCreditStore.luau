local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local createDataCacheModule = require(script.Parent.Parent.createDataCache)
local createDataResolverModule = require(script.Parent.Parent.createDataResolver)
local configModule = require(script.Parent.config)
local responseDecodersModule = require(script.Parent.responseDecoders)
local _ = require(script.Parent.types)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function(p1)
	-- upvalues: configModule (ref), createDataCacheModule (ref), promiseModule (ref), asPromise (ref), fetch (ref), responseDecodersModule (ref), createDataResolverModule (ref)
	p1 = p1 or {}
	local quotaSummaryUrl = p1.quotaSummaryUrl or configModule.quotaSummaryUrl
	local dailyLimitUrl = p1.dailyLimitUrl or configModule.dailyLimitUrl
	local network = p1.network
	local ttlSeconds = p1.ttlSeconds or configModule.pollIntervalSeconds
	local var1 = createDataCacheModule(ttlSeconds, ttlSeconds)
	local var2 = createDataCacheModule(ttlSeconds, ttlSeconds)
	local var3 = 0
	local var4 = 0
	local var5 = promiseModule.resolve()
	local var6 = promiseModule.resolve()
	local var7 = promiseModule.resolve()
	local var8 = false
	
	local function fetchQuotaSummary(_)
		-- upvalues: var3 (write), var4 (write), var5 (write), var8 (write), promiseModule (copy), asPromise (copy), fetch (copy), quotaSummaryUrl (ref), network (ref), responseDecodersModule (copy), var2 (ref)
		local var9 = var5:catch(function()
			return nil
		end):andThen(function()
			-- upvalues: var8 (copy), var3 (ref), var3 (copy), promiseModule (copy), asPromise (copy), fetch (copy), quotaSummaryUrl (copy), network (copy), responseDecodersModule (copy), var4 (ref), var4 (copy), var2 (copy)
			return if var8 or var3 ~= var3 then promiseModule.reject("Creator Credit store changed before queued quota read") else asPromise(fetch({
				method = "GET",
				analyticsKey = "creator-credit.get-quota-summary",
				url = quotaSummaryUrl,
				network = network,
				decode = responseDecodersModule.decodeQuotaSummary
			})):andThen(function(p2)
				-- upvalues: var8 (copy), var3 (copy), var3 (copy), promiseModule (copy), var4 (copy), var4 (copy), var2 (copy)
				if var8 or var3 ~= var3 then
					return promiseModule.reject("Creator Credit store changed during quota read")
				elseif var4 ~= var4 then
					local var10 = var2.getItem("current-user").data(false)
					
					if var10 then
						p2.limitSettings = var10
					end
				end
				return p2
			end)
		end)
		var5 = var9
		
		return var9
	end
	
	local var9 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var1,
		fetchFn = fetchQuotaSummary
	})
	
	local function fetchDailyLimit(_)
		-- upvalues: var3 (write), var4 (write), var6 (write), var8 (write), promiseModule (copy), asPromise (copy), fetch (copy), dailyLimitUrl (ref), network (ref), responseDecodersModule (copy), var2 (ref)
		local var10 = var6:catch(function()
			return nil
		end):andThen(function()
			-- upvalues: var8 (copy), var3 (ref), var3 (copy), promiseModule (copy), asPromise (copy), fetch (copy), dailyLimitUrl (copy), network (copy), responseDecodersModule (copy), var4 (ref), var4 (copy), var2 (copy)
			return if var8 or var3 ~= var3 then promiseModule.reject("Creator Credit store changed before queued daily-limit read") else asPromise(fetch({
				method = "GET",
				analyticsKey = "creator-credit.get-daily-limit",
				url = dailyLimitUrl,
				network = network,
				decode = responseDecodersModule.decodeDailyLimitSettings
			})):andThen(function(p2)
				-- upvalues: var8 (copy), var3 (copy), var3 (copy), promiseModule (copy), var4 (copy), var4 (copy), var2 (copy)
				return if var8 or var3 ~= var3 then promiseModule.reject("Creator Credit store changed during daily-limit read") elseif var4 == var4 then p2 else var2.getItem("current-user").data(false) or p2
			end)
		end)
		var6 = var10
		
		return var10
	end
	
	local var10 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var2,
		fetchFn = fetchDailyLimit
	})
	
	return {
		getQuotaSummary = function()
			-- upvalues: var9 (ref)
			return var9.getAndFetchItem("current-user")
		end,
		getQuotaSummarySignals = function()
			-- upvalues: var9 (ref)
			return var9.getCachedItem("current-user")
		end,
		refreshQuotaSummary = function()
			-- upvalues: var3 (write), fetchQuotaSummary (ref), var8 (write), promiseModule (copy), var1 (ref)
			return fetchQuotaSummary("current-user"):andThen(function(p2)
				-- upvalues: var8 (copy), var3 (ref), var3 (copy), promiseModule (copy), var1 (copy)
				if var8 or var3 ~= var3 then
					return promiseModule.reject("Creator Credit store changed during quota refresh")
				end
				var1.replaceItem("current-user", p2)
				
				return p2
			end)
		end,
		getDailyLimit = function()
			-- upvalues: var10 (ref)
			return var10.getAndFetchItem("current-user")
		end,
		getDailyLimitSignals = function()
			-- upvalues: var10 (ref)
			return var10.getCachedItem("current-user")
		end,
		refreshDailyLimit = function()
			-- upvalues: var3 (write), fetchDailyLimit (ref), var8 (write), promiseModule (copy), var2 (ref)
			return fetchDailyLimit("current-user"):andThen(function(p2)
				-- upvalues: var8 (copy), var3 (ref), var3 (copy), promiseModule (copy), var2 (copy)
				if var8 or var3 ~= var3 then
					return promiseModule.reject("Creator Credit store changed during daily-limit refresh")
				end
				var2.replaceItem("current-user", p2)
				
				return p2
			end)
		end,
		setDailyLimit = function(value)
			-- upvalues: var3 (write), var7 (write), var8 (write), promiseModule (copy), fetch (copy), dailyLimitUrl (ref), network (ref), responseDecodersModule (copy), asPromise (copy), var4 (write), var2 (ref), var1 (ref)
			local var11 = var7:catch(function() end):andThen(function()
				-- upvalues: var8 (copy), var3 (ref), var3 (copy), promiseModule (copy), fetch (copy), dailyLimitUrl (copy), value (ref), network (copy), responseDecodersModule (copy), asPromise (copy)
				return if var8 or var3 ~= var3 then promiseModule.reject("Creator Credit store changed before queued daily-limit write") else asPromise(fetch({
					method = "PUT",
					analyticsKey = "creator-credit.set-daily-limit",
					url = dailyLimitUrl,
					body = value,
					network = network,
					decode = responseDecodersModule.decodeDailyLimitSettings
				}))
			end)
			var7 = var11
			
			return var11:andThen(function(p2)
				-- upvalues: var8 (copy), var3 (ref), var3 (copy), var4 (copy), var2 (copy), var1 (copy)
				if not var8 and var3 == var3 then
					var4 += 1
					var2.replaceItem("current-user", p2)
					local var12 = var1.getItem("current-user").data(false)
					
					if var12 then
						local cloned = table.clone(var12)
						cloned.limitSettings = p2
						var1.replaceItem("current-user", cloned)
					end
				end
				return p2
			end)
		end,
		clear = function()
			-- upvalues: var3 (write), var4 (write), var9 (ref), var10 (ref)
			var3 += 1
			var4 += 1
			var9.clear()
			var10.clear()
		end,
		dispose = function()
			-- upvalues: var8 (write), var3 (write), var4 (write), var9 (ref), var10 (ref)
			if var8 then
				return
			end
			var8 = true
			var3 += 1
			var4 += 1
			var9.dispose()
			var10.dispose()
		end
	}
end