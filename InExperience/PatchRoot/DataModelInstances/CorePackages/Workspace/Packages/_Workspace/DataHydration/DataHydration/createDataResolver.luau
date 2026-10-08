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
local signalsModule = require(parent.Signals)
local fFlagDataHydrationAccountReset = require(parent.SharedFlags).FFlagDataHydrationAccountReset
local luaAppDataHydrationDefaultBatchSize = game:DefineFastInt("LuaAppDataHydrationDefaultBatchSize", 50)
local luaAppDataHydrationQueueProcessDelaySec = game:DefineFastInt("LuaAppDataHydrationQueueProcessDelaySec", 1)
local luaAppDataHydrationDefaultRequestTimeoutSec = game:DefineFastInt("LuaAppDataHydrationDefaultRequestTimeoutSec", 30)

return function(p1)
	-- upvalues: luaAppDataHydrationDefaultBatchSize (ref), luaAppDataHydrationQueueProcessDelaySec (ref), luaAppDataHydrationDefaultRequestTimeoutSec (ref), createRequestQueueModule (ref), getLocalPlayerUserId (ref), fFlagDataHydrationAccountReset (ref), signalsModule (ref), createMutationLayerModule (ref), promiseModule (ref), observeLocalPlayerUserId (ref), playersService (ref)
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
	local var7 = nil
	local var8 = nil
	
	if fFlagDataHydrationAccountReset then
		local var9, var10 = signalsModule.createSignal(0)
		var7 = var9
		var8 = var10
	end
	local var11 = if p1.supportsMutations then createMutationLayerModule() else nil
	
	local function FORCE_FETCH()
		return true
	end
	
	local function _(p2)
		-- upvalues: p1 (ref)
		if p1.logError then
			p1.logError(p2)
		end
	end
	
	local function isCurrentRequest(p2, p3)
		-- upvalues: var7 (write), getLocalPlayerUserId (copy)
		return p3 == var7(false) and p2 == getLocalPlayerUserId()
	end
	
	local function handleFailure(p2, p3, p4, p5)
		-- upvalues: fFlagDataHydrationAccountReset (copy), var7 (write), getLocalPlayerUserId (copy), var6 (write), p1 (ref), t (write), cache (ref), var11 (write)
		if fFlagDataHydrationAccountReset then
			if not (p5 == var7(false) and p4 == getLocalPlayerUserId()) then return end
		elseif p4 ~= var6 then return end
		if p1.logError then
			p1.logError(p2)
		end
		for i, v in p3 do
			t[v] = nil
		end
		cache.markItemsAsFailed(p3)
		
		if var11 then
			var11.drainCommitted(p3, cache.updateItem)
		end
	end
	
	local function handleSuccess(p6, p7, p8, p9)
		-- upvalues: fFlagDataHydrationAccountReset (copy), var7 (write), getLocalPlayerUserId (copy), var6 (write), t (write), p1 (ref), cache (ref), var11 (write), handleFailure (ref)
		if fFlagDataHydrationAccountReset then
			if not (p9 == var7(false) and p8 == getLocalPlayerUserId()) then return end
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
				if var11 and var11.isCommitted(v_1) then
					t[v_1] = nil
				else
					table.insert(t_1, v_1)
				end
			end
		end
		if var11 then
			var11.drainCommitted(p7, cache.updateItem)
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
				local var12 = if fFlagDataHydrationAccountReset then var7(false) else nil
				var5 = nil
				
				if var4.isEmpty() then return end
				local var13 = var4.pop(var2)
				
				for i, v in var13 do
					t[v] = true
				end
				local items = cache.getItems(var13)
				local delayedThread = task.delay(requestTimeoutSec, function()
					-- upvalues: handleFailure (copy), requestTimeoutSec (copy), var13 (ref), var6 (ref), var12 (ref)
					handleFailure(`No fetch response after {requestTimeoutSec} sec`, var13, var6, var12)
				end)
				local ok, status = pcall(function()
					-- upvalues: var1 (copy), var13 (ref), items (ref), p1 (copy), promiseModule (copy), handleSuccess (copy), var6 (ref), var12 (ref), delayedThread (ref), handleFailure (copy)
					if var1 then
						p1.fetchFn(items):andThen(function(p10)
							-- upvalues: handleSuccess (copy), var13 (copy), var6 (copy), var12 (copy), delayedThread (copy)
							handleSuccess(p10, var13, var6, var12)
							task.cancel(delayedThread)
						end):catch(function(p10)
							-- upvalues: handleFailure (copy), var13 (copy), var6 (copy), var12 (copy), delayedThread (copy)
							handleFailure(p10, var13, var6, var12)
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t = {}
					
					for i, v in var13 do
						table.insert(t, p1.fetchFn(v, items[v]))
					end
					promiseModule.all(t):andThen(function(p10)
						-- upvalues: var13 (copy), handleSuccess (copy), var6 (copy), var12 (copy), delayedThread (copy)
						local t = {}
						
						for i, v in var13 do
							t[v] = p10[i]
						end
						handleSuccess(t, var13, var6, var12)
						task.cancel(delayedThread)
					end):catch(function(p11)
						-- upvalues: handleFailure (copy), var13 (copy), var6 (copy), var12 (copy), delayedThread (copy)
						handleFailure(p11, var13, var6, var12)
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					handleFailure(status, var13, var6, var12)
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
	
	local function getAndFetchItems(p10, p11, p12)
		-- upvalues: cache (ref), var4 (ref), t (write), var5 (write), var3 (write), var6 (write), fFlagDataHydrationAccountReset (copy), var7 (write), var2 (write), requestTimeoutSec (ref), handleFailure (ref), var1 (ref), p1 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref)
		local items, items_1 = cache.getItems(p10, p11, p12)
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
				local var14 = if fFlagDataHydrationAccountReset then var7(false) else nil
				var5 = nil
				
				if var4.isEmpty() then return end
				local var15 = var4.pop(var2)
				
				for i, v in var15 do
					t[v] = true
				end
				local items = cache.getItems(var15)
				local delayedThread = task.delay(requestTimeoutSec, function()
					-- upvalues: handleFailure (copy), requestTimeoutSec (copy), var15 (ref), var6 (ref), var14 (ref)
					handleFailure(`No fetch response after {requestTimeoutSec} sec`, var15, var6, var14)
				end)
				local ok, status = pcall(function()
					-- upvalues: var1 (copy), var15 (ref), items (ref), p1 (copy), promiseModule (copy), handleSuccess (copy), var6 (ref), var14 (ref), delayedThread (ref), handleFailure (copy)
					if var1 then
						p1.fetchFn(items):andThen(function(p13)
							-- upvalues: handleSuccess (copy), var15 (copy), var6 (copy), var14 (copy), delayedThread (copy)
							handleSuccess(p13, var15, var6, var14)
							task.cancel(delayedThread)
						end):catch(function(p13)
							-- upvalues: handleFailure (copy), var15 (copy), var6 (copy), var14 (copy), delayedThread (copy)
							handleFailure(p13, var15, var6, var14)
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t = {}
					
					for i, v in var15 do
						table.insert(t, p1.fetchFn(v, items[v]))
					end
					promiseModule.all(t):andThen(function(p13)
						-- upvalues: var15 (copy), handleSuccess (copy), var6 (copy), var14 (copy), delayedThread (copy)
						local t = {}
						
						for i, v in var15 do
							t[v] = p13[i]
						end
						handleSuccess(t, var15, var6, var14)
						task.cancel(delayedThread)
					end):catch(function(p14)
						-- upvalues: handleFailure (copy), var15 (copy), var6 (copy), var14 (copy), delayedThread (copy)
						handleFailure(p14, var15, var6, var14)
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					handleFailure(status, var15, var6, var14)
					task.cancel(delayedThread)
				end
				scheduleFetch()
			end)
		end
		return t_1
	end
	
	local function getAndFetchItem(p13, p14, p15)
		-- upvalues: cache (ref), var4 (ref), t (write), var5 (write), var3 (write), var6 (write), fFlagDataHydrationAccountReset (copy), var7 (write), var2 (write), requestTimeoutSec (ref), handleFailure (ref), var1 (ref), p1 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref)
		local item, item_1 = cache.getItem(p13, p14, p15)
		
		if item_1 and not (if var4.hasItem(p13) then true else t[p13] == nil) then
			cache.resetFailedItem(p13)
			var4.push(p13)
		end
		if not var4.isEmpty() and var5 == nil then
			if var4.isEmpty() then
				return item, item_1
			end
			var5 = task.delay(var3, function()
				-- upvalues: var6 (copy), fFlagDataHydrationAccountReset (copy), var7 (copy), var5 (copy), var4 (copy), var2 (copy), t (copy), cache (copy), requestTimeoutSec (copy), handleFailure (copy), var1 (copy), p1 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				local var16 = if fFlagDataHydrationAccountReset then var7(false) else nil
				var5 = nil
				
				if var4.isEmpty() then return end
				local var17 = var4.pop(var2)
				
				for i, v in var17 do
					t[v] = true
				end
				local items = cache.getItems(var17)
				local delayedThread = task.delay(requestTimeoutSec, function()
					-- upvalues: handleFailure (copy), requestTimeoutSec (copy), var17 (ref), var6 (ref), var16 (ref)
					handleFailure(`No fetch response after {requestTimeoutSec} sec`, var17, var6, var16)
				end)
				local ok, status = pcall(function()
					-- upvalues: var1 (copy), var17 (ref), items (ref), p1 (copy), promiseModule (copy), handleSuccess (copy), var6 (ref), var16 (ref), delayedThread (ref), handleFailure (copy)
					if var1 then
						p1.fetchFn(items):andThen(function(p16)
							-- upvalues: handleSuccess (copy), var17 (copy), var6 (copy), var16 (copy), delayedThread (copy)
							handleSuccess(p16, var17, var6, var16)
							task.cancel(delayedThread)
						end):catch(function(p16)
							-- upvalues: handleFailure (copy), var17 (copy), var6 (copy), var16 (copy), delayedThread (copy)
							handleFailure(p16, var17, var6, var16)
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t = {}
					
					for i, v in var17 do
						table.insert(t, p1.fetchFn(v, items[v]))
					end
					promiseModule.all(t):andThen(function(p16)
						-- upvalues: var17 (copy), handleSuccess (copy), var6 (copy), var16 (copy), delayedThread (copy)
						local t = {}
						
						for i, v in var17 do
							t[v] = p16[i]
						end
						handleSuccess(t, var17, var6, var16)
						task.cancel(delayedThread)
					end):catch(function(p17)
						-- upvalues: handleFailure (copy), var17 (copy), var6 (copy), var16 (copy), delayedThread (copy)
						handleFailure(p17, var17, var6, var16)
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					handleFailure(status, var17, var6, var16)
					task.cancel(delayedThread)
				end
				scheduleFetch()
			end)
		end
		return item, item_1
	end
	
	local function getCachedItem(p16)
		-- upvalues: cache (ref)
		return cache.getItem(p16)
	end
	
	local function getCachedItems(p16)
		-- upvalues: cache (ref)
		return cache.getItems(p16)
	end
	
	local function fetchItem(p16, p17)
		-- upvalues: getAndFetchItem (ref), FORCE_FETCH (ref)
		return getAndFetchItem(p16, p17 or FORCE_FETCH)
	end
	
	local function fetchItems(p16, p17)
		-- upvalues: getAndFetchItems (ref), FORCE_FETCH (ref)
		return getAndFetchItems(p16, p17 or FORCE_FETCH)
	end
	
	local function clear()
		-- upvalues: fFlagDataHydrationAccountReset (copy), var8 (write), var7 (write), var5 (write), t (write), var4 (ref), var11 (write), p1 (ref), cache (ref)
		if fFlagDataHydrationAccountReset then
			var8(var7(false) + 1)
		end
		if var5 then
			task.cancel(var5)
			var5 = nil
		end
		t = {}
		
		if fFlagDataHydrationAccountReset then
			var4.clear()
			
			if var11 then
				var11.clearAll()
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
			
			if var11 then
				var11.clearAll()
			end
			if p1.onClear then
				p1.onClear()
			end
		end
	end
	
	local var18 = nil
	local var19 = nil
	
	if fFlagDataHydrationAccountReset then
		var19 = observeLocalPlayerUserId(function(p16)
			-- upvalues: var6 (write), clear (ref)
			var6 = p16
			clear()
		end)
	else
		var18 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
			-- upvalues: getLocalPlayerUserId (copy), var6 (write), clear (ref)
			local var20 = getLocalPlayerUserId()
			
			if var20 ~= var6 then
				var6 = var20
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
			-- upvalues: var19 (write), var18 (write), fFlagDataHydrationAccountReset (copy), clear (ref), cache (ref)
			if var19 then
				var19()
				var19 = nil
			end
			if var18 then
				var18:Disconnect()
				var18 = nil
			end
			if fFlagDataHydrationAccountReset then
				clear()
			end
			cache.dispose()
		end,
		clear = clear,
		getAccountGeneration = if fFlagDataHydrationAccountReset then var7 else nil,
		isCurrentRequest = if fFlagDataHydrationAccountReset then isCurrentRequest else nil
	}
	
	if var11 then
		function t_1.getOptimisticCachedItem(p16)
			-- upvalues: cache (ref), var11 (write)
			local item, item_1 = cache.getItem(p16)
			
			return var11.getMergedResult(p16, item), item_1
		end
		
		function t_1.getOptimisticCachedItems(p16)
			-- upvalues: cache (ref), var11 (write)
			local items, items_1 = cache.getItems(p16)
			local t = {}
			
			for i, v in items do
				t[i] = var11.getMergedResult(i, v)
			end
			return t, items_1
		end
		
		function t_1.getOptimisticAndFetchItem(p17, p18, p19)
			-- upvalues: getAndFetchItem (ref), var11 (write)
			local var20, var21 = getAndFetchItem(p17, p18, p19)
			
			return var11.getMergedResult(p17, var20), var21
		end
		
		function t_1.getOptimisticAndFetchItems(p17, p18, p19)
			-- upvalues: getAndFetchItems (ref), var11 (write)
			local t = {}
			
			for i, v in getAndFetchItems(p17, p18, p19) do
				t[i] = var11.getMergedResult(i, v)
			end
			return t
		end
		
		function t_1.setMutation(p20, p21)
			-- upvalues: var11 (write)
			var11.set(p20, p21)
		end
		
		function t_1.clearMutation(p20)
			-- upvalues: var11 (write)
			var11.clear(p20)
		end
		
		function t_1.commitMutation(p20)
			-- upvalues: var4 (ref), t (write), var11 (write), cache (ref)
			if if var4.hasItem(p20) then true else t[p20] == nil then
				var11.markCommitted(p20)
				
				return
			end
			local var20 = var11.get(p20)
			
			if var20 ~= nil then
				cache.updateItem(p20, var20)
			end
			var11.clear(p20)
		end
	end
	return t_1
end