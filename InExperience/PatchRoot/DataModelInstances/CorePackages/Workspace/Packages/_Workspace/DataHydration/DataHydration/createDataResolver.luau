local playersService = game:GetService("Players")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(dataHydration.DataHydrationTypes)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local createRequestQueueModule = require(dataHydration.createRequestQueue)
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppDataHydrationDataResolverOnClear = sharedFlagsModule.FFlagLuaAppDataHydrationDataResolverOnClear
local fFlagSduiChartsSupport = sharedFlagsModule.FFlagSduiChartsSupport
local fFlagSduiDataCacheResetItem = sharedFlagsModule.FFlagSduiDataCacheResetItem
local luaAppDataHydrationDefaultBatchSize = game:DefineFastInt("LuaAppDataHydrationDefaultBatchSize", 50)
local luaAppDataHydrationQueueProcessDelaySec = game:DefineFastInt("LuaAppDataHydrationQueueProcessDelaySec", 1)
local luaAppDataHydrationDefaultRequestTimeoutSec = game:DefineFastInt("LuaAppDataHydrationDefaultRequestTimeoutSec", 30)

return function(p0) --[[ line: 26 | named "createDataResolver" ]]
	-- upvalues: luaAppDataHydrationDefaultBatchSize (ref), luaAppDataHydrationQueueProcessDelaySec (ref), luaAppDataHydrationDefaultRequestTimeoutSec (ref), createRequestQueueModule (ref), getLocalPlayerUserId (ref), promiseModule (ref), fFlagSduiDataCacheResetItem (ref), fFlagSduiChartsSupport (ref), fFlagLuaAppDataHydrationDataResolverOnClear (ref), playersService (ref)
	local var8 = p0.supportsMultiGet ~= nil or p0.supportsMultiGet
	local var9 = p0.requestBatchSize or luaAppDataHydrationDefaultBatchSize
	
	if not var8 and not p0.requestBatchSize then
		var9 = 1
	end
	local var10 = p0.queueProcessDelaySec or luaAppDataHydrationQueueProcessDelaySec
	
	if not var8 and not p0.queueProcessDelaySec then
		var10 = 0
	end
	local requestTimeoutSec = p0.requestTimeoutSec or luaAppDataHydrationDefaultRequestTimeoutSec
	local cache = p0.cache
	local var12 = createRequestQueueModule()
	local t = {}
	local var14 = nil
	local var15 = getLocalPlayerUserId()
	
	local function FORCE_FETCH() --[[ line: 58 ]]
		return true
	end
	
	local function _(p1) --[[ line: 62 | named "logError" ]]
		-- upvalues: p0 (ref)
		if p0.logError then
			p0.logError(p1)
		end
	end
	
	local _ = function(p2, p3, p4) --[[ line: 69 | named "handleFailure" ]]
		-- upvalues: var15 (write), p0 (ref), t (write), cache (ref)
		if p4 ~= var15 then return end
		if p0.logError then
			p0.logError(p2)
		end
		for i, v in p3 do
			t[v] = nil
		end
		cache.markItemsAsFailed(p3)
	end
	
	local function handleSuccess(p5, p6, p7) --[[ line: 82 ]]
		-- upvalues: var15 (write), t (write), p0 (ref), cache (ref)
		if p7 ~= var15 then return end
		for i, v in p5 do
			t[i] = nil
		end
		if p0.replaceItems then
			cache.replaceItems(p5)
		else
			cache.updateItems(p5)
		end
		local t_1 = {}
		
		for v, v_1 in p6 do
			if p5[v_1] == nil then
				table.insert(t_1, v_1)
			end
		end
		if #t_1 > 0 then
			if p7 ~= var15 then return end
			if p0.logError then
				p0.logError("Items missing in response")
			end
			for v, v_2 in t_1 do
				t[v_2] = nil
			end
			cache.markItemsAsFailed(t_1)
		end
	end
	
	local function scheduleFetch() --[[ line: 109 ]]
		-- upvalues: var14 (write), var12 (ref), var10 (write), var15 (write), var9 (write), t (write), cache (ref), requestTimeoutSec (ref), p0 (ref), var8 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref)
		if var14 == nil and not var12.isEmpty() then
			var14 = task.delay(var10, function() --[[ line: 115 ]]
				-- upvalues: var15 (copy), var14 (copy), var12 (copy), var9 (copy), t (copy), cache (copy), requestTimeoutSec (copy), p0 (copy), var8 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				var14 = nil
				
				if var12.isEmpty() then return end
				local var29 = var12.pop(var9)
				
				for i, v in var29 do
					t[v] = true
				end
				local items = cache.getItems(var29)
				local delayedThread = task.delay(requestTimeoutSec, function() --[[ line: 130 ]]
					-- upvalues: requestTimeoutSec (copy), var29 (ref), var15 (ref), var15 (copy), p0 (copy), t (copy), cache (copy)
					local var32 = `No fetch response after {requestTimeoutSec} sec`
					
					if var15 ~= var15 then return end
					if p0.logError then
						p0.logError(var32)
					end
					for i, v in var29 do
						t[v] = nil
					end
					cache.markItemsAsFailed(var29)
				end)
				local ok, status = pcall(function() --[[ line: 134 ]]
					-- upvalues: var8 (copy), var29 (ref), items (ref), p0 (copy), promiseModule (copy), handleSuccess (copy), var15 (ref), delayedThread (ref), var15 (copy), t (copy), cache (copy)
					if var8 then
						p0.fetchFn(items):andThen(function(p9) --[[ line: 157 ]]
							-- upvalues: handleSuccess (copy), var29 (copy), var15 (copy), delayedThread (copy)
							handleSuccess(p9, var29, var15)
							task.cancel(delayedThread)
						end):catch(function(p8) --[[ line: 161 ]]
							-- upvalues: var29 (copy), var15 (copy), var15 (copy), p0 (copy), t (copy), cache (copy), delayedThread (copy)
							if var15 == var15 then
								if p0.logError then
									p0.logError(p8)
								end
								for i, v in var29 do
									t[v] = nil
								end
								cache.markItemsAsFailed(var29)
							end
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t_1 = {}
					
					for i, v in var29 do
						table.insert(t_1, p0.fetchFn(v, items[v]))
					end
					promiseModule.all(t_1):andThen(function(p11) --[[ line: 143 ]]
						-- upvalues: var29 (copy), handleSuccess (copy), var15 (copy), delayedThread (copy)
						local t = {}
						
						for i, v in var29 do
							t[v] = p11[i]
						end
						handleSuccess(t, var29, var15)
						task.cancel(delayedThread)
					end):catch(function(p10) --[[ line: 151 ]]
						-- upvalues: var29 (copy), var15 (copy), var15 (copy), p0 (copy), t (copy), cache (copy), delayedThread (copy)
						if var15 == var15 then
							if p0.logError then
								p0.logError(p10)
							end
							for i, v in var29 do
								t[v] = nil
							end
							cache.markItemsAsFailed(var29)
						end
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					if var15 == var15 then
						if p0.logError then
							p0.logError(status)
						end
						for i_1, v_1 in var29 do
							t[v_1] = nil
						end
						cache.markItemsAsFailed(var29)
					end
					task.cancel(delayedThread)
				end
				scheduleFetch()
			end)
			
			return
		end
	end
	
	local function isRequestInQueueOrInFlight(p12) --[[ line: 177 ]]
		-- upvalues: var12 (ref), t (write)
		return if var12.hasItem(p12) then true else t[p12] ~= nil
	end
	
	local function getAndFetchItems(p13, p14) --[[ line: 187 ]]
		-- upvalues: cache (ref), fFlagSduiDataCacheResetItem (copy), var12 (ref), t (write), var14 (write), var10 (write), var15 (write), var9 (write), requestTimeoutSec (ref), p0 (ref), var8 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref)
		local items, items_1 = cache.getItems(p13, p14)
		local t_1 = {}
		local var38 = if fFlagSduiDataCacheResetItem then {} else nil
		
		for i, v in items do
			t_1[i] = v
			
			if items_1[i] and not (if var12.hasItem(i) then true else t[i] == nil) then
				var12.push(i)
				
				if fFlagSduiDataCacheResetItem then
					table.insert(var38, i)
				end
			end
		end
		if fFlagSduiDataCacheResetItem and #var38 > 0 then
			cache.resetFailedItems(var38)
		end
		if not var12.isEmpty() and var14 == nil then
			if var12.isEmpty() then
				return t_1
			end
			var14 = task.delay(var10, function() --[[ line: 115 ]]
				-- upvalues: var15 (copy), var14 (copy), var12 (copy), var9 (copy), t (copy), cache (copy), requestTimeoutSec (copy), p0 (copy), var8 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				var14 = nil
				
				if var12.isEmpty() then return end
				local var29 = var12.pop(var9)
				
				for i, v in var29 do
					t[v] = true
				end
				local items = cache.getItems(var29)
				local delayedThread = task.delay(requestTimeoutSec, function() --[[ line: 130 ]]
					-- upvalues: requestTimeoutSec (copy), var29 (ref), var15 (ref), var15 (copy), p0 (copy), t (copy), cache (copy)
					local var32 = `No fetch response after {requestTimeoutSec} sec`
					
					if var15 ~= var15 then return end
					if p0.logError then
						p0.logError(var32)
					end
					for i, v in var29 do
						t[v] = nil
					end
					cache.markItemsAsFailed(var29)
				end)
				local ok, status = pcall(function() --[[ line: 134 ]]
					-- upvalues: var8 (copy), var29 (ref), items (ref), p0 (copy), promiseModule (copy), handleSuccess (copy), var15 (ref), delayedThread (ref), var15 (copy), t (copy), cache (copy)
					if var8 then
						p0.fetchFn(items):andThen(function(p16) --[[ line: 157 ]]
							-- upvalues: handleSuccess (copy), var29 (copy), var15 (copy), delayedThread (copy)
							handleSuccess(p16, var29, var15)
							task.cancel(delayedThread)
						end):catch(function(p15) --[[ line: 161 ]]
							-- upvalues: var29 (copy), var15 (copy), var15 (copy), p0 (copy), t (copy), cache (copy), delayedThread (copy)
							if var15 == var15 then
								if p0.logError then
									p0.logError(p15)
								end
								for i, v in var29 do
									t[v] = nil
								end
								cache.markItemsAsFailed(var29)
							end
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t_1 = {}
					
					for i, v in var29 do
						table.insert(t_1, p0.fetchFn(v, items[v]))
					end
					promiseModule.all(t_1):andThen(function(p18) --[[ line: 143 ]]
						-- upvalues: var29 (copy), handleSuccess (copy), var15 (copy), delayedThread (copy)
						local t = {}
						
						for i, v in var29 do
							t[v] = p18[i]
						end
						handleSuccess(t, var29, var15)
						task.cancel(delayedThread)
					end):catch(function(p17) --[[ line: 151 ]]
						-- upvalues: var29 (copy), var15 (copy), var15 (copy), p0 (copy), t (copy), cache (copy), delayedThread (copy)
						if var15 == var15 then
							if p0.logError then
								p0.logError(p17)
							end
							for i, v in var29 do
								t[v] = nil
							end
							cache.markItemsAsFailed(var29)
						end
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					if var15 == var15 then
						if p0.logError then
							p0.logError(status)
						end
						for i_1, v_1 in var29 do
							t[v_1] = nil
						end
						cache.markItemsAsFailed(var29)
					end
					task.cancel(delayedThread)
				end
				scheduleFetch()
			end)
		end
		return t_1
	end
	
	local function getAndFetchItem(p19, p20) --[[ line: 211 ]]
		-- upvalues: cache (ref), var12 (ref), t (write), fFlagSduiDataCacheResetItem (copy), var14 (write), var10 (write), var15 (write), var9 (write), requestTimeoutSec (ref), p0 (ref), var8 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref), fFlagSduiChartsSupport (copy)
		local item, item_1 = cache.getItem(p19, p20)
		
		if item_1 and not (if var12.hasItem(p19) then true else t[p19] == nil) then
			if fFlagSduiDataCacheResetItem then
				cache.resetFailedItem(p19)
			end
			var12.push(p19)
		end
		if not var12.isEmpty() and var14 == nil and not var12.isEmpty() then
			var14 = task.delay(var10, function() --[[ line: 115 ]]
				-- upvalues: var15 (copy), var14 (copy), var12 (copy), var9 (copy), t (copy), cache (copy), requestTimeoutSec (copy), p0 (copy), var8 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				var14 = nil
				
				if var12.isEmpty() then return end
				local var29 = var12.pop(var9)
				
				for i, v in var29 do
					t[v] = true
				end
				local items = cache.getItems(var29)
				local delayedThread = task.delay(requestTimeoutSec, function() --[[ line: 130 ]]
					-- upvalues: requestTimeoutSec (copy), var29 (ref), var15 (ref), var15 (copy), p0 (copy), t (copy), cache (copy)
					local var32 = `No fetch response after {requestTimeoutSec} sec`
					
					if var15 ~= var15 then return end
					if p0.logError then
						p0.logError(var32)
					end
					for i, v in var29 do
						t[v] = nil
					end
					cache.markItemsAsFailed(var29)
				end)
				local ok, status = pcall(function() --[[ line: 134 ]]
					-- upvalues: var8 (copy), var29 (ref), items (ref), p0 (copy), promiseModule (copy), handleSuccess (copy), var15 (ref), delayedThread (ref), var15 (copy), t (copy), cache (copy)
					if var8 then
						p0.fetchFn(items):andThen(function(p22) --[[ line: 157 ]]
							-- upvalues: handleSuccess (copy), var29 (copy), var15 (copy), delayedThread (copy)
							handleSuccess(p22, var29, var15)
							task.cancel(delayedThread)
						end):catch(function(p21) --[[ line: 161 ]]
							-- upvalues: var29 (copy), var15 (copy), var15 (copy), p0 (copy), t (copy), cache (copy), delayedThread (copy)
							if var15 == var15 then
								if p0.logError then
									p0.logError(p21)
								end
								for i, v in var29 do
									t[v] = nil
								end
								cache.markItemsAsFailed(var29)
							end
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t_1 = {}
					
					for i, v in var29 do
						table.insert(t_1, p0.fetchFn(v, items[v]))
					end
					promiseModule.all(t_1):andThen(function(p24) --[[ line: 143 ]]
						-- upvalues: var29 (copy), handleSuccess (copy), var15 (copy), delayedThread (copy)
						local t = {}
						
						for i, v in var29 do
							t[v] = p24[i]
						end
						handleSuccess(t, var29, var15)
						task.cancel(delayedThread)
					end):catch(function(p23) --[[ line: 151 ]]
						-- upvalues: var29 (copy), var15 (copy), var15 (copy), p0 (copy), t (copy), cache (copy), delayedThread (copy)
						if var15 == var15 then
							if p0.logError then
								p0.logError(p23)
							end
							for i, v in var29 do
								t[v] = nil
							end
							cache.markItemsAsFailed(var29)
						end
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					if var15 == var15 then
						if p0.logError then
							p0.logError(status)
						end
						for i_1, v_1 in var29 do
							t[v_1] = nil
						end
						cache.markItemsAsFailed(var29)
					end
					task.cancel(delayedThread)
				end
				scheduleFetch()
			end)
		end
		if fFlagSduiChartsSupport then
			return item, item_1
		end
		return item, nil
	end
	
	local function getCachedItem(p25) --[[ line: 230 ]]
		-- upvalues: cache (ref)
		return cache.getItem(p25)
	end
	
	local function getCachedItems(p26) --[[ line: 234 ]]
		-- upvalues: cache (ref)
		return cache.getItems(p26)
	end
	
	local function fetchItem(p27, p28) --[[ line: 238 ]]
		-- upvalues: getAndFetchItem (ref), FORCE_FETCH (ref)
		return getAndFetchItem(p27, p28 or FORCE_FETCH)
	end
	
	local function fetchItems(p29, p30) --[[ line: 242 ]]
		-- upvalues: getAndFetchItems (ref), FORCE_FETCH (ref)
		return getAndFetchItems(p29, p30 or FORCE_FETCH)
	end
	
	local function clear() --[[ line: 246 ]]
		-- upvalues: var14 (write), t (write), cache (ref), var12 (ref), fFlagLuaAppDataHydrationDataResolverOnClear (copy), p0 (ref)
		if var14 then
			task.cancel(var14)
			var14 = nil
		end
		t = {}
		cache.clear()
		var12.clear()
		
		if fFlagLuaAppDataHydrationDataResolverOnClear and p0.onClear then
			p0.onClear()
		end
	end
	
	local var27 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ line: 260 ]]
		-- upvalues: getLocalPlayerUserId (copy), var15 (write), clear (ref)
		local var41 = getLocalPlayerUserId()
		
		if var41 ~= var15 then
			var15 = var41
			clear()
		end
	end)
	
	return {
		getAndFetchItems = getAndFetchItems,
		getAndFetchItem = getAndFetchItem,
		getCachedItem = getCachedItem,
		getCachedItems = getCachedItems,
		fetchItem = fetchItem,
		fetchItems = fetchItems,
		isRequestInQueueOrInFlight = isRequestInQueueOrInFlight,
		dispose = function() --[[ line: 268 ]]
			-- upvalues: var27 (write), cache (ref)
			if var27 then
				var27:Disconnect()
				var27 = nil
			end
			cache.dispose()
		end,
		clear = clear
	}
end