local Players = game:GetService("Players")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(DataHydration.DataHydrationTypes)
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local CreateRequestQueueModule = require(DataHydration.createRequestQueue)
local CreateMutationLayerModule = require(DataHydration.createMutationLayer)
local PromiseModule = require(Parent.Promise)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppDataHydrationDataResolverOnClear = SharedFlagsModule.FFlagLuaAppDataHydrationDataResolverOnClear
local FFlagSduiChartsSupport = SharedFlagsModule.FFlagSduiChartsSupport
local FFlagSduiDataCacheResetItem = SharedFlagsModule.FFlagSduiDataCacheResetItem
local FFlagLuaAppDataHydrationOptimisticMutationLayer = SharedFlagsModule.FFlagLuaAppDataHydrationOptimisticMutationLayer
local LuaAppDataHydrationDefaultBatchSize = game:DefineFastInt("LuaAppDataHydrationDefaultBatchSize", 50)
local LuaAppDataHydrationQueueProcessDelaySec = game:DefineFastInt("LuaAppDataHydrationQueueProcessDelaySec", 1)
local LuaAppDataHydrationDefaultRequestTimeoutSec = game:DefineFastInt("LuaAppDataHydrationDefaultRequestTimeoutSec", 30)

return function(p1)
	-- upvalues: LuaAppDataHydrationDefaultBatchSize (copy), LuaAppDataHydrationQueueProcessDelaySec (copy), LuaAppDataHydrationDefaultRequestTimeoutSec (copy), CreateRequestQueueModule (copy), GetLocalPlayerUserIdFunction (copy), FFlagLuaAppDataHydrationOptimisticMutationLayer (copy), CreateMutationLayerModule (copy), PromiseModule (copy), FFlagSduiDataCacheResetItem (copy), FFlagSduiChartsSupport (copy), FFlagLuaAppDataHydrationDataResolverOnClear (copy), Players (copy)
	local NoSupportsMultiGet = p1.supportsMultiGet == nil or p1.supportsMultiGet
	local RequestBatchSize = if p1.requestBatchSize then if NoSupportsMultiGet or p1.requestBatchSize then p1.requestBatchSize else 1 elseif NoSupportsMultiGet or p1.requestBatchSize then LuaAppDataHydrationDefaultBatchSize else 1
	local QueueProcessDelaySec = if p1.queueProcessDelaySec then if NoSupportsMultiGet or p1.queueProcessDelaySec then p1.queueProcessDelaySec else 0 elseif NoSupportsMultiGet or p1.queueProcessDelaySec then LuaAppDataHydrationQueueProcessDelaySec else 0
	local RequestTimeoutSec = p1.requestTimeoutSec or LuaAppDataHydrationDefaultRequestTimeoutSec
	local Cache = p1.cache
	local RequestQueueModule = CreateRequestQueueModule()
	local t = {}
	local DelayedThread = nil
	local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
	local MutationLayerModule = if FFlagLuaAppDataHydrationOptimisticMutationLayer and p1.supportsMutations then CreateMutationLayerModule() else nil
	
	local function FORCE_FETCH(): boolean
		return true
	end
	
	local function _(p2)
		-- upvalues: p1 (copy)
		if p1.logError then
			p1.logError(p2)
		end
	end
	
	local _ = function(p2, List, p3)
		-- upvalues: LocalPlayerUserId (ref), p1 (copy), t (ref), Cache (copy), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (ref)
		if p3 ~= LocalPlayerUserId then return end
		if p1.logError then
			p1.logError(p2)
		end
		for _, value in List do
			t[value] = nil
		end
		Cache.markItemsAsFailed(List)
		
		if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
			MutationLayerModule.drainCommitted(List, Cache.updateItem)
		end
	end
	
	local function handleSuccess(List, PopResult, p4)
		-- upvalues: LocalPlayerUserId (ref), t (ref), p1 (copy), Cache (copy), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (ref)
		if p4 ~= LocalPlayerUserId then return end
		for i, _ in List do
			t[i] = nil
		end
		if p1.replaceItems then
			Cache.replaceItems(List)
		else
			Cache.updateItems(List)
		end
		local List1 = {}
		
		if FFlagLuaAppDataHydrationOptimisticMutationLayer then
			for _, value in PopResult do
				if List[value] == nil then
					if MutationLayerModule and MutationLayerModule.isCommitted(value) then
						t[value] = nil
					else
						table.insert(List1, value)
					end
				end
			end
			if MutationLayerModule then
				MutationLayerModule.drainCommitted(PopResult, Cache.updateItem)
			end
		else
			for _, value1 in PopResult do
				if List[value1] == nil then
					table.insert(List1, value1)
				end
			end
		end
		if #List1 > 0 then
			if p4 ~= LocalPlayerUserId then return end
			if p1.logError then
				p1.logError("Items missing in response")
			end
			for _, value2 in List1 do
				t[value2] = nil
			end
			Cache.markItemsAsFailed(List1)
			
			if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
				MutationLayerModule.drainCommitted(List1, Cache.updateItem)
			end
		end
	end
	
	local function scheduleFetch()
		-- upvalues: DelayedThread (ref), RequestQueueModule (copy), QueueProcessDelaySec (ref), LocalPlayerUserId (ref), RequestBatchSize (ref), t (ref), Cache (copy), RequestTimeoutSec (copy), p1 (copy), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (ref), NoSupportsMultiGet (copy), PromiseModule (upval), handleSuccess (copy), scheduleFetch (copy)
		if DelayedThread == nil and not RequestQueueModule.isEmpty() then
			DelayedThread = task.delay(QueueProcessDelaySec, function()
				-- upvalues: LocalPlayerUserId (upval), DelayedThread (upval), RequestQueueModule (upval), RequestBatchSize (upval), t (upval), Cache (upval), RequestTimeoutSec (upval), p1 (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (upval), NoSupportsMultiGet (upval), PromiseModule (upval), handleSuccess (upval), scheduleFetch (upval)
				local v1 = LocalPlayerUserId
				DelayedThread = nil
				
				if RequestQueueModule.isEmpty() then return end
				local PopResult = RequestQueueModule.pop(RequestBatchSize)
				
				for _, value in PopResult do
					t[value] = true
				end
				local Items = Cache.getItems(PopResult)
				local DelayedThread = task.delay(RequestTimeoutSec, function()
					-- upvalues: RequestTimeoutSec (upval), PopResult (copy), v1 (copy), LocalPlayerUserId (upval), p1 (upval), t (upval), Cache (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (upval)
					local Message: string = `No fetch response after {RequestTimeoutSec} sec`
					
					if v1 ~= LocalPlayerUserId then return end
					if p1.logError then
						p1.logError(Message)
					end
					for _, value in PopResult do
						t[value] = nil
					end
					Cache.markItemsAsFailed(PopResult)
					
					if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
						MutationLayerModule.drainCommitted(PopResult, Cache.updateItem)
					end
				end)
				local Success, Result = pcall(function()
					-- upvalues: NoSupportsMultiGet (upval), PopResult (copy), Items (copy), p1 (upval), PromiseModule (upval), handleSuccess (upval), v1 (copy), DelayedThread (copy), LocalPlayerUserId (upval), t (upval), Cache (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (upval)
					if NoSupportsMultiGet then
						p1.fetchFn(Items):andThen(function(Result)
							-- upvalues: handleSuccess (upval), PopResult (upval), v1 (upval), DelayedThread (upval)
							handleSuccess(Result, PopResult, v1)
							task.cancel(DelayedThread)
						end):catch(function(Err)
							-- upvalues: PopResult (upval), v1 (upval), LocalPlayerUserId (upval), p1 (upval), t (upval), Cache (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (upval), DelayedThread (upval)
							if v1 == LocalPlayerUserId then
								if p1.logError then
									p1.logError(Err)
								end
								for _, value in PopResult do
									t[value] = nil
								end
								Cache.markItemsAsFailed(PopResult)
								
								if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
									MutationLayerModule.drainCommitted(PopResult, Cache.updateItem)
								end
							end
							task.cancel(DelayedThread)
						end)
						
						return
					end
					local Fns = {}
					
					for _, value in PopResult do
						table.insert(Fns, p1.fetchFn(value, Items[value]))
					end
					PromiseModule.all(Fns):andThen(function(Result)
						-- upvalues: PopResult (upval), handleSuccess (upval), v1 (upval), DelayedThread (upval)
						local t = {}
						
						for i, value in PopResult do
							t[value] = Result[i]
						end
						handleSuccess(t, PopResult, v1)
						task.cancel(DelayedThread)
					end):catch(function(Err)
						-- upvalues: PopResult (upval), v1 (upval), LocalPlayerUserId (upval), p1 (upval), t (upval), Cache (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (upval), DelayedThread (upval)
						if v1 == LocalPlayerUserId then
							if p1.logError then
								p1.logError(Err)
							end
							for _, value in PopResult do
								t[value] = nil
							end
							Cache.markItemsAsFailed(PopResult)
							
							if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
								MutationLayerModule.drainCommitted(PopResult, Cache.updateItem)
							end
						end
						task.cancel(DelayedThread)
					end)
				end)
				
				if not Success then
					if v1 == LocalPlayerUserId then
						if p1.logError then
							p1.logError(Result)
						end
						for _, value1 in PopResult do
							t[value1] = nil
						end
						Cache.markItemsAsFailed(PopResult)
						
						if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
							MutationLayerModule.drainCommitted(PopResult, Cache.updateItem)
						end
					end
					task.cancel(DelayedThread)
				end
				scheduleFetch()
			end)
			
			return
		end
	end
	
	local function getAndFetchItems(p5, p6)
		-- upvalues: Cache (copy), FFlagSduiDataCacheResetItem (upval), RequestQueueModule (copy), t (ref), DelayedThread (ref), QueueProcessDelaySec (ref), LocalPlayerUserId (ref), RequestBatchSize (ref), RequestTimeoutSec (copy), p1 (copy), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (ref), NoSupportsMultiGet (copy), PromiseModule (upval), handleSuccess (copy), scheduleFetch (copy)
		local Items, Items2 = Cache.getItems(p5, p6)
		local t1 = {}
		local T = if FFlagSduiDataCacheResetItem then {} else nil
		for i, item in Items do
			t1[i] = item
			
			if Items2[i] and not (if RequestQueueModule.hasItem(i) then true else t[i] ~= nil) then
				RequestQueueModule.push(i)
				
				if FFlagSduiDataCacheResetItem then
					table.insert(T, i)
				end
			end
		end
		if FFlagSduiDataCacheResetItem and #T > 0 then
			Cache.resetFailedItems(T)
		end
		if not RequestQueueModule.isEmpty() and DelayedThread == nil then
			if RequestQueueModule.isEmpty() then
				return t1
			end
			DelayedThread = task.delay(QueueProcessDelaySec, function()
				-- upvalues: LocalPlayerUserId (upval), DelayedThread (upval), RequestQueueModule (upval), RequestBatchSize (upval), t (upval), Cache (upval), RequestTimeoutSec (upval), p1 (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (upval), NoSupportsMultiGet (upval), PromiseModule (upval), handleSuccess (upval), scheduleFetch (upval)
				local v2 = LocalPlayerUserId
				DelayedThread = nil
				
				if RequestQueueModule.isEmpty() then return end
				local PopResult = RequestQueueModule.pop(RequestBatchSize)
				
				for _, value in PopResult do
					t[value] = true
				end
				local Items = Cache.getItems(PopResult)
				local DelayedThread = task.delay(RequestTimeoutSec, function()
					-- upvalues: RequestTimeoutSec (upval), PopResult (copy), v2 (copy), LocalPlayerUserId (upval), p1 (upval), t (upval), Cache (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (upval)
					local Message: string = `No fetch response after {RequestTimeoutSec} sec`
					
					if v2 ~= LocalPlayerUserId then return end
					if p1.logError then
						p1.logError(Message)
					end
					for _, value in PopResult do
						t[value] = nil
					end
					Cache.markItemsAsFailed(PopResult)
					
					if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
						MutationLayerModule.drainCommitted(PopResult, Cache.updateItem)
					end
				end)
				local Success, Result = pcall(function()
					-- upvalues: NoSupportsMultiGet (upval), PopResult (copy), Items (copy), p1 (upval), PromiseModule (upval), handleSuccess (upval), v2 (copy), DelayedThread (copy), LocalPlayerUserId (upval), t (upval), Cache (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (upval)
					if NoSupportsMultiGet then
						p1.fetchFn(Items):andThen(function(Result)
							-- upvalues: handleSuccess (upval), PopResult (upval), v2 (upval), DelayedThread (upval)
							handleSuccess(Result, PopResult, v2)
							task.cancel(DelayedThread)
						end):catch(function(Err)
							-- upvalues: PopResult (upval), v2 (upval), LocalPlayerUserId (upval), p1 (upval), t (upval), Cache (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (upval), DelayedThread (upval)
							if v2 == LocalPlayerUserId then
								if p1.logError then
									p1.logError(Err)
								end
								for _, value in PopResult do
									t[value] = nil
								end
								Cache.markItemsAsFailed(PopResult)
								
								if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
									MutationLayerModule.drainCommitted(PopResult, Cache.updateItem)
								end
							end
							task.cancel(DelayedThread)
						end)
						
						return
					end
					local Fns = {}
					
					for _, value in PopResult do
						table.insert(Fns, p1.fetchFn(value, Items[value]))
					end
					PromiseModule.all(Fns):andThen(function(Result)
						-- upvalues: PopResult (upval), handleSuccess (upval), v2 (upval), DelayedThread (upval)
						local t = {}
						
						for i, value in PopResult do
							t[value] = Result[i]
						end
						handleSuccess(t, PopResult, v2)
						task.cancel(DelayedThread)
					end):catch(function(Err)
						-- upvalues: PopResult (upval), v2 (upval), LocalPlayerUserId (upval), p1 (upval), t (upval), Cache (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (upval), DelayedThread (upval)
						if v2 == LocalPlayerUserId then
							if p1.logError then
								p1.logError(Err)
							end
							for _, value in PopResult do
								t[value] = nil
							end
							Cache.markItemsAsFailed(PopResult)
							
							if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
								MutationLayerModule.drainCommitted(PopResult, Cache.updateItem)
							end
						end
						task.cancel(DelayedThread)
					end)
				end)
				
				if not Success then
					if v2 == LocalPlayerUserId then
						if p1.logError then
							p1.logError(Result)
						end
						for _, value1 in PopResult do
							t[value1] = nil
						end
						Cache.markItemsAsFailed(PopResult)
						
						if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
							MutationLayerModule.drainCommitted(PopResult, Cache.updateItem)
						end
					end
					task.cancel(DelayedThread)
				end
				scheduleFetch()
			end)
		end
		return t1
	end
	
	local function getAndFetchItem(p7, p8)
		-- upvalues: Cache (copy), RequestQueueModule (copy), t (ref), FFlagSduiDataCacheResetItem (upval), DelayedThread (ref), QueueProcessDelaySec (ref), LocalPlayerUserId (ref), RequestBatchSize (ref), RequestTimeoutSec (copy), p1 (copy), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (ref), NoSupportsMultiGet (copy), PromiseModule (upval), handleSuccess (copy), scheduleFetch (copy), FFlagSduiChartsSupport (upval)
		local Item, Item2 = Cache.getItem(p7, p8)
		
		if Item2 and not (if RequestQueueModule.hasItem(p7) then true else t[p7] ~= nil) then
			if FFlagSduiDataCacheResetItem then
				Cache.resetFailedItem(p7)
			end
			RequestQueueModule.push(p7)
		end
		if not RequestQueueModule.isEmpty() and DelayedThread == nil and not RequestQueueModule.isEmpty() then
			DelayedThread = task.delay(QueueProcessDelaySec, function()
				-- upvalues: LocalPlayerUserId (upval), DelayedThread (upval), RequestQueueModule (upval), RequestBatchSize (upval), t (upval), Cache (upval), RequestTimeoutSec (upval), p1 (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (upval), NoSupportsMultiGet (upval), PromiseModule (upval), handleSuccess (upval), scheduleFetch (upval)
				local v3 = LocalPlayerUserId
				DelayedThread = nil
				
				if RequestQueueModule.isEmpty() then return end
				local PopResult = RequestQueueModule.pop(RequestBatchSize)
				
				for _, value in PopResult do
					t[value] = true
				end
				local Items = Cache.getItems(PopResult)
				local DelayedThread = task.delay(RequestTimeoutSec, function()
					-- upvalues: RequestTimeoutSec (upval), PopResult (copy), v3 (copy), LocalPlayerUserId (upval), p1 (upval), t (upval), Cache (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (upval)
					local Message: string = `No fetch response after {RequestTimeoutSec} sec`
					
					if v3 ~= LocalPlayerUserId then return end
					if p1.logError then
						p1.logError(Message)
					end
					for _, value in PopResult do
						t[value] = nil
					end
					Cache.markItemsAsFailed(PopResult)
					
					if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
						MutationLayerModule.drainCommitted(PopResult, Cache.updateItem)
					end
				end)
				local Success, Result = pcall(function()
					-- upvalues: NoSupportsMultiGet (upval), PopResult (copy), Items (copy), p1 (upval), PromiseModule (upval), handleSuccess (upval), v3 (copy), DelayedThread (copy), LocalPlayerUserId (upval), t (upval), Cache (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (upval)
					if NoSupportsMultiGet then
						p1.fetchFn(Items):andThen(function(Result)
							-- upvalues: handleSuccess (upval), PopResult (upval), v3 (upval), DelayedThread (upval)
							handleSuccess(Result, PopResult, v3)
							task.cancel(DelayedThread)
						end):catch(function(Err)
							-- upvalues: PopResult (upval), v3 (upval), LocalPlayerUserId (upval), p1 (upval), t (upval), Cache (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (upval), DelayedThread (upval)
							if v3 == LocalPlayerUserId then
								if p1.logError then
									p1.logError(Err)
								end
								for _, value in PopResult do
									t[value] = nil
								end
								Cache.markItemsAsFailed(PopResult)
								
								if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
									MutationLayerModule.drainCommitted(PopResult, Cache.updateItem)
								end
							end
							task.cancel(DelayedThread)
						end)
						
						return
					end
					local Fns = {}
					
					for _, value in PopResult do
						table.insert(Fns, p1.fetchFn(value, Items[value]))
					end
					PromiseModule.all(Fns):andThen(function(Result)
						-- upvalues: PopResult (upval), handleSuccess (upval), v3 (upval), DelayedThread (upval)
						local t = {}
						
						for i, value in PopResult do
							t[value] = Result[i]
						end
						handleSuccess(t, PopResult, v3)
						task.cancel(DelayedThread)
					end):catch(function(Err)
						-- upvalues: PopResult (upval), v3 (upval), LocalPlayerUserId (upval), p1 (upval), t (upval), Cache (upval), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (upval), DelayedThread (upval)
						if v3 == LocalPlayerUserId then
							if p1.logError then
								p1.logError(Err)
							end
							for _, value in PopResult do
								t[value] = nil
							end
							Cache.markItemsAsFailed(PopResult)
							
							if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
								MutationLayerModule.drainCommitted(PopResult, Cache.updateItem)
							end
						end
						task.cancel(DelayedThread)
					end)
				end)
				
				if not Success then
					if v3 == LocalPlayerUserId then
						if p1.logError then
							p1.logError(Result)
						end
						for _, value1 in PopResult do
							t[value1] = nil
						end
						Cache.markItemsAsFailed(PopResult)
						
						if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
							MutationLayerModule.drainCommitted(PopResult, Cache.updateItem)
						end
					end
					task.cancel(DelayedThread)
				end
				scheduleFetch()
			end)
		end
		if FFlagSduiChartsSupport then
			return Item, Item2
		else
			return Item, nil
		end
	end
	
	local function clear()
		-- upvalues: DelayedThread (ref), t (ref), Cache (copy), RequestQueueModule (copy), FFlagLuaAppDataHydrationOptimisticMutationLayer (upval), MutationLayerModule (ref), FFlagLuaAppDataHydrationDataResolverOnClear (upval), p1 (copy)
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		t = {}
		Cache.clear()
		RequestQueueModule.clear()
		
		if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
			MutationLayerModule.clearAll()
		end
		if FFlagLuaAppDataHydrationDataResolverOnClear and p1.onClear then
			p1.onClear()
		end
	end
	
	local Connection = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: GetLocalPlayerUserIdFunction (upval), LocalPlayerUserId (ref), clear (copy)
		local LocalPlayerUserId1 = GetLocalPlayerUserIdFunction()
		
		if LocalPlayerUserId1 ~= LocalPlayerUserId then
			LocalPlayerUserId = LocalPlayerUserId1
			clear()
		end
	end)
	local config = {
		getAndFetchItems = getAndFetchItems,
		getAndFetchItem = getAndFetchItem,
		getCachedItem = function(p9)
			-- upvalues: Cache (copy)
			return Cache.getItem(p9)
		end,
		getCachedItems = function(p9)
			-- upvalues: Cache (copy)
			return Cache.getItems(p9)
		end,
		fetchItem = function(p9, p10)
			-- upvalues: getAndFetchItem (copy), FORCE_FETCH (copy)
			return getAndFetchItem(p9, p10 or FORCE_FETCH)
		end,
		fetchItems = function(p9, p10)
			-- upvalues: getAndFetchItems (copy), FORCE_FETCH (copy)
			return (getAndFetchItems(p9, p10 or FORCE_FETCH))
		end,
		isRequestInQueueOrInFlight = function(p9): boolean
			-- upvalues: RequestQueueModule (copy), t (ref)
			return if RequestQueueModule.hasItem(p9) then true else t[p9] ~= nil
		end,
		dispose = function()
			-- upvalues: Connection (ref), Cache (copy)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
			Cache.dispose()
		end,
		clear = clear
	}
	
	if FFlagLuaAppDataHydrationOptimisticMutationLayer and MutationLayerModule then
		function config.getOptimisticCachedItem(p9)
			-- upvalues: Cache (copy), MutationLayerModule (ref)
			local Item, Item2 = Cache.getItem(p9)
			
			return MutationLayerModule.getMergedResult(p9, Item), Item2
		end
		
		function config.getOptimisticCachedItems(p9)
			-- upvalues: Cache (copy), MutationLayerModule (ref)
			local Items, Items2 = Cache.getItems(p9)
			local MergedResults = {}
			
			for i, item in Items do
				MergedResults[i] = MutationLayerModule.getMergedResult(i, item)
			end
			return MergedResults, Items2
		end
		
		function config.getOptimisticAndFetchItem(p10, p11)
			-- upvalues: getAndFetchItem (copy), FFlagSduiChartsSupport (upval), MutationLayerModule (ref)
			local AndFetchItem, AndFetchItem2 = getAndFetchItem(p10, p11)
			
			if FFlagSduiChartsSupport then
				return MutationLayerModule.getMergedResult(p10, AndFetchItem), AndFetchItem2
			else
				return MutationLayerModule.getMergedResult(p10, AndFetchItem), nil
			end
		end
		
		function config.getOptimisticAndFetchItems(p10, p11)
			-- upvalues: getAndFetchItems (copy), MutationLayerModule (ref)
			local MergedResults = {}
			
			for i, value in getAndFetchItems(p10, p11) do
				MergedResults[i] = MutationLayerModule.getMergedResult(i, value)
			end
			return MergedResults
		end
		
		function config.setMutation(p12, p13)
			-- upvalues: MutationLayerModule (ref)
			MutationLayerModule.set(p12, p13)
		end
		
		function config.clearMutation(p12)
			-- upvalues: MutationLayerModule (ref)
			MutationLayerModule.clear(p12)
		end
		
		function config.commitMutation(p12)
			-- upvalues: RequestQueueModule (copy), t (ref), MutationLayerModule (ref), Cache (copy)
			if if RequestQueueModule.hasItem(p12) then true else t[p12] ~= nil then
				MutationLayerModule.markCommitted(p12)
				
				return
			end
			local GetResult = MutationLayerModule.get(p12)
			
			if GetResult ~= nil then
				Cache.updateItem(p12, GetResult)
			end
			MutationLayerModule.clear(p12)
		end
	end
	return config
end