local playersService = game:GetService("Players")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(dataHydration.DataHydrationTypes)
local dataHydrationUtilsModule = require(dataHydration.DataHydrationUtils)
local getLocalPlayerUserId = dataHydrationUtilsModule.getLocalPlayerUserId
local observeLocalPlayerUserId = dataHydrationUtilsModule.observeLocalPlayerUserId
local createRequestQueueModule = require(dataHydration.createRequestQueue)
local createMutationLayerModule = require(dataHydration.createMutationLayer)
local promiseModule = require(parent.Promise)
local fFlagDataHydrationAccountReset = require(parent.SharedFlags).FFlagDataHydrationAccountReset
local luaAppDataHydrationDefaultBatchSize = game:DefineFastInt("LuaAppDataHydrationDefaultBatchSize", 50)
local luaAppDataHydrationQueueProcessDelaySec = game:DefineFastInt("LuaAppDataHydrationQueueProcessDelaySec", 1)
local luaAppDataHydrationDefaultRequestTimeoutSec = game:DefineFastInt("LuaAppDataHydrationDefaultRequestTimeoutSec", 30)

return function(p1)
	-- upvalues: luaAppDataHydrationDefaultBatchSize (ref), luaAppDataHydrationQueueProcessDelaySec (ref), luaAppDataHydrationDefaultRequestTimeoutSec (ref), createRequestQueueModule (ref), getLocalPlayerUserId (ref), fFlagDataHydrationAccountReset (ref), createMutationLayerModule (ref), promiseModule (ref), observeLocalPlayerUserId (ref), playersService (ref)
	local var1 = p1.supportsMultiGet ~= nil or p1.supportsMultiGet
	local var2 = p1.requestBatchSize or luaAppDataHydrationDefaultBatchSize
	
	if not var1 and not p1.requestBatchSize then
		var2 = 1
	end
	local var3 = p1.queueProcessDelaySec or luaAppDataHydrationQueueProcessDelaySec
	
	if not var1 and not p1.queueProcessDelaySec then
		var3 = 0
	end
	local requestTimeoutSec = p1.requestTimeoutSec or luaAppDataHydrationDefaultRequestTimeoutSec
	local cache = p1.cache
	local var4 = createRequestQueueModule()
	local t = {}
	local var5 = nil
	local var6 = getLocalPlayerUserId()
	local var7 = if fFlagDataHydrationAccountReset then 0 else nil
	local var8 = if p1.supportsMutations then createMutationLayerModule() else nil
	
	local function FORCE_FETCH()
		return true
	end
	
	local function _(p2)
		-- upvalues: p1 (ref)
		if p1.logError then
			p1.logError(p2)
		end
	end
	
	local _ = function(p2, p3)
		-- upvalues: var7 (write), getLocalPlayerUserId (copy)
		return p3 == var7 and p2 == getLocalPlayerUserId()
	end
	
	local function handleFailure(p2, p3, p4, p5)
		-- upvalues: fFlagDataHydrationAccountReset (copy), var7 (write), getLocalPlayerUserId (copy), var6 (write), p1 (ref), t (write), cache (ref), var8 (write)
		if fFlagDataHydrationAccountReset then
			if not (p5 == var7 and p4 == getLocalPlayerUserId()) then return end
		elseif p4 ~= var6 then return end
		if p1.logError then
			p1.logError(p2)
		end
		for i, v in p3 do
			t[v] = nil
		end
		cache.markItemsAsFailed(p3)
		
		if var8 then
			var8.drainCommitted(p3, cache.updateItem)
		end
	end
	
	local function handleSuccess(p6, p7, p8, p9)
		-- upvalues: fFlagDataHydrationAccountReset (copy), var7 (write), getLocalPlayerUserId (copy), var6 (write), t (write), p1 (ref), cache (ref), var8 (write), handleFailure (ref)
		if fFlagDataHydrationAccountReset then
			if not (p9 == var7 and p8 == getLocalPlayerUserId()) then return end
		elseif p8 ~= var6 then return end
		for i, v in p6 do
			t[i] = nil
		end
		if p1.replaceItems then
			cache.replaceItems(p6)
		else
			cache.updateItems(p6)
		end
		local t_1 = {}
		
		for v, v_1 in p7 do
			if p6[v_1] == nil then
				if var8 and var8.isCommitted(v_1) then
					t[v_1] = nil
				else
					table.insert(t_1, v_1)
				end
			end
		end
		if var8 then
			var8.drainCommitted(p7, cache.updateItem)
		end
		if #t_1 > 0 then
			handleFailure("Items missing in response", t_1, p8, p9)
		end
	end
	
	local function scheduleFetch()
		-- upvalues: var5 (write), var4 (ref), var3 (write), var6 (write), fFlagDataHydrationAccountReset (copy), var7 (write), var2 (write), t (write), cache (ref), requestTimeoutSec (ref), handleFailure (ref), var1 (ref), p1 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref)
		if var5 == nil and not var4.isEmpty() then
			var5 = task.delay(var3, function()
				-- upvalues: var6 (copy), fFlagDataHydrationAccountReset (copy), var7 (copy), var5 (copy), var4 (copy), var2 (copy), t (copy), cache (copy), requestTimeoutSec (copy), handleFailure (copy), var1 (copy), p1 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				local var9 = if fFlagDataHydrationAccountReset then var7 else nil
				var5 = nil
				
				if var4.isEmpty() then return end
				local var10 = var4.pop(var2)
				
				for i, v in var10 do
					t[v] = true
				end
				local items = cache.getItems(var10)
				local delayedThread = task.delay(requestTimeoutSec, function()
					-- upvalues: handleFailure (copy), requestTimeoutSec (copy), var10 (ref), var6 (ref), var9 (ref)
					handleFailure(`No fetch response after {requestTimeoutSec} sec`, var10, var6, var9)
				end)
				local ok, status = pcall(function()
					-- upvalues: var1 (copy), var10 (ref), items (ref), p1 (copy), promiseModule (copy), handleSuccess (copy), var6 (ref), var9 (ref), delayedThread (ref), handleFailure (copy)
					if var1 then
						p1.fetchFn(items):andThen(function(p10)
							-- upvalues: handleSuccess (copy), var10 (copy), var6 (copy), var9 (copy), delayedThread (copy)
							handleSuccess(p10, var10, var6, var9)
							task.cancel(delayedThread)
						end):catch(function(p10)
							-- upvalues: handleFailure (copy), var10 (copy), var6 (copy), var9 (copy), delayedThread (copy)
							handleFailure(p10, var10, var6, var9)
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t = {}
					
					for i, v in var10 do
						table.insert(t, p1.fetchFn(v, items[v]))
					end
					promiseModule.all(t):andThen(function(p10)
						-- upvalues: var10 (copy), handleSuccess (copy), var6 (copy), var9 (copy), delayedThread (copy)
						local t = {}
						
						for i, v in var10 do
							t[v] = p10[i]
						end
						handleSuccess(t, var10, var6, var9)
						task.cancel(delayedThread)
					end):catch(function(p11)
						-- upvalues: handleFailure (copy), var10 (copy), var6 (copy), var9 (copy), delayedThread (copy)
						handleFailure(p11, var10, var6, var9)
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					handleFailure(status, var10, var6, var9)
					task.cancel(delayedThread)
				end
				scheduleFetch()
			end)
			
			return
		end
	end
	
	local function isRequestInQueueOrInFlight(p10)
		-- upvalues: var4 (ref), t (write)
		return if var4.hasItem(p10) then true else t[p10] ~= nil
	end
	
	local function getAndFetchItems(p10, p11)
		-- upvalues: cache (ref), var4 (ref), t (write), var5 (write), var3 (write), var6 (write), fFlagDataHydrationAccountReset (copy), var7 (write), var2 (write), requestTimeoutSec (ref), handleFailure (ref), var1 (ref), p1 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref)
		local items, items_1 = cache.getItems(p10, p11)
		local t_1 = {}
		local t_2 = {}
		
		for i, v in items do
			t_1[i] = v
			
			if items_1[i] and not (if var4.hasItem(i) then true else t[i] == nil) then
				var4.push(i)
				table.insert(t_2, i)
			end
		end
		if #t_2 > 0 then
			cache.resetFailedItems(t_2)
		end
		if not var4.isEmpty() and var5 == nil then
			if var4.isEmpty() then
				return t_1
			end
			var5 = task.delay(var3, function()
				-- upvalues: var6 (copy), fFlagDataHydrationAccountReset (copy), var7 (copy), var5 (copy), var4 (copy), var2 (copy), t (copy), cache (copy), requestTimeoutSec (copy), handleFailure (copy), var1 (copy), p1 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				local var11 = if fFlagDataHydrationAccountReset then var7 else nil
				var5 = nil
				
				if var4.isEmpty() then return end
				local var12 = var4.pop(var2)
				
				for i, v in var12 do
					t[v] = true
				end
				local items = cache.getItems(var12)
				local delayedThread = task.delay(requestTimeoutSec, function()
					-- upvalues: handleFailure (copy), requestTimeoutSec (copy), var12 (ref), var6 (ref), var11 (ref)
					handleFailure(`No fetch response after {requestTimeoutSec} sec`, var12, var6, var11)
				end)
				local ok, status = pcall(function()
					-- upvalues: var1 (copy), var12 (ref), items (ref), p1 (copy), promiseModule (copy), handleSuccess (copy), var6 (ref), var11 (ref), delayedThread (ref), handleFailure (copy)
					if var1 then
						p1.fetchFn(items):andThen(function(p12)
							-- upvalues: handleSuccess (copy), var12 (copy), var6 (copy), var11 (copy), delayedThread (copy)
							handleSuccess(p12, var12, var6, var11)
							task.cancel(delayedThread)
						end):catch(function(p12)
							-- upvalues: handleFailure (copy), var12 (copy), var6 (copy), var11 (copy), delayedThread (copy)
							handleFailure(p12, var12, var6, var11)
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t = {}
					
					for i, v in var12 do
						table.insert(t, p1.fetchFn(v, items[v]))
					end
					promiseModule.all(t):andThen(function(p12)
						-- upvalues: var12 (copy), handleSuccess (copy), var6 (copy), var11 (copy), delayedThread (copy)
						local t = {}
						
						for i, v in var12 do
							t[v] = p12[i]
						end
						handleSuccess(t, var12, var6, var11)
						task.cancel(delayedThread)
					end):catch(function(p13)
						-- upvalues: handleFailure (copy), var12 (copy), var6 (copy), var11 (copy), delayedThread (copy)
						handleFailure(p13, var12, var6, var11)
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					handleFailure(status, var12, var6, var11)
					task.cancel(delayedThread)
				end
				scheduleFetch()
			end)
		end
		return t_1
	end
	
	local function getAndFetchItem(p12, p13)
		-- upvalues: cache (ref), var4 (ref), t (write), var5 (write), var3 (write), var6 (write), fFlagDataHydrationAccountReset (copy), var7 (write), var2 (write), requestTimeoutSec (ref), handleFailure (ref), var1 (ref), p1 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref)
		local item, item_1 = cache.getItem(p12, p13)
		
		if item_1 and not (if var4.hasItem(p12) then true else t[p12] == nil) then
			cache.resetFailedItem(p12)
			var4.push(p12)
		end
		if not var4.isEmpty() and var5 == nil then
			if var4.isEmpty() then
				return item, item_1
			end
			var5 = task.delay(var3, function()
				-- upvalues: var6 (copy), fFlagDataHydrationAccountReset (copy), var7 (copy), var5 (copy), var4 (copy), var2 (copy), t (copy), cache (copy), requestTimeoutSec (copy), handleFailure (copy), var1 (copy), p1 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				local var13 = if fFlagDataHydrationAccountReset then var7 else nil
				var5 = nil
				
				if var4.isEmpty() then return end
				local var14 = var4.pop(var2)
				
				for i, v in var14 do
					t[v] = true
				end
				local items = cache.getItems(var14)
				local delayedThread = task.delay(requestTimeoutSec, function()
					-- upvalues: handleFailure (copy), requestTimeoutSec (copy), var14 (ref), var6 (ref), var13 (ref)
					handleFailure(`No fetch response after {requestTimeoutSec} sec`, var14, var6, var13)
				end)
				local ok, status = pcall(function()
					-- upvalues: var1 (copy), var14 (ref), items (ref), p1 (copy), promiseModule (copy), handleSuccess (copy), var6 (ref), var13 (ref), delayedThread (ref), handleFailure (copy)
					if var1 then
						p1.fetchFn(items):andThen(function(p14)
							-- upvalues: handleSuccess (copy), var14 (copy), var6 (copy), var13 (copy), delayedThread (copy)
							handleSuccess(p14, var14, var6, var13)
							task.cancel(delayedThread)
						end):catch(function(p14)
							-- upvalues: handleFailure (copy), var14 (copy), var6 (copy), var13 (copy), delayedThread (copy)
							handleFailure(p14, var14, var6, var13)
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t = {}
					
					for i, v in var14 do
						table.insert(t, p1.fetchFn(v, items[v]))
					end
					promiseModule.all(t):andThen(function(p14)
						-- upvalues: var14 (copy), handleSuccess (copy), var6 (copy), var13 (copy), delayedThread (copy)
						local t = {}
						
						for i, v in var14 do
							t[v] = p14[i]
						end
						handleSuccess(t, var14, var6, var13)
						task.cancel(delayedThread)
					end):catch(function(p15)
						-- upvalues: handleFailure (copy), var14 (copy), var6 (copy), var13 (copy), delayedThread (copy)
						handleFailure(p15, var14, var6, var13)
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					handleFailure(status, var14, var6, var13)
					task.cancel(delayedThread)
				end
				scheduleFetch()
			end)
		end
		return item, item_1
	end
	
	local function getCachedItem(p14)
		-- upvalues: cache (ref)
		return cache.getItem(p14)
	end
	
	local function getCachedItems(p14)
		-- upvalues: cache (ref)
		return cache.getItems(p14)
	end
	
	local function fetchItem(p14, p15)
		-- upvalues: getAndFetchItem (ref), FORCE_FETCH (ref)
		return getAndFetchItem(p14, p15 or FORCE_FETCH)
	end
	
	local function fetchItems(p14, p15)
		-- upvalues: getAndFetchItems (ref), FORCE_FETCH (ref)
		return getAndFetchItems(p14, p15 or FORCE_FETCH)
	end
	
	local function clear()
		-- upvalues: fFlagDataHydrationAccountReset (copy), var7 (write), var5 (write), t (write), var4 (ref), var8 (write), p1 (ref), cache (ref)
		if fFlagDataHydrationAccountReset then
			var7 += 1
		end
		if var5 then
			task.cancel(var5)
			var5 = nil
		end
		t = {}
		
		if fFlagDataHydrationAccountReset then
			var4.clear()
			
			if var8 then
				var8.clearAll()
			end
			if p1.onBeforeClear then
				p1.onBeforeClear()
			end
			cache.clear()
			
			if p1.onClear then
				p1.onClear()
				
				return
			end
		else
			cache.clear()
			var4.clear()
			
			if var8 then
				var8.clearAll()
			end
			if p1.onClear then
				p1.onClear()
			end
		end
	end
	
	local var15 = nil
	local var16 = nil
	
	if fFlagDataHydrationAccountReset then
		var16 = observeLocalPlayerUserId(function(p14)
			-- upvalues: var6 (write), clear (ref)
			var6 = p14
			clear()
		end)
	else
		var15 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
			-- upvalues: getLocalPlayerUserId (copy), var6 (write), clear (ref)
			local var17 = getLocalPlayerUserId()
			
			if var17 ~= var6 then
				var6 = var17
				clear()
			end
		end)
	end
	local t_1 = {
		getAndFetchItems = getAndFetchItems,
		getAndFetchItem = getAndFetchItem,
		getCachedItem = getCachedItem,
		getCachedItems = getCachedItems,
		fetchItem = fetchItem,
		fetchItems = fetchItems,
		isRequestInQueueOrInFlight = isRequestInQueueOrInFlight,
		dispose = function()
			-- upvalues: var16 (write), var15 (write), fFlagDataHydrationAccountReset (copy), clear (ref), cache (ref)
			if var16 then
				var16()
				var16 = nil
			end
			if var15 then
				var15:Disconnect()
				var15 = nil
			end
			if fFlagDataHydrationAccountReset then
				clear()
			end
			cache.dispose()
		end,
		clear = clear
	}
	
	if var8 then
		function t_1.getOptimisticCachedItem(p14)
			-- upvalues: cache (ref), var8 (write)
			local item, item_1 = cache.getItem(p14)
			
			return var8.getMergedResult(p14, item), item_1
		end
		
		function t_1.getOptimisticCachedItems(p14)
			-- upvalues: cache (ref), var8 (write)
			local items, items_1 = cache.getItems(p14)
			local t = {}
			
			for i, v in items do
				t[i] = var8.getMergedResult(i, v)
			end
			return t, items_1
		end
		
		function t_1.getOptimisticAndFetchItem(p15, p16)
			-- upvalues: getAndFetchItem (ref), var8 (write)
			local var17, var18 = getAndFetchItem(p15, p16)
			
			return var8.getMergedResult(p15, var17), var18
		end
		
		function t_1.getOptimisticAndFetchItems(p15, p16)
			-- upvalues: getAndFetchItems (ref), var8 (write)
			local t = {}
			
			for i, v in getAndFetchItems(p15, p16) do
				t[i] = var8.getMergedResult(i, v)
			end
			return t
		end
		
		function t_1.setMutation(p17, p18)
			-- upvalues: var8 (write)
			var8.set(p17, p18)
		end
		
		function t_1.clearMutation(p17)
			-- upvalues: var8 (write)
			var8.clear(p17)
		end
		
		function t_1.commitMutation(p17)
			-- upvalues: var4 (ref), t (write), var8 (write), cache (ref)
			if if var4.hasItem(p17) then true else t[p17] == nil then
				var8.markCommitted(p17)
				
				return
			end
			local var17 = var8.get(p17)
			
			if var17 ~= nil then
				cache.updateItem(p17, var17)
			end
			var8.clear(p17)
		end
	end
	return t_1
end