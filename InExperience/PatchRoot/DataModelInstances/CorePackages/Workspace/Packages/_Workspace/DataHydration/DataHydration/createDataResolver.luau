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
local fFlagBuildExperienceMonetizationMultiKindModule = require(dataHydration.Flags.FFlagBuildExperienceMonetizationMultiKind)
local luaAppDataHydrationDefaultBatchSize = game:DefineFastInt("LuaAppDataHydrationDefaultBatchSize", 50)
local luaAppDataHydrationQueueProcessDelaySec = game:DefineFastInt("LuaAppDataHydrationQueueProcessDelaySec", 1)
local luaAppDataHydrationDefaultRequestTimeoutSec = game:DefineFastInt("LuaAppDataHydrationDefaultRequestTimeoutSec", 30)

return function(p1)
	-- upvalues: luaAppDataHydrationDefaultBatchSize (ref), luaAppDataHydrationQueueProcessDelaySec (ref), luaAppDataHydrationDefaultRequestTimeoutSec (ref), createRequestQueueModule (ref), getLocalPlayerUserId (ref), fFlagDataHydrationAccountReset (ref), signalsModule (ref), fFlagBuildExperienceMonetizationMultiKindModule (ref), createMutationLayerModule (ref), promiseModule (ref), observeLocalPlayerUserId (ref), playersService (ref)
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
	local var9 = nil
	local var10 = nil
	
	if fFlagDataHydrationAccountReset then
		local var11, var12 = signalsModule.createSignal(0)
		var7 = var11
		var8 = var12
	end
	if fFlagBuildExperienceMonetizationMultiKindModule then
		local var13, var14 = signalsModule.createSignal(0)
		var9 = var13
		var10 = var14
	end
	local var15 = if p1.supportsMutations then createMutationLayerModule() else nil
	
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
		-- upvalues: fFlagDataHydrationAccountReset (copy), var7 (write), getLocalPlayerUserId (copy), var6 (write), p1 (ref), t (write), cache (ref), var15 (write)
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
		
		if var15 then
			var15.drainCommitted(p3, cache.updateItem)
		end
	end
	
	local function handleSuccess(p6, p7, p8, p9)
		-- upvalues: fFlagDataHydrationAccountReset (copy), var7 (write), getLocalPlayerUserId (copy), var6 (write), t (write), p1 (ref), cache (ref), var15 (write), handleFailure (ref)
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
				if var15 and var15.isCommitted(v_1) then
					t[v_1] = nil
				else
					table.insert(t_1, v_1)
				end
			end
		end
		if var15 then
			var15.drainCommitted(p7, cache.updateItem)
		end
		if #t_1 > 0 then
			handleFailure("Items missing in response", t_1, p8, p9)
		end
	end
	
	local function scheduleFetch()
		-- upvalues: var5 (write), var4 (ref), var3 (write), var6 (write), fFlagDataHydrationAccountReset (copy), var7 (write), var2 (write), t (write), cache (ref), requestTimeoutSec (ref), p1 (ref), handleFailure (ref), var1 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref)
		if var5 == nil and not var4.isEmpty() then
			var5 = task.delay(var3, function()
				-- upvalues: var6 (copy), fFlagDataHydrationAccountReset (copy), var7 (copy), var5 (copy), var4 (copy), var2 (copy), t (copy), cache (copy), requestTimeoutSec (copy), p1 (copy), handleFailure (copy), var1 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				local var16 = if fFlagDataHydrationAccountReset then var7(false) else nil
				var5 = nil
				
				if var4.isEmpty() then return end
				local var17 = var4.pop(var2)
				
				for i, v in var17 do
					t[v] = true
				end
				local items = cache.getItems(var17)
				local var18 = false
				local delayedThread = task.delay(requestTimeoutSec, function()
					-- upvalues: p1 (copy), var18 (write), handleFailure (copy), requestTimeoutSec (copy), var17 (ref), var6 (ref), var16 (ref)
					if p1.ignoreResponsesAfterTimeout then
						var18 = true
					end
					handleFailure(`No fetch response after {requestTimeoutSec} sec`, var17, var6, var16)
				end)
				local ok, status = pcall(function()
					-- upvalues: var1 (copy), var17 (ref), items (ref), p1 (copy), promiseModule (copy), var18 (write), handleSuccess (copy), var6 (ref), var16 (ref), delayedThread (ref), handleFailure (copy)
					if var1 then
						p1.fetchFn(items):andThen(function(p10)
							-- upvalues: var18 (copy), handleSuccess (copy), var17 (copy), var6 (copy), var16 (copy), delayedThread (copy)
							if var18 then
								return
							end
							handleSuccess(p10, var17, var6, var16)
							task.cancel(delayedThread)
						end):catch(function(p10)
							-- upvalues: var18 (copy), handleFailure (copy), var17 (copy), var6 (copy), var16 (copy), delayedThread (copy)
							if var18 then
								return
							end
							handleFailure(p10, var17, var6, var16)
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t = {}
					
					for i, v in var17 do
						table.insert(t, p1.fetchFn(v, items[v]))
					end
					promiseModule.all(t):andThen(function(p10)
						-- upvalues: var18 (copy), var17 (copy), handleSuccess (copy), var6 (copy), var16 (copy), delayedThread (copy)
						if var18 then return end
						local t = {}
						
						for i, v in var17 do
							t[v] = p10[i]
						end
						handleSuccess(t, var17, var6, var16)
						task.cancel(delayedThread)
					end):catch(function(p11)
						-- upvalues: var18 (copy), handleFailure (copy), var17 (copy), var6 (copy), var16 (copy), delayedThread (copy)
						if var18 then
							return
						end
						handleFailure(p11, var17, var6, var16)
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					handleFailure(status, var17, var6, var16)
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
		-- upvalues: cache (ref), var4 (ref), t (write), var5 (write), var3 (write), var6 (write), fFlagDataHydrationAccountReset (copy), var7 (write), var2 (write), requestTimeoutSec (ref), p1 (ref), handleFailure (ref), var1 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref)
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
				-- upvalues: var6 (copy), fFlagDataHydrationAccountReset (copy), var7 (copy), var5 (copy), var4 (copy), var2 (copy), t (copy), cache (copy), requestTimeoutSec (copy), p1 (copy), handleFailure (copy), var1 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				local var19 = if fFlagDataHydrationAccountReset then var7(false) else nil
				var5 = nil
				
				if var4.isEmpty() then return end
				local var20 = var4.pop(var2)
				
				for i, v in var20 do
					t[v] = true
				end
				local items = cache.getItems(var20)
				local var21 = false
				local delayedThread = task.delay(requestTimeoutSec, function()
					-- upvalues: p1 (copy), var21 (write), handleFailure (copy), requestTimeoutSec (copy), var20 (ref), var6 (ref), var19 (ref)
					if p1.ignoreResponsesAfterTimeout then
						var21 = true
					end
					handleFailure(`No fetch response after {requestTimeoutSec} sec`, var20, var6, var19)
				end)
				local ok, status = pcall(function()
					-- upvalues: var1 (copy), var20 (ref), items (ref), p1 (copy), promiseModule (copy), var21 (write), handleSuccess (copy), var6 (ref), var19 (ref), delayedThread (ref), handleFailure (copy)
					if var1 then
						p1.fetchFn(items):andThen(function(p13)
							-- upvalues: var21 (copy), handleSuccess (copy), var20 (copy), var6 (copy), var19 (copy), delayedThread (copy)
							if var21 then
								return
							end
							handleSuccess(p13, var20, var6, var19)
							task.cancel(delayedThread)
						end):catch(function(p13)
							-- upvalues: var21 (copy), handleFailure (copy), var20 (copy), var6 (copy), var19 (copy), delayedThread (copy)
							if var21 then
								return
							end
							handleFailure(p13, var20, var6, var19)
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t = {}
					
					for i, v in var20 do
						table.insert(t, p1.fetchFn(v, items[v]))
					end
					promiseModule.all(t):andThen(function(p13)
						-- upvalues: var21 (copy), var20 (copy), handleSuccess (copy), var6 (copy), var19 (copy), delayedThread (copy)
						if var21 then return end
						local t = {}
						
						for i, v in var20 do
							t[v] = p13[i]
						end
						handleSuccess(t, var20, var6, var19)
						task.cancel(delayedThread)
					end):catch(function(p14)
						-- upvalues: var21 (copy), handleFailure (copy), var20 (copy), var6 (copy), var19 (copy), delayedThread (copy)
						if var21 then
							return
						end
						handleFailure(p14, var20, var6, var19)
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					handleFailure(status, var20, var6, var19)
					task.cancel(delayedThread)
				end
				scheduleFetch()
			end)
		end
		return t_1
	end
	
	local function getAndFetchItem(p13, p14, p15)
		-- upvalues: cache (ref), var4 (ref), t (write), var5 (write), var3 (write), var6 (write), fFlagDataHydrationAccountReset (copy), var7 (write), var2 (write), requestTimeoutSec (ref), p1 (ref), handleFailure (ref), var1 (ref), promiseModule (copy), handleSuccess (ref), scheduleFetch (ref)
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
				-- upvalues: var6 (copy), fFlagDataHydrationAccountReset (copy), var7 (copy), var5 (copy), var4 (copy), var2 (copy), t (copy), cache (copy), requestTimeoutSec (copy), p1 (copy), handleFailure (copy), var1 (copy), promiseModule (copy), handleSuccess (copy), scheduleFetch (copy)
				local var22 = if fFlagDataHydrationAccountReset then var7(false) else nil
				var5 = nil
				
				if var4.isEmpty() then return end
				local var23 = var4.pop(var2)
				
				for i, v in var23 do
					t[v] = true
				end
				local items = cache.getItems(var23)
				local var24 = false
				local delayedThread = task.delay(requestTimeoutSec, function()
					-- upvalues: p1 (copy), var24 (write), handleFailure (copy), requestTimeoutSec (copy), var23 (ref), var6 (ref), var22 (ref)
					if p1.ignoreResponsesAfterTimeout then
						var24 = true
					end
					handleFailure(`No fetch response after {requestTimeoutSec} sec`, var23, var6, var22)
				end)
				local ok, status = pcall(function()
					-- upvalues: var1 (copy), var23 (ref), items (ref), p1 (copy), promiseModule (copy), var24 (write), handleSuccess (copy), var6 (ref), var22 (ref), delayedThread (ref), handleFailure (copy)
					if var1 then
						p1.fetchFn(items):andThen(function(p16)
							-- upvalues: var24 (copy), handleSuccess (copy), var23 (copy), var6 (copy), var22 (copy), delayedThread (copy)
							if var24 then
								return
							end
							handleSuccess(p16, var23, var6, var22)
							task.cancel(delayedThread)
						end):catch(function(p16)
							-- upvalues: var24 (copy), handleFailure (copy), var23 (copy), var6 (copy), var22 (copy), delayedThread (copy)
							if var24 then
								return
							end
							handleFailure(p16, var23, var6, var22)
							task.cancel(delayedThread)
						end)
						
						return
					end
					local t = {}
					
					for i, v in var23 do
						table.insert(t, p1.fetchFn(v, items[v]))
					end
					promiseModule.all(t):andThen(function(p16)
						-- upvalues: var24 (copy), var23 (copy), handleSuccess (copy), var6 (copy), var22 (copy), delayedThread (copy)
						if var24 then return end
						local t = {}
						
						for i, v in var23 do
							t[v] = p16[i]
						end
						handleSuccess(t, var23, var6, var22)
						task.cancel(delayedThread)
					end):catch(function(p17)
						-- upvalues: var24 (copy), handleFailure (copy), var23 (copy), var6 (copy), var22 (copy), delayedThread (copy)
						if var24 then
							return
						end
						handleFailure(p17, var23, var6, var22)
						task.cancel(delayedThread)
					end)
				end)
				
				if not ok then
					handleFailure(status, var23, var6, var22)
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
		-- upvalues: fFlagDataHydrationAccountReset (copy), var8 (write), var7 (write), var5 (write), t (write), var4 (ref), var15 (write), p1 (ref), cache (ref)
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
			
			if var15 then
				var15.clearAll()
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
			
			if var15 then
				var15.clearAll()
			end
			if p1.onClear then
				p1.onClear()
			end
		end
	end
	
	local var25 = nil
	local var26 = nil
	
	if fFlagDataHydrationAccountReset then
		var26 = observeLocalPlayerUserId(function(p16)
			-- upvalues: var6 (write), clear (ref), fFlagBuildExperienceMonetizationMultiKindModule (copy), var10 (write), var9 (write)
			var6 = p16
			clear()
			
			if fFlagBuildExperienceMonetizationMultiKindModule then
				var10(var9(false) + 1)
			end
		end)
	else
		var25 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
			-- upvalues: getLocalPlayerUserId (copy), var6 (write), clear (ref), fFlagBuildExperienceMonetizationMultiKindModule (copy), var10 (write), var9 (write)
			local var27 = getLocalPlayerUserId()
			
			if var27 ~= var6 then
				var6 = var27
				clear()
				
				if fFlagBuildExperienceMonetizationMultiKindModule then
					var10(var9(false) + 1)
				end
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
			-- upvalues: var26 (write), var25 (write), fFlagDataHydrationAccountReset (copy), clear (ref), cache (ref)
			if var26 then
				var26()
				var26 = nil
			end
			if var25 then
				var25:Disconnect()
				var25 = nil
			end
			if fFlagDataHydrationAccountReset then
				clear()
			end
			cache.dispose()
		end,
		clear = clear,
		getAccountGeneration = if fFlagDataHydrationAccountReset then var7 else nil,
		getAccountResetGeneration = if fFlagBuildExperienceMonetizationMultiKindModule then var9 else nil,
		isCurrentRequest = if fFlagDataHydrationAccountReset then isCurrentRequest else nil
	}
	
	if var15 then
		function t_1.getOptimisticCachedItem(p16)
			-- upvalues: cache (ref), var15 (write)
			local item, item_1 = cache.getItem(p16)
			
			return var15.getMergedResult(p16, item), item_1
		end
		
		function t_1.getOptimisticCachedItems(p16)
			-- upvalues: cache (ref), var15 (write)
			local items, items_1 = cache.getItems(p16)
			local t = {}
			
			for i, v in items do
				t[i] = var15.getMergedResult(i, v)
			end
			return t, items_1
		end
		
		function t_1.getOptimisticAndFetchItem(p17, p18, p19)
			-- upvalues: getAndFetchItem (ref), var15 (write)
			local var27, var28 = getAndFetchItem(p17, p18, p19)
			
			return var15.getMergedResult(p17, var27), var28
		end
		
		function t_1.getOptimisticAndFetchItems(p17, p18, p19)
			-- upvalues: getAndFetchItems (ref), var15 (write)
			local t = {}
			
			for i, v in getAndFetchItems(p17, p18, p19) do
				t[i] = var15.getMergedResult(i, v)
			end
			return t
		end
		
		function t_1.setMutation(p20, p21)
			-- upvalues: var15 (write)
			var15.set(p20, p21)
		end
		
		function t_1.clearMutation(p20)
			-- upvalues: var15 (write)
			var15.clear(p20)
		end
		
		function t_1.commitMutation(p20)
			-- upvalues: var4 (ref), t (write), var15 (write), cache (ref)
			if if var4.hasItem(p20) then true else t[p20] == nil then
				var15.markCommitted(p20)
				
				return
			end
			local var27 = var15.get(p20)
			
			if var27 ~= nil then
				cache.updateItem(p20, var27)
			end
			var15.clear(p20)
		end
	end
	return t_1
end