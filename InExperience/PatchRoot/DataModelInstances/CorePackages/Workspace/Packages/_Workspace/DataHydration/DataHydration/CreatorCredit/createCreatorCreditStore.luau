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

return function(p0) --[[ line: 30 | named "createCreatorCreditStore" ]]
	-- upvalues: configModule (ref), createDataCacheModule (ref), promiseModule (ref), asPromise (ref), fetch (ref), responseDecodersModule (ref), createDataResolverModule (ref)
	p0 = p0 or {}
	local quotaSummaryUrl = p0.quotaSummaryUrl or configModule.quotaSummaryUrl
	local dailyLimitUrl = p0.dailyLimitUrl or configModule.dailyLimitUrl
	local network = p0.network
	local ttlSeconds = p0.ttlSeconds or configModule.pollIntervalSeconds
	local var10 = createDataCacheModule(ttlSeconds, ttlSeconds)
	local var11 = createDataCacheModule(ttlSeconds, ttlSeconds)
	local var12 = 0
	local var13 = 0
	local var14 = promiseModule.resolve()
	local var15 = promiseModule.resolve()
	local var16 = promiseModule.resolve()
	local var17 = false
	
	local function fetchQuotaSummary(_) --[[ line: 46 ]]
		-- upvalues: var12 (write), var13 (write), var14 (write), var17 (write), promiseModule (copy), asPromise (copy), fetch (copy), quotaSummaryUrl (ref), network (ref), responseDecodersModule (copy), var11 (ref)
		local var22 = var14:catch(function() --[[ line: 49 ]]
			return nil
		end):andThen(function() --[[ line: 52 ]]
			-- upvalues: var17 (copy), var12 (ref), var12 (copy), promiseModule (copy), asPromise (copy), fetch (copy), quotaSummaryUrl (copy), network (copy), responseDecodersModule (copy), var13 (ref), var13 (copy), var11 (copy)
			return if var17 or var12 ~= var12 then promiseModule.reject("Creator Credit store changed before queued quota read") else asPromise(fetch({
				method = "GET",
				analyticsKey = "creator-credit.get-quota-summary",
				url = quotaSummaryUrl,
				network = network,
				decode = responseDecodersModule.decodeQuotaSummary
			})):andThen(function(p1) --[[ line: 62 ]]
				-- upvalues: var17 (copy), var12 (copy), var12 (copy), promiseModule (copy), var13 (copy), var13 (copy), var11 (copy)
				if var17 or var12 ~= var12 then
					return promiseModule.reject("Creator Credit store changed during quota read")
				elseif var13 ~= var13 then
					local var23 = var11.getItem("current-user").data(false)
					
					if var23 then
						p1.limitSettings = var23
					end
				end
				return p1
			end)
		end)
		var14 = var22
		
		return var22
	end
	
	local var19 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var10,
		fetchFn = fetchQuotaSummary
	})
	
	local function fetchDailyLimit(_) --[[ line: 85 ]]
		-- upvalues: var12 (write), var13 (write), var15 (write), var17 (write), promiseModule (copy), asPromise (copy), fetch (copy), dailyLimitUrl (ref), network (ref), responseDecodersModule (copy), var11 (ref)
		local var24 = var15:catch(function() --[[ line: 88 ]]
			return nil
		end):andThen(function() --[[ line: 91 ]]
			-- upvalues: var17 (copy), var12 (ref), var12 (copy), promiseModule (copy), asPromise (copy), fetch (copy), dailyLimitUrl (copy), network (copy), responseDecodersModule (copy), var13 (ref), var13 (copy), var11 (copy)
			return if var17 or var12 ~= var12 then promiseModule.reject("Creator Credit store changed before queued daily-limit read") else asPromise(fetch({
				method = "GET",
				analyticsKey = "creator-credit.get-daily-limit",
				url = dailyLimitUrl,
				network = network,
				decode = responseDecodersModule.decodeDailyLimitSettings
			})):andThen(function(p2) --[[ line: 101 ]]
				-- upvalues: var17 (copy), var12 (copy), var12 (copy), promiseModule (copy), var13 (copy), var13 (copy), var11 (copy)
				return if var17 or var12 ~= var12 then promiseModule.reject("Creator Credit store changed during daily-limit read") elseif var13 == var13 then p2 else var11.getItem("current-user").data(false) or p2
			end)
		end)
		var15 = var24
		
		return var24
	end
	
	local var21 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var11,
		fetchFn = fetchDailyLimit
	})
	
	return {
		getQuotaSummary = function() --[[ line: 121 ]]
			-- upvalues: var19 (ref)
			return var19.getAndFetchItem("current-user")
		end,
		getQuotaSummarySignals = function() --[[ line: 125 ]]
			-- upvalues: var19 (ref)
			return var19.getCachedItem("current-user")
		end,
		refreshQuotaSummary = function() --[[ line: 129 ]]
			-- upvalues: var12 (write), fetchQuotaSummary (ref), var17 (write), promiseModule (copy), var10 (ref)
			return fetchQuotaSummary("current-user"):andThen(function(p3) --[[ line: 131 ]]
				-- upvalues: var17 (copy), var12 (ref), var12 (copy), promiseModule (copy), var10 (copy)
				if var17 or var12 ~= var12 then
					return promiseModule.reject("Creator Credit store changed during quota refresh")
				end
				var10.replaceItem("current-user", p3)
				
				return p3
			end)
		end,
		getDailyLimit = function() --[[ line: 140 ]]
			-- upvalues: var21 (ref)
			return var21.getAndFetchItem("current-user")
		end,
		getDailyLimitSignals = function() --[[ line: 144 ]]
			-- upvalues: var21 (ref)
			return var21.getCachedItem("current-user")
		end,
		refreshDailyLimit = function() --[[ line: 148 ]]
			-- upvalues: var12 (write), fetchDailyLimit (ref), var17 (write), promiseModule (copy), var11 (ref)
			return fetchDailyLimit("current-user"):andThen(function(p4) --[[ line: 150 ]]
				-- upvalues: var17 (copy), var12 (ref), var12 (copy), promiseModule (copy), var11 (copy)
				if var17 or var12 ~= var12 then
					return promiseModule.reject("Creator Credit store changed during daily-limit refresh")
				end
				var11.replaceItem("current-user", p4)
				
				return p4
			end)
		end,
		setDailyLimit = function(value) --[[ line: 159 ]]
			-- upvalues: var12 (write), var16 (write), var17 (write), promiseModule (copy), fetch (copy), dailyLimitUrl (ref), network (ref), responseDecodersModule (copy), asPromise (copy), var13 (write), var11 (ref), var10 (ref)
			local var25 = var16:catch(function() --[[ line: 161 ]] end):andThen(function() --[[ line: 162 ]]
				-- upvalues: var17 (copy), var12 (ref), var12 (copy), promiseModule (copy), fetch (copy), dailyLimitUrl (copy), value (ref), network (copy), responseDecodersModule (copy), asPromise (copy)
				return if var17 or var12 ~= var12 then promiseModule.reject("Creator Credit store changed before queued daily-limit write") else asPromise(fetch({
					method = "PUT",
					analyticsKey = "creator-credit.set-daily-limit",
					url = dailyLimitUrl,
					body = value,
					network = network,
					decode = responseDecodersModule.decodeDailyLimitSettings
				}))
			end)
			var16 = var25
			
			return var25:andThen(function(p5) --[[ line: 179 ]]
				-- upvalues: var17 (copy), var12 (ref), var12 (copy), var13 (copy), var11 (copy), var10 (copy)
				if not var17 and var12 == var12 then
					var13 += 1
					var11.replaceItem("current-user", p5)
					local var26 = var10.getItem("current-user").data(false)
					
					if var26 then
						local cloned = table.clone(var26)
						cloned.limitSettings = p5
						var10.replaceItem("current-user", cloned)
					end
				end
				return p5
			end)
		end,
		clear = function() --[[ line: 194 ]]
			-- upvalues: var12 (write), var13 (write), var19 (ref), var21 (ref)
			var12 += 1
			var13 += 1
			var19.clear()
			var21.clear()
		end,
		dispose = function() --[[ line: 201 ]]
			-- upvalues: var17 (write), var12 (write), var13 (write), var19 (ref), var21 (ref)
			if var17 then
				return
			end
			var17 = true
			var12 += 1
			var13 += 1
			var19.dispose()
			var21.dispose()
		end
	}
end