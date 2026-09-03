local playersService = game:GetService("Players")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(dataHydration.DataHydrationTypes)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local createRequestQueueModule = require(dataHydration.createRequestQueue)
local createMutationLayerModule = require(dataHydration.createMutationLayer)
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppDataHydrationDataResolverOnClear = sharedFlagsModule.FFlagLuaAppDataHydrationDataResolverOnClear
local fFlagLuaAppDataHydrationOptimisticMutationLayer = sharedFlagsModule.FFlagLuaAppDataHydrationOptimisticMutationLayer
local luaAppDataHydrationDefaultBatchSize = game:DefineFastInt("LuaAppDataHydrationDefaultBatchSize", 50)
local luaAppDataHydrationQueueProcessDelaySec = game:DefineFastInt("LuaAppDataHydrationQueueProcessDelaySec", 1)
local luaAppDataHydrationDefaultRequestTimeoutSec = game:DefineFastInt("LuaAppDataHydrationDefaultRequestTimeoutSec", 30)

return function(p1)
	-- upvalues: luaAppDataHydrationDefaultBatchSize (ref), luaAppDataHydrationQueueProcessDelaySec (ref), luaAppDataHydrationDefaultRequestTimeoutSec (ref), createRequestQueueModule (ref), getLocalPlayerUserId (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (ref), createMutationLayerModule (ref), promiseModule (ref), fFlagLuaAppDataHydrationDataResolverOnClear (ref), playersService (ref)
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
	local var7 = if fFlagLuaAppDataHydrationOptimisticMutationLayer and p1.supportsMutations then createMutationLayerModule() else nil
	
	local function FORCE_FETCH()
		return true
	end
	
	local function _(p2)
		-- upvalues: p1 (ref)
		if p1.logError then
			p1.logError(p2)
		end
	end
	
	local _ = function(p2, p3, p4)
		-- upvalues: var6 (write), p1 (ref), t (write), cache (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (write)
		if p4 ~= var6 then return end
		if p1.logError then
			p1.logError(p2)
		end
		for i, v in p3 do
			t[v] = nil
		end
		cache.markItemsAsFailed(p3)
		
		if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
			var7.drainCommitted(p3, cache.updateItem)
		end
	end
	
	local function handleSuccess(p5, p6, p7)
		-- upvalues: var6 (write), t (write), p1 (ref), cache (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (write)
		if p7 ~= var6 then return end
		for i, v in p5 do
			t[i] = nil
		end
		if p1.replaceItems then
			cache.replaceItems(p5)
		else
			cache.updateItems(p5)
		end
		local t_1 = {}
		
		if fFlagLuaAppDataHydrationOptimisticMutationLayer then
			for v, v_1 in p6 do
				if p5[v_1] == nil then
					if var7 and var7.isCommitted(v_1) then
						t[v_1] = nil
					else
						table.insert(t_1, v_1)
					end
				end
			end
			if var7 then
				var7.drainCommitted(p6, cache.updateItem)
			end
		else
			for v, v_1 in p6 do
				if p5[v_1] == nil then
					table.insert(t_1, v_1)
				end
			end
		end
		if #t_1 > 0 then
			if p7 ~= var6 then return end
			if p1.logError then
				p1.logError("Items missing in response")
			end
			for v, v_1 in t_1 do
				t[v_1] = nil
			end
			cache.markItemsAsFailed(t_1)
			
			if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
				var7.drainCommitted(t_1, cache.updateItem)
			end
		end
	end
	
	local function scheduleFetch()
		-- upvalues: var5 (write), var4 (ref), var3 (write), var6 (write), var2 (write), t (write), cache (ref), requestTimeoutSec (ref), p1 (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (write), var1 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref)
		if var5 == nil and not var4.isEmpty() then
			var5 = task.delay(var3, function()
				-- upvalues: var6 (copy), var5 (copy), var4 (copy), var2 (copy), t (copy), cache (copy), requestTimeoutSec (copy), p1 (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (copy), var1 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				var5 = nil
				
				if var4.isEmpty() then return end
				local var8 = var4.pop(var2)
				
				for i, v in var8 do
					t[v] = true
				end
				local items = cache.getItems(var8)
				local delayedThread = task.delay(requestTimeoutSec, function()
					-- upvalues: requestTimeoutSec (copy), var8 (ref), var6 (ref), var6 (copy), p1 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (copy)
					local var9 = `No fetch response after {requestTimeoutSec} sec`
					
					if var6 ~= var6 then return end
					if p1.logError then
						p1.logError(var9)
					end
					for i, v in var8 do
						t[v] = nil
					end
					cache.markItemsAsFailed(var8)
					
					if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
						var7.drainCommitted(var8, cache.updateItem)
					end
				end)
				local ok, status = pcall(function()
					-- upvalues: var1 (copy), var8 (ref), items (ref), p1 (copy), promiseModule (copy), handleSuccess (copy), var6 (ref), delayedThread (ref), var6 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (copy)
					if var1 then
						p1.fetchFn(items):andThen(function(p8)
							-- upvalues: handleSuccess (copy), var8 (copy), var6 (copy), delayedThread (copy)
							handleSuccess(p8, var8, var6)
							task.cancel(delayedThread)
						end):catch(function(p8)
							-- upvalues: var8 (copy), var6 (copy), var6 (copy), p1 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (copy), delayedThread (copy)
							if var6 == var6 then
								if p1.logError then
									p1.logError(p8)
								end
								for i, v in var8 do
									t[v] = nil
								end
								cache.markItemsAsFailed(var8)
								
								if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
									var7.drainCommitted(var8, cache.updateItem)
								end
							end
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t_1 = {}
					
					for i, v in var8 do
						table.insert(t_1, p1.fetchFn(v, items[v]))
					end
					promiseModule.all(t_1):andThen(function(p8)
						-- upvalues: var8 (copy), handleSuccess (copy), var6 (copy), delayedThread (copy)
						local t = {}
						
						for i, v in var8 do
							t[v] = p8[i]
						end
						handleSuccess(t, var8, var6)
						task.cancel(delayedThread)
					end):catch(function(p9)
						-- upvalues: var8 (copy), var6 (copy), var6 (copy), p1 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (copy), delayedThread (copy)
						if var6 == var6 then
							if p1.logError then
								p1.logError(p9)
							end
							for i, v in var8 do
								t[v] = nil
							end
							cache.markItemsAsFailed(var8)
							
							if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
								var7.drainCommitted(var8, cache.updateItem)
							end
						end
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					if var6 == var6 then
						if p1.logError then
							p1.logError(status)
						end
						for i_1, v_1 in var8 do
							t[v_1] = nil
						end
						cache.markItemsAsFailed(var8)
						
						if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
							var7.drainCommitted(var8, cache.updateItem)
						end
					end
					task.cancel(delayedThread)
				end
				scheduleFetch()
			end)
			
			return
		end
	end
	
	local function isRequestInQueueOrInFlight(p8)
		-- upvalues: var4 (ref), t (write)
		return if var4.hasItem(p8) then true else t[p8] ~= nil
	end
	
	local function getAndFetchItems(p8, p9)
		-- upvalues: cache (ref), var4 (ref), t (write), var5 (write), var3 (write), var6 (write), var2 (write), requestTimeoutSec (ref), p1 (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (write), var1 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref)
		local items, items_1 = cache.getItems(p8, p9)
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
				-- upvalues: var6 (copy), var5 (copy), var4 (copy), var2 (copy), t (copy), cache (copy), requestTimeoutSec (copy), p1 (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (copy), var1 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				var5 = nil
				
				if var4.isEmpty() then return end
				local var10 = var4.pop(var2)
				
				for i, v in var10 do
					t[v] = true
				end
				local items = cache.getItems(var10)
				local delayedThread = task.delay(requestTimeoutSec, function()
					-- upvalues: requestTimeoutSec (copy), var10 (ref), var6 (ref), var6 (copy), p1 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (copy)
					local var11 = `No fetch response after {requestTimeoutSec} sec`
					
					if var6 ~= var6 then return end
					if p1.logError then
						p1.logError(var11)
					end
					for i, v in var10 do
						t[v] = nil
					end
					cache.markItemsAsFailed(var10)
					
					if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
						var7.drainCommitted(var10, cache.updateItem)
					end
				end)
				local ok, status = pcall(function()
					-- upvalues: var1 (copy), var10 (ref), items (ref), p1 (copy), promiseModule (copy), handleSuccess (copy), var6 (ref), delayedThread (ref), var6 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (copy)
					if var1 then
						p1.fetchFn(items):andThen(function(p10)
							-- upvalues: handleSuccess (copy), var10 (copy), var6 (copy), delayedThread (copy)
							handleSuccess(p10, var10, var6)
							task.cancel(delayedThread)
						end):catch(function(p10)
							-- upvalues: var10 (copy), var6 (copy), var6 (copy), p1 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (copy), delayedThread (copy)
							if var6 == var6 then
								if p1.logError then
									p1.logError(p10)
								end
								for i, v in var10 do
									t[v] = nil
								end
								cache.markItemsAsFailed(var10)
								
								if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
									var7.drainCommitted(var10, cache.updateItem)
								end
							end
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t_1 = {}
					
					for i, v in var10 do
						table.insert(t_1, p1.fetchFn(v, items[v]))
					end
					promiseModule.all(t_1):andThen(function(p10)
						-- upvalues: var10 (copy), handleSuccess (copy), var6 (copy), delayedThread (copy)
						local t = {}
						
						for i, v in var10 do
							t[v] = p10[i]
						end
						handleSuccess(t, var10, var6)
						task.cancel(delayedThread)
					end):catch(function(p11)
						-- upvalues: var10 (copy), var6 (copy), var6 (copy), p1 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (copy), delayedThread (copy)
						if var6 == var6 then
							if p1.logError then
								p1.logError(p11)
							end
							for i, v in var10 do
								t[v] = nil
							end
							cache.markItemsAsFailed(var10)
							
							if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
								var7.drainCommitted(var10, cache.updateItem)
							end
						end
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					if var6 == var6 then
						if p1.logError then
							p1.logError(status)
						end
						for i_1, v_1 in var10 do
							t[v_1] = nil
						end
						cache.markItemsAsFailed(var10)
						
						if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
							var7.drainCommitted(var10, cache.updateItem)
						end
					end
					task.cancel(delayedThread)
				end
				scheduleFetch()
			end)
		end
		return t_1
	end
	
	local function getAndFetchItem(p10, p11)
		-- upvalues: cache (ref), var4 (ref), t (write), var5 (write), var3 (write), var6 (write), var2 (write), requestTimeoutSec (ref), p1 (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (write), var1 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref)
		local item, item_1 = cache.getItem(p10, p11)
		
		if item_1 and not (if var4.hasItem(p10) then true else t[p10] == nil) then
			cache.resetFailedItem(p10)
			var4.push(p10)
		end
		if not var4.isEmpty() and var5 == nil then
			if var4.isEmpty() then
				return item, item_1
			end
			var5 = task.delay(var3, function()
				-- upvalues: var6 (copy), var5 (copy), var4 (copy), var2 (copy), t (copy), cache (copy), requestTimeoutSec (copy), p1 (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (copy), var1 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				var5 = nil
				
				if var4.isEmpty() then return end
				local var12 = var4.pop(var2)
				
				for i, v in var12 do
					t[v] = true
				end
				local items = cache.getItems(var12)
				local delayedThread = task.delay(requestTimeoutSec, function()
					-- upvalues: requestTimeoutSec (copy), var12 (ref), var6 (ref), var6 (copy), p1 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (copy)
					local var13 = `No fetch response after {requestTimeoutSec} sec`
					
					if var6 ~= var6 then return end
					if p1.logError then
						p1.logError(var13)
					end
					for i, v in var12 do
						t[v] = nil
					end
					cache.markItemsAsFailed(var12)
					
					if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
						var7.drainCommitted(var12, cache.updateItem)
					end
				end)
				local ok, status = pcall(function()
					-- upvalues: var1 (copy), var12 (ref), items (ref), p1 (copy), promiseModule (copy), handleSuccess (copy), var6 (ref), delayedThread (ref), var6 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (copy)
					if var1 then
						p1.fetchFn(items):andThen(function(p12)
							-- upvalues: handleSuccess (copy), var12 (copy), var6 (copy), delayedThread (copy)
							handleSuccess(p12, var12, var6)
							task.cancel(delayedThread)
						end):catch(function(p12)
							-- upvalues: var12 (copy), var6 (copy), var6 (copy), p1 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (copy), delayedThread (copy)
							if var6 == var6 then
								if p1.logError then
									p1.logError(p12)
								end
								for i, v in var12 do
									t[v] = nil
								end
								cache.markItemsAsFailed(var12)
								
								if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
									var7.drainCommitted(var12, cache.updateItem)
								end
							end
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t_1 = {}
					
					for i, v in var12 do
						table.insert(t_1, p1.fetchFn(v, items[v]))
					end
					promiseModule.all(t_1):andThen(function(p12)
						-- upvalues: var12 (copy), handleSuccess (copy), var6 (copy), delayedThread (copy)
						local t = {}
						
						for i, v in var12 do
							t[v] = p12[i]
						end
						handleSuccess(t, var12, var6)
						task.cancel(delayedThread)
					end):catch(function(p13)
						-- upvalues: var12 (copy), var6 (copy), var6 (copy), p1 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (copy), delayedThread (copy)
						if var6 == var6 then
							if p1.logError then
								p1.logError(p13)
							end
							for i, v in var12 do
								t[v] = nil
							end
							cache.markItemsAsFailed(var12)
							
							if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
								var7.drainCommitted(var12, cache.updateItem)
							end
						end
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					if var6 == var6 then
						if p1.logError then
							p1.logError(status)
						end
						for i_1, v_1 in var12 do
							t[v_1] = nil
						end
						cache.markItemsAsFailed(var12)
						
						if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
							var7.drainCommitted(var12, cache.updateItem)
						end
					end
					task.cancel(delayedThread)
				end
				scheduleFetch()
			end)
		end
		return item, item_1
	end
	
	local function getCachedItem(p12)
		-- upvalues: cache (ref)
		return cache.getItem(p12)
	end
	
	local function getCachedItems(p12)
		-- upvalues: cache (ref)
		return cache.getItems(p12)
	end
	
	local function fetchItem(p12, p13)
		-- upvalues: getAndFetchItem (ref), FORCE_FETCH (ref)
		return getAndFetchItem(p12, p13 or FORCE_FETCH)
	end
	
	local function fetchItems(p12, p13)
		-- upvalues: getAndFetchItems (ref), FORCE_FETCH (ref)
		return getAndFetchItems(p12, p13 or FORCE_FETCH)
	end
	
	local function clear()
		-- upvalues: var5 (write), t (write), cache (ref), var4 (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var7 (write), fFlagLuaAppDataHydrationDataResolverOnClear (copy), p1 (ref)
		if var5 then
			task.cancel(var5)
			var5 = nil
		end
		t = {}
		cache.clear()
		var4.clear()
		
		if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
			var7.clearAll()
		end
		if fFlagLuaAppDataHydrationDataResolverOnClear and p1.onClear then
			p1.onClear()
		end
	end
	
	local var14 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: getLocalPlayerUserId (copy), var6 (write), clear (ref)
		local var15 = getLocalPlayerUserId()
		
		if var15 ~= var6 then
			var6 = var15
			clear()
		end
	end)
	local t_1 = {
		getAndFetchItems = getAndFetchItems,
		getAndFetchItem = getAndFetchItem,
		getCachedItem = getCachedItem,
		getCachedItems = getCachedItems,
		fetchItem = fetchItem,
		fetchItems = fetchItems,
		isRequestInQueueOrInFlight = isRequestInQueueOrInFlight,
		dispose = function()
			-- upvalues: var14 (write), cache (ref)
			if var14 then
				var14:Disconnect()
				var14 = nil
			end
			cache.dispose()
		end,
		clear = clear
	}
	
	if fFlagLuaAppDataHydrationOptimisticMutationLayer and var7 then
		function t_1.getOptimisticCachedItem(p12)
			-- upvalues: cache (ref), var7 (write)
			local item, item_1 = cache.getItem(p12)
			
			return var7.getMergedResult(p12, item), item_1
		end
		
		function t_1.getOptimisticCachedItems(p12)
			-- upvalues: cache (ref), var7 (write)
			local items, items_1 = cache.getItems(p12)
			local t = {}
			
			for i, v in items do
				t[i] = var7.getMergedResult(i, v)
			end
			return t, items_1
		end
		
		function t_1.getOptimisticAndFetchItem(p13, p14)
			-- upvalues: getAndFetchItem (ref), var7 (write)
			local var15, var16 = getAndFetchItem(p13, p14)
			
			return var7.getMergedResult(p13, var15), var16
		end
		
		function t_1.getOptimisticAndFetchItems(p13, p14)
			-- upvalues: getAndFetchItems (ref), var7 (write)
			local t = {}
			
			for i, v in getAndFetchItems(p13, p14) do
				t[i] = var7.getMergedResult(i, v)
			end
			return t
		end
		
		function t_1.setMutation(p15, p16)
			-- upvalues: var7 (write)
			var7.set(p15, p16)
		end
		
		function t_1.clearMutation(p15)
			-- upvalues: var7 (write)
			var7.clear(p15)
		end
		
		function t_1.commitMutation(p15)
			-- upvalues: var4 (ref), t (write), var7 (write), cache (ref)
			if if var4.hasItem(p15) then true else t[p15] == nil then
				var7.markCommitted(p15)
				
				return
			end
			local var15 = var7.get(p15)
			
			if var15 ~= nil then
				cache.updateItem(p15, var15)
			end
			var7.clear(p15)
		end
	end
	return t_1
end