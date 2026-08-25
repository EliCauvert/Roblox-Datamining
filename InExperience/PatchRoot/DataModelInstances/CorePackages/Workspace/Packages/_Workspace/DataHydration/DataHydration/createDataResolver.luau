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
local fFlagSduiChartsSupport = sharedFlagsModule.FFlagSduiChartsSupport
local fFlagLuaAppDataHydrationOptimisticMutationLayer = sharedFlagsModule.FFlagLuaAppDataHydrationOptimisticMutationLayer
local luaAppDataHydrationDefaultBatchSize = game:DefineFastInt("LuaAppDataHydrationDefaultBatchSize", 50)
local luaAppDataHydrationQueueProcessDelaySec = game:DefineFastInt("LuaAppDataHydrationQueueProcessDelaySec", 1)
local luaAppDataHydrationDefaultRequestTimeoutSec = game:DefineFastInt("LuaAppDataHydrationDefaultRequestTimeoutSec", 30)

return function(p0)
	-- upvalues: luaAppDataHydrationDefaultBatchSize (ref), luaAppDataHydrationQueueProcessDelaySec (ref), luaAppDataHydrationDefaultRequestTimeoutSec (ref), createRequestQueueModule (ref), getLocalPlayerUserId (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (ref), createMutationLayerModule (ref), promiseModule (ref), fFlagSduiChartsSupport (ref), fFlagLuaAppDataHydrationDataResolverOnClear (ref), playersService (ref)
	local var9 = p0.supportsMultiGet ~= nil or p0.supportsMultiGet
	local var10 = p0.requestBatchSize or luaAppDataHydrationDefaultBatchSize
	
	if not var9 and not p0.requestBatchSize then
		var10 = 1
	end
	local var11 = p0.queueProcessDelaySec or luaAppDataHydrationQueueProcessDelaySec
	
	if not var9 and not p0.queueProcessDelaySec then
		var11 = 0
	end
	local requestTimeoutSec = p0.requestTimeoutSec or luaAppDataHydrationDefaultRequestTimeoutSec
	local cache = p0.cache
	local var13 = createRequestQueueModule()
	local t = {}
	local var15 = nil
	local var16 = getLocalPlayerUserId()
	local var17 = if fFlagLuaAppDataHydrationOptimisticMutationLayer and p0.supportsMutations then createMutationLayerModule() else nil
	
	local function FORCE_FETCH()
		return true
	end
	
	local function _(p1)
		-- upvalues: p0 (ref)
		if p0.logError then
			p0.logError(p1)
		end
	end
	
	local _ = function(p2, p3, p4)
		-- upvalues: var16 (write), p0 (ref), t (write), cache (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (write)
		if p4 ~= var16 then return end
		if p0.logError then
			p0.logError(p2)
		end
		for i, v in p3 do
			t[v] = nil
		end
		cache.markItemsAsFailed(p3)
		
		if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
			var17.drainCommitted(p3, cache.updateItem)
		end
	end
	
	local function handleSuccess(p5, p6, p7)
		-- upvalues: var16 (write), t (write), p0 (ref), cache (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (write)
		if p7 ~= var16 then return end
		for i, v in p5 do
			t[i] = nil
		end
		if p0.replaceItems then
			cache.replaceItems(p5)
		else
			cache.updateItems(p5)
		end
		local t_1 = {}
		
		if fFlagLuaAppDataHydrationOptimisticMutationLayer then
			for v, v_1 in p6 do
				if p5[v_1] == nil then
					if var17 and var17.isCommitted(v_1) then
						t[v_1] = nil
					else
						table.insert(t_1, v_1)
					end
				end
			end
			if var17 then
				var17.drainCommitted(p6, cache.updateItem)
			end
		else
			for v, v_1 in p6 do
				if p5[v_1] == nil then
					table.insert(t_1, v_1)
				end
			end
		end
		if #t_1 > 0 then
			if p7 ~= var16 then return end
			if p0.logError then
				p0.logError("Items missing in response")
			end
			for v, v_1 in t_1 do
				t[v_1] = nil
			end
			cache.markItemsAsFailed(t_1)
			
			if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
				var17.drainCommitted(t_1, cache.updateItem)
			end
		end
	end
	
	local function scheduleFetch()
		-- upvalues: var15 (write), var13 (ref), var11 (write), var16 (write), var10 (write), t (write), cache (ref), requestTimeoutSec (ref), p0 (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (write), var9 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref)
		if var15 == nil and not var13.isEmpty() then
			var15 = task.delay(var11, function()
				-- upvalues: var16 (copy), var15 (copy), var13 (copy), var10 (copy), t (copy), cache (copy), requestTimeoutSec (copy), p0 (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (copy), var9 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				var15 = nil
				
				if var13.isEmpty() then return end
				local var32 = var13.pop(var10)
				
				for i, v in var32 do
					t[v] = true
				end
				local items = cache.getItems(var32)
				local delayedThread = task.delay(requestTimeoutSec, function()
					-- upvalues: requestTimeoutSec (copy), var32 (ref), var16 (ref), var16 (copy), p0 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (copy)
					local var35 = `No fetch response after {requestTimeoutSec} sec`
					
					if var16 ~= var16 then return end
					if p0.logError then
						p0.logError(var35)
					end
					for i, v in var32 do
						t[v] = nil
					end
					cache.markItemsAsFailed(var32)
					
					if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
						var17.drainCommitted(var32, cache.updateItem)
					end
				end)
				local ok, status = pcall(function()
					-- upvalues: var9 (copy), var32 (ref), items (ref), p0 (copy), promiseModule (copy), handleSuccess (copy), var16 (ref), delayedThread (ref), var16 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (copy)
					if var9 then
						p0.fetchFn(items):andThen(function(p9)
							-- upvalues: handleSuccess (copy), var32 (copy), var16 (copy), delayedThread (copy)
							handleSuccess(p9, var32, var16)
							task.cancel(delayedThread)
						end):catch(function(p8)
							-- upvalues: var32 (copy), var16 (copy), var16 (copy), p0 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (copy), delayedThread (copy)
							if var16 == var16 then
								if p0.logError then
									p0.logError(p8)
								end
								for i, v in var32 do
									t[v] = nil
								end
								cache.markItemsAsFailed(var32)
								
								if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
									var17.drainCommitted(var32, cache.updateItem)
								end
							end
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t_1 = {}
					
					for i, v in var32 do
						table.insert(t_1, p0.fetchFn(v, items[v]))
					end
					promiseModule.all(t_1):andThen(function(p11)
						-- upvalues: var32 (copy), handleSuccess (copy), var16 (copy), delayedThread (copy)
						local t = {}
						
						for i, v in var32 do
							t[v] = p11[i]
						end
						handleSuccess(t, var32, var16)
						task.cancel(delayedThread)
					end):catch(function(p10)
						-- upvalues: var32 (copy), var16 (copy), var16 (copy), p0 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (copy), delayedThread (copy)
						if var16 == var16 then
							if p0.logError then
								p0.logError(p10)
							end
							for i, v in var32 do
								t[v] = nil
							end
							cache.markItemsAsFailed(var32)
							
							if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
								var17.drainCommitted(var32, cache.updateItem)
							end
						end
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					if var16 == var16 then
						if p0.logError then
							p0.logError(status)
						end
						for i_1, v_1 in var32 do
							t[v_1] = nil
						end
						cache.markItemsAsFailed(var32)
						
						if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
							var17.drainCommitted(var32, cache.updateItem)
						end
					end
					task.cancel(delayedThread)
				end
				scheduleFetch()
			end)
			
			return
		end
	end
	
	local function isRequestInQueueOrInFlight(p12)
		-- upvalues: var13 (ref), t (write)
		return if var13.hasItem(p12) then true else t[p12] ~= nil
	end
	
	local function getAndFetchItems(p13, p14)
		-- upvalues: cache (ref), var13 (ref), t (write), var15 (write), var11 (write), var16 (write), var10 (write), requestTimeoutSec (ref), p0 (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (write), var9 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref)
		local items, items_1 = cache.getItems(p13, p14)
		local t_1 = {}
		local t_2 = {}
		
		for i, v in items do
			t_1[i] = v
			
			if items_1[i] and not (if var13.hasItem(i) then true else t[i] == nil) then
				var13.push(i)
				table.insert(t_2, i)
			end
		end
		if #t_2 > 0 then
			cache.resetFailedItems(t_2)
		end
		if not var13.isEmpty() and var15 == nil then
			if var13.isEmpty() then
				return t_1
			end
			var15 = task.delay(var11, function()
				-- upvalues: var16 (copy), var15 (copy), var13 (copy), var10 (copy), t (copy), cache (copy), requestTimeoutSec (copy), p0 (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (copy), var9 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				var15 = nil
				
				if var13.isEmpty() then return end
				local var32 = var13.pop(var10)
				
				for i, v in var32 do
					t[v] = true
				end
				local items = cache.getItems(var32)
				local delayedThread = task.delay(requestTimeoutSec, function()
					-- upvalues: requestTimeoutSec (copy), var32 (ref), var16 (ref), var16 (copy), p0 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (copy)
					local var35 = `No fetch response after {requestTimeoutSec} sec`
					
					if var16 ~= var16 then return end
					if p0.logError then
						p0.logError(var35)
					end
					for i, v in var32 do
						t[v] = nil
					end
					cache.markItemsAsFailed(var32)
					
					if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
						var17.drainCommitted(var32, cache.updateItem)
					end
				end)
				local ok, status = pcall(function()
					-- upvalues: var9 (copy), var32 (ref), items (ref), p0 (copy), promiseModule (copy), handleSuccess (copy), var16 (ref), delayedThread (ref), var16 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (copy)
					if var9 then
						p0.fetchFn(items):andThen(function(p16)
							-- upvalues: handleSuccess (copy), var32 (copy), var16 (copy), delayedThread (copy)
							handleSuccess(p16, var32, var16)
							task.cancel(delayedThread)
						end):catch(function(p15)
							-- upvalues: var32 (copy), var16 (copy), var16 (copy), p0 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (copy), delayedThread (copy)
							if var16 == var16 then
								if p0.logError then
									p0.logError(p15)
								end
								for i, v in var32 do
									t[v] = nil
								end
								cache.markItemsAsFailed(var32)
								
								if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
									var17.drainCommitted(var32, cache.updateItem)
								end
							end
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t_1 = {}
					
					for i, v in var32 do
						table.insert(t_1, p0.fetchFn(v, items[v]))
					end
					promiseModule.all(t_1):andThen(function(p18)
						-- upvalues: var32 (copy), handleSuccess (copy), var16 (copy), delayedThread (copy)
						local t = {}
						
						for i, v in var32 do
							t[v] = p18[i]
						end
						handleSuccess(t, var32, var16)
						task.cancel(delayedThread)
					end):catch(function(p17)
						-- upvalues: var32 (copy), var16 (copy), var16 (copy), p0 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (copy), delayedThread (copy)
						if var16 == var16 then
							if p0.logError then
								p0.logError(p17)
							end
							for i, v in var32 do
								t[v] = nil
							end
							cache.markItemsAsFailed(var32)
							
							if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
								var17.drainCommitted(var32, cache.updateItem)
							end
						end
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					if var16 == var16 then
						if p0.logError then
							p0.logError(status)
						end
						for i_1, v_1 in var32 do
							t[v_1] = nil
						end
						cache.markItemsAsFailed(var32)
						
						if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
							var17.drainCommitted(var32, cache.updateItem)
						end
					end
					task.cancel(delayedThread)
				end
				scheduleFetch()
			end)
		end
		return t_1
	end
	
	local function getAndFetchItem(p19, p20)
		-- upvalues: cache (ref), var13 (ref), t (write), var15 (write), var11 (write), var16 (write), var10 (write), requestTimeoutSec (ref), p0 (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (write), var9 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref), fFlagSduiChartsSupport (copy)
		local item, item_1 = cache.getItem(p19, p20)
		
		if item_1 and not (if var13.hasItem(p19) then true else t[p19] == nil) then
			cache.resetFailedItem(p19)
			var13.push(p19)
		end
		if not var13.isEmpty() and var15 == nil and not var13.isEmpty() then
			var15 = task.delay(var11, function()
				-- upvalues: var16 (copy), var15 (copy), var13 (copy), var10 (copy), t (copy), cache (copy), requestTimeoutSec (copy), p0 (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (copy), var9 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				var15 = nil
				
				if var13.isEmpty() then return end
				local var32 = var13.pop(var10)
				
				for i, v in var32 do
					t[v] = true
				end
				local items = cache.getItems(var32)
				local delayedThread = task.delay(requestTimeoutSec, function()
					-- upvalues: requestTimeoutSec (copy), var32 (ref), var16 (ref), var16 (copy), p0 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (copy)
					local var35 = `No fetch response after {requestTimeoutSec} sec`
					
					if var16 ~= var16 then return end
					if p0.logError then
						p0.logError(var35)
					end
					for i, v in var32 do
						t[v] = nil
					end
					cache.markItemsAsFailed(var32)
					
					if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
						var17.drainCommitted(var32, cache.updateItem)
					end
				end)
				local ok, status = pcall(function()
					-- upvalues: var9 (copy), var32 (ref), items (ref), p0 (copy), promiseModule (copy), handleSuccess (copy), var16 (ref), delayedThread (ref), var16 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (copy)
					if var9 then
						p0.fetchFn(items):andThen(function(p22)
							-- upvalues: handleSuccess (copy), var32 (copy), var16 (copy), delayedThread (copy)
							handleSuccess(p22, var32, var16)
							task.cancel(delayedThread)
						end):catch(function(p21)
							-- upvalues: var32 (copy), var16 (copy), var16 (copy), p0 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (copy), delayedThread (copy)
							if var16 == var16 then
								if p0.logError then
									p0.logError(p21)
								end
								for i, v in var32 do
									t[v] = nil
								end
								cache.markItemsAsFailed(var32)
								
								if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
									var17.drainCommitted(var32, cache.updateItem)
								end
							end
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t_1 = {}
					
					for i, v in var32 do
						table.insert(t_1, p0.fetchFn(v, items[v]))
					end
					promiseModule.all(t_1):andThen(function(p24)
						-- upvalues: var32 (copy), handleSuccess (copy), var16 (copy), delayedThread (copy)
						local t = {}
						
						for i, v in var32 do
							t[v] = p24[i]
						end
						handleSuccess(t, var32, var16)
						task.cancel(delayedThread)
					end):catch(function(p23)
						-- upvalues: var32 (copy), var16 (copy), var16 (copy), p0 (copy), t (copy), cache (copy), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (copy), delayedThread (copy)
						if var16 == var16 then
							if p0.logError then
								p0.logError(p23)
							end
							for i, v in var32 do
								t[v] = nil
							end
							cache.markItemsAsFailed(var32)
							
							if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
								var17.drainCommitted(var32, cache.updateItem)
							end
						end
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					if var16 == var16 then
						if p0.logError then
							p0.logError(status)
						end
						for i_1, v_1 in var32 do
							t[v_1] = nil
						end
						cache.markItemsAsFailed(var32)
						
						if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
							var17.drainCommitted(var32, cache.updateItem)
						end
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
	
	local function getCachedItem(p25)
		-- upvalues: cache (ref)
		return cache.getItem(p25)
	end
	
	local function getCachedItems(p26)
		-- upvalues: cache (ref)
		return cache.getItems(p26)
	end
	
	local function fetchItem(p27, p28)
		-- upvalues: getAndFetchItem (ref), FORCE_FETCH (ref)
		return getAndFetchItem(p27, p28 or FORCE_FETCH)
	end
	
	local function fetchItems(p29, p30)
		-- upvalues: getAndFetchItems (ref), FORCE_FETCH (ref)
		return getAndFetchItems(p29, p30 or FORCE_FETCH)
	end
	
	local function clear()
		-- upvalues: var15 (write), t (write), cache (ref), var13 (ref), fFlagLuaAppDataHydrationOptimisticMutationLayer (copy), var17 (write), fFlagLuaAppDataHydrationDataResolverOnClear (copy), p0 (ref)
		if var15 then
			task.cancel(var15)
			var15 = nil
		end
		t = {}
		cache.clear()
		var13.clear()
		
		if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
			var17.clearAll()
		end
		if fFlagLuaAppDataHydrationDataResolverOnClear and p0.onClear then
			p0.onClear()
		end
	end
	
	local var29 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: getLocalPlayerUserId (copy), var16 (write), clear (ref)
		local var44 = getLocalPlayerUserId()
		
		if var44 ~= var16 then
			var16 = var44
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
			-- upvalues: var29 (write), cache (ref)
			if var29 then
				var29:Disconnect()
				var29 = nil
			end
			cache.dispose()
		end,
		clear = clear
	}
	
	if fFlagLuaAppDataHydrationOptimisticMutationLayer and var17 then
		function t_1.getOptimisticCachedItem(p31)
			-- upvalues: cache (ref), var17 (write)
			local item, item_1 = cache.getItem(p31)
			
			return var17.getMergedResult(p31, item), item_1
		end
		
		function t_1.getOptimisticCachedItems(p32)
			-- upvalues: cache (ref), var17 (write)
			local items, items_1 = cache.getItems(p32)
			local t = {}
			
			for i, v in items do
				t[i] = var17.getMergedResult(i, v)
			end
			return t, items_1
		end
		
		function t_1.getOptimisticAndFetchItem(p33, p34)
			-- upvalues: getAndFetchItem (ref), fFlagSduiChartsSupport (copy), var17 (write)
			local var50, var51 = getAndFetchItem(p33, p34)
			
			if fFlagSduiChartsSupport then
				return var17.getMergedResult(p33, var50), var51
			end
			return var17.getMergedResult(p33, var50), nil
		end
		
		function t_1.getOptimisticAndFetchItems(p35, p36)
			-- upvalues: getAndFetchItems (ref), var17 (write)
			local t = {}
			
			for i, v in getAndFetchItems(p35, p36) do
				t[i] = var17.getMergedResult(i, v)
			end
			return t
		end
		
		function t_1.setMutation(p37, p38)
			-- upvalues: var17 (write)
			var17.set(p37, p38)
		end
		
		function t_1.clearMutation(p39)
			-- upvalues: var17 (write)
			var17.clear(p39)
		end
		
		function t_1.commitMutation(p40)
			-- upvalues: var13 (ref), t (write), var17 (write), cache (ref)
			if if var13.hasItem(p40) then true else t[p40] == nil then
				var17.markCommitted(p40)
				
				return
			end
			local var53 = var17.get(p40)
			
			if var53 ~= nil then
				cache.updateItem(p40, var53)
			end
			var17.clear(p40)
		end
	end
	return t_1
end