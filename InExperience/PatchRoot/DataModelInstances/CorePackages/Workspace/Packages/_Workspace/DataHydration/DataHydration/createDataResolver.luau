local Players = game:GetService("Players")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(DataHydration.DataHydrationTypes)
local DataHydrationUtilsModule = require(DataHydration.DataHydrationUtils)
local GetLocalPlayerUserIdFunction = DataHydrationUtilsModule.getLocalPlayerUserId
local ObserveLocalPlayerUserIdFunction = DataHydrationUtilsModule.observeLocalPlayerUserId
local CreateRequestQueueModule = require(DataHydration.createRequestQueue)
local CreateMutationLayerModule = require(DataHydration.createMutationLayer)
local PromiseModule = require(Parent.Promise)
local SignalsModule = require(Parent.Signals)
local FFlagDataHydrationAccountReset = require(Parent.SharedFlags).FFlagDataHydrationAccountReset
local FFlagBuildExperienceMonetizationMultiKindModule = require(DataHydration.Flags.FFlagBuildExperienceMonetizationMultiKind)
local LuaAppDataHydrationDefaultBatchSize = game:DefineFastInt("LuaAppDataHydrationDefaultBatchSize", 50)
local LuaAppDataHydrationQueueProcessDelaySec = game:DefineFastInt("LuaAppDataHydrationQueueProcessDelaySec", 1)
local LuaAppDataHydrationDefaultRequestTimeoutSec = game:DefineFastInt("LuaAppDataHydrationDefaultRequestTimeoutSec", 30)

return function(p1)
	-- upvalues: LuaAppDataHydrationDefaultBatchSize (copy), LuaAppDataHydrationQueueProcessDelaySec (copy), LuaAppDataHydrationDefaultRequestTimeoutSec (copy), CreateRequestQueueModule (copy), GetLocalPlayerUserIdFunction (copy), FFlagDataHydrationAccountReset (copy), SignalsModule (copy), FFlagBuildExperienceMonetizationMultiKindModule (copy), CreateMutationLayerModule (copy), PromiseModule (copy), ObserveLocalPlayerUserIdFunction (copy), Players (copy)
	local NoSupportsMultiGet = p1.supportsMultiGet == nil or p1.supportsMultiGet
	local RequestBatchSize = if p1.requestBatchSize then if NoSupportsMultiGet or p1.requestBatchSize then p1.requestBatchSize else 1 elseif NoSupportsMultiGet or p1.requestBatchSize then LuaAppDataHydrationDefaultBatchSize else 1
	local QueueProcessDelaySec = if p1.queueProcessDelaySec then if NoSupportsMultiGet or p1.queueProcessDelaySec then p1.queueProcessDelaySec else 0 elseif NoSupportsMultiGet or p1.queueProcessDelaySec then LuaAppDataHydrationQueueProcessDelaySec else 0
	local RequestTimeoutSec = p1.requestTimeoutSec or LuaAppDataHydrationDefaultRequestTimeoutSec
	local Cache = p1.cache
	local RequestQueueModule = CreateRequestQueueModule()
	local t = {}
	local t1 = {}
	local DelayedThread = nil
	local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
	local Callback = nil
	local Callback1 = nil
	local Callback3 = nil
	local Callback2 = nil
	
	if FFlagDataHydrationAccountReset then
		Callback, Callback1 = SignalsModule.createSignal(0)
	end
	if FFlagBuildExperienceMonetizationMultiKindModule then
		Callback3, Callback2 = SignalsModule.createSignal(0)
	end
	local MutationLayerModule = if p1.supportsMutations then CreateMutationLayerModule() else nil
	
	local function FORCE_FETCH(): boolean
		return true
	end
	
	local function _(p2)
		-- upvalues: p1 (copy)
		if p1.logError then
			p1.logError(p2)
		end
	end
	
	local function isCurrentRequest(p2, p3): boolean
		-- upvalues: Callback (ref), GetLocalPlayerUserIdFunction (upval)
		return p3 == Callback(false) and p2 == GetLocalPlayerUserIdFunction()
	end
	
	local _ = function(List)
		-- upvalues: t1 (copy)
		local t = {}
		
		for _, value in List do
			t[value] = t1[value] or 0
		end
		return t
	end
	
	local function filterCurrentIds(List, p2)
		-- upvalues: t1 (copy)
		local List1 = {}
		
		for _, value in List do
			if p2[value] == (t1[value] or 0) then
				table.insert(List1, value)
			end
		end
		return List1
	end
	
	local function handleFailure(Message, PopResult, p3, p4, p5)
		-- upvalues: FFlagDataHydrationAccountReset (upval), Callback (ref), GetLocalPlayerUserIdFunction (upval), LocalPlayerUserId (ref), filterCurrentIds (copy), p1 (copy), t (ref), Cache (copy), MutationLayerModule (ref)
		if FFlagDataHydrationAccountReset then
			if p4 ~= Callback(false) or p3 ~= GetLocalPlayerUserIdFunction() then return end
		elseif p3 ~= LocalPlayerUserId then return end
		local FilterCurrentIdsResult = filterCurrentIds(PopResult, p5)
		
		if #FilterCurrentIdsResult == 0 then return end
		if p1.logError then
			p1.logError(Message)
		end
		for _, value in FilterCurrentIdsResult do
			t[value] = nil
		end
		Cache.markItemsAsFailed(FilterCurrentIdsResult)
		
		if MutationLayerModule then
			MutationLayerModule.drainCommitted(FilterCurrentIdsResult, Cache.updateItem)
		end
	end
	
	local function handleSuccess(List, PopResult, p6, p7, p8)
		-- upvalues: FFlagDataHydrationAccountReset (upval), Callback (ref), GetLocalPlayerUserIdFunction (upval), LocalPlayerUserId (ref), filterCurrentIds (copy), t1 (copy), t (ref), p1 (copy), Cache (copy), MutationLayerModule (ref), handleFailure (copy)
		if FFlagDataHydrationAccountReset then
			if p7 ~= Callback(false) or p6 ~= GetLocalPlayerUserIdFunction() then return end
		elseif p6 ~= LocalPlayerUserId then return end
		local FilterCurrentIdsResult = filterCurrentIds(PopResult, p8)
		local t2 = {}
		
		for i, value in List do
			if p8[i] == nil or p8[i] == (t1[i] or 0) then
				t2[i] = value
			end
		end
		for i1, _ in t2 do
			t[i1] = nil
		end
		if p1.replaceItems then
			Cache.replaceItems(t2)
		else
			Cache.updateItems(t2)
		end
		local List1 = {}
		
		for _, value1 in FilterCurrentIdsResult do
			if t2[value1] == nil then
				if MutationLayerModule and MutationLayerModule.isCommitted(value1) then
					t[value1] = nil
				else
					table.insert(List1, value1)
				end
			end
		end
		if MutationLayerModule then
			MutationLayerModule.drainCommitted(FilterCurrentIdsResult, Cache.updateItem)
		end
		if #List1 > 0 then
			handleFailure("Items missing in response", List1, p6, p7, p8)
		end
	end
	
	local function scheduleFetch()
		-- upvalues: DelayedThread (ref), RequestQueueModule (copy), QueueProcessDelaySec (ref), LocalPlayerUserId (ref), FFlagDataHydrationAccountReset (upval), Callback (ref), RequestBatchSize (ref), t (ref), t1 (copy), Cache (copy), RequestTimeoutSec (copy), p1 (copy), handleFailure (copy), NoSupportsMultiGet (copy), PromiseModule (upval), handleSuccess (copy), scheduleFetch (copy)
		if DelayedThread == nil and not RequestQueueModule.isEmpty() then
			DelayedThread = task.delay(QueueProcessDelaySec, function()
				-- upvalues: LocalPlayerUserId (upval), FFlagDataHydrationAccountReset (upval), Callback (upval), DelayedThread (upval), RequestQueueModule (upval), RequestBatchSize (upval), t (upval), t1 (upval), Cache (upval), RequestTimeoutSec (upval), p1 (upval), handleFailure (upval), NoSupportsMultiGet (upval), PromiseModule (upval), handleSuccess (upval), scheduleFetch (upval)
				local v1 = LocalPlayerUserId
				local v2 = if FFlagDataHydrationAccountReset then Callback(false) else nil
				DelayedThread = nil
				
				if RequestQueueModule.isEmpty() then return end
				local PopResult = RequestQueueModule.pop(RequestBatchSize)
				
				for _, value in PopResult do
					t[value] = true
				end
				local t = {}
				
				for _, value1 in PopResult do
					t[value1] = t1[value1] or 0
				end
				local Items = Cache.getItems(PopResult)
				local Flag = false
				local DelayedThread = task.delay(RequestTimeoutSec, function()
					-- upvalues: p1 (upval), Flag (ref), handleFailure (upval), RequestTimeoutSec (upval), PopResult (copy), v1 (copy), v2 (copy), t (copy)
					if p1.ignoreResponsesAfterTimeout then
						Flag = true
					end
					handleFailure(`No fetch response after {RequestTimeoutSec} sec`, PopResult, v1, v2, t)
				end)
				local Success, Result = pcall(function()
					-- upvalues: NoSupportsMultiGet (upval), PopResult (copy), Items (copy), p1 (upval), PromiseModule (upval), Flag (ref), handleSuccess (upval), v1 (copy), v2 (copy), t (copy), DelayedThread (copy), handleFailure (upval)
					if NoSupportsMultiGet then
						p1.fetchFn(Items):andThen(function(Result)
							-- upvalues: Flag (upval), handleSuccess (upval), PopResult (upval), v1 (upval), v2 (upval), t (upval), DelayedThread (upval)
							if not Flag then
								handleSuccess(Result, PopResult, v1, v2, t)
								task.cancel(DelayedThread)
								
								return
							end
						end):catch(function(Err)
							-- upvalues: Flag (upval), handleFailure (upval), PopResult (upval), v1 (upval), v2 (upval), t (upval), DelayedThread (upval)
							if not Flag then
								handleFailure(Err, PopResult, v1, v2, t)
								task.cancel(DelayedThread)
								
								return
							end
						end)
						
						return
					end
					local Fns = {}
					
					for _, value in PopResult do
						table.insert(Fns, p1.fetchFn(value, Items[value]))
					end
					PromiseModule.all(Fns):andThen(function(Result)
						-- upvalues: Flag (upval), PopResult (upval), handleSuccess (upval), v1 (upval), v2 (upval), t (upval), DelayedThread (upval)
						if Flag then return end
						local t3 = {}
						
						for i, value in PopResult do
							t3[value] = Result[i]
						end
						handleSuccess(t3, PopResult, v1, v2, t)
						task.cancel(DelayedThread)
					end):catch(function(Err)
						-- upvalues: Flag (upval), handleFailure (upval), PopResult (upval), v1 (upval), v2 (upval), t (upval), DelayedThread (upval)
						if not Flag then
							handleFailure(Err, PopResult, v1, v2, t)
							task.cancel(DelayedThread)
							
							return
						end
					end)
				end)
				
				if not Success then
					handleFailure(Result, PopResult, v1, v2, t)
					task.cancel(DelayedThread)
				end
				scheduleFetch()
			end)
			
			return
		end
	end
	
	local function isRequestInQueueOrInFlight(p9): boolean
		-- upvalues: RequestQueueModule (copy), t (ref)
		return if RequestQueueModule.hasItem(p9) then true else t[p9] ~= nil
	end
	
	local function getAndFetchItems(p9, p10, p11)
		-- upvalues: Cache (copy), RequestQueueModule (copy), t (ref), DelayedThread (ref), QueueProcessDelaySec (ref), LocalPlayerUserId (ref), FFlagDataHydrationAccountReset (upval), Callback (ref), RequestBatchSize (ref), t1 (copy), RequestTimeoutSec (copy), p1 (copy), handleFailure (copy), NoSupportsMultiGet (copy), PromiseModule (upval), handleSuccess (copy), scheduleFetch (copy)
		local Items, Items2 = Cache.getItems(p9, p10, p11)
		local t3 = {}
		local List = {}
		
		for i, item in Items do
			t3[i] = item
			
			if Items2[i] and not (if RequestQueueModule.hasItem(i) then true else t[i] ~= nil) then
				RequestQueueModule.push(i)
				table.insert(List, i)
			end
		end
		if #List > 0 then
			Cache.resetFailedItems(List)
		end
		if not RequestQueueModule.isEmpty() and DelayedThread == nil then
			if RequestQueueModule.isEmpty() then
				return t3
			end
			DelayedThread = task.delay(QueueProcessDelaySec, function()
				-- upvalues: LocalPlayerUserId (upval), FFlagDataHydrationAccountReset (upval), Callback (upval), DelayedThread (upval), RequestQueueModule (upval), RequestBatchSize (upval), t (upval), t1 (upval), Cache (upval), RequestTimeoutSec (upval), p1 (upval), handleFailure (upval), NoSupportsMultiGet (upval), PromiseModule (upval), handleSuccess (upval), scheduleFetch (upval)
				local v3 = LocalPlayerUserId
				local v4 = if FFlagDataHydrationAccountReset then Callback(false) else nil
				DelayedThread = nil
				
				if RequestQueueModule.isEmpty() then return end
				local PopResult = RequestQueueModule.pop(RequestBatchSize)
				
				for _, value in PopResult do
					t[value] = true
				end
				local t = {}
				
				for _, value1 in PopResult do
					t[value1] = t1[value1] or 0
				end
				local Items = Cache.getItems(PopResult)
				local Flag = false
				local DelayedThread = task.delay(RequestTimeoutSec, function()
					-- upvalues: p1 (upval), Flag (ref), handleFailure (upval), RequestTimeoutSec (upval), PopResult (copy), v3 (copy), v4 (copy), t (copy)
					if p1.ignoreResponsesAfterTimeout then
						Flag = true
					end
					handleFailure(`No fetch response after {RequestTimeoutSec} sec`, PopResult, v3, v4, t)
				end)
				local Success, Result = pcall(function()
					-- upvalues: NoSupportsMultiGet (upval), PopResult (copy), Items (copy), p1 (upval), PromiseModule (upval), Flag (ref), handleSuccess (upval), v3 (copy), v4 (copy), t (copy), DelayedThread (copy), handleFailure (upval)
					if NoSupportsMultiGet then
						p1.fetchFn(Items):andThen(function(Result)
							-- upvalues: Flag (upval), handleSuccess (upval), PopResult (upval), v3 (upval), v4 (upval), t (upval), DelayedThread (upval)
							if not Flag then
								handleSuccess(Result, PopResult, v3, v4, t)
								task.cancel(DelayedThread)
								
								return
							end
						end):catch(function(Err)
							-- upvalues: Flag (upval), handleFailure (upval), PopResult (upval), v3 (upval), v4 (upval), t (upval), DelayedThread (upval)
							if not Flag then
								handleFailure(Err, PopResult, v3, v4, t)
								task.cancel(DelayedThread)
								
								return
							end
						end)
						
						return
					end
					local Fns = {}
					
					for _, value in PopResult do
						table.insert(Fns, p1.fetchFn(value, Items[value]))
					end
					PromiseModule.all(Fns):andThen(function(Result)
						-- upvalues: Flag (upval), PopResult (upval), handleSuccess (upval), v3 (upval), v4 (upval), t (upval), DelayedThread (upval)
						if Flag then return end
						local t4 = {}
						
						for i, value in PopResult do
							t4[value] = Result[i]
						end
						handleSuccess(t4, PopResult, v3, v4, t)
						task.cancel(DelayedThread)
					end):catch(function(Err)
						-- upvalues: Flag (upval), handleFailure (upval), PopResult (upval), v3 (upval), v4 (upval), t (upval), DelayedThread (upval)
						if not Flag then
							handleFailure(Err, PopResult, v3, v4, t)
							task.cancel(DelayedThread)
							
							return
						end
					end)
				end)
				
				if not Success then
					handleFailure(Result, PopResult, v3, v4, t)
					task.cancel(DelayedThread)
				end
				scheduleFetch()
			end)
		end
		return t3
	end
	
	local function getAndFetchItem(p12, p13, p14)
		-- upvalues: Cache (copy), RequestQueueModule (copy), t (ref), DelayedThread (ref), QueueProcessDelaySec (ref), LocalPlayerUserId (ref), FFlagDataHydrationAccountReset (upval), Callback (ref), RequestBatchSize (ref), t1 (copy), RequestTimeoutSec (copy), p1 (copy), handleFailure (copy), NoSupportsMultiGet (copy), PromiseModule (upval), handleSuccess (copy), scheduleFetch (copy)
		local Item, Item2 = Cache.getItem(p12, p13, p14)
		
		if Item2 and not (if RequestQueueModule.hasItem(p12) then true else t[p12] ~= nil) then
			Cache.resetFailedItem(p12)
			RequestQueueModule.push(p12)
		end
		if not RequestQueueModule.isEmpty() and DelayedThread == nil then
			if RequestQueueModule.isEmpty() then
				return Item, Item2
			end
			DelayedThread = task.delay(QueueProcessDelaySec, function()
				-- upvalues: LocalPlayerUserId (upval), FFlagDataHydrationAccountReset (upval), Callback (upval), DelayedThread (upval), RequestQueueModule (upval), RequestBatchSize (upval), t (upval), t1 (upval), Cache (upval), RequestTimeoutSec (upval), p1 (upval), handleFailure (upval), NoSupportsMultiGet (upval), PromiseModule (upval), handleSuccess (upval), scheduleFetch (upval)
				local v5 = LocalPlayerUserId
				local v6 = if FFlagDataHydrationAccountReset then Callback(false) else nil
				DelayedThread = nil
				
				if RequestQueueModule.isEmpty() then return end
				local PopResult = RequestQueueModule.pop(RequestBatchSize)
				
				for _, value in PopResult do
					t[value] = true
				end
				local t = {}
				
				for _, value1 in PopResult do
					t[value1] = t1[value1] or 0
				end
				local Items = Cache.getItems(PopResult)
				local Flag = false
				local DelayedThread = task.delay(RequestTimeoutSec, function()
					-- upvalues: p1 (upval), Flag (ref), handleFailure (upval), RequestTimeoutSec (upval), PopResult (copy), v5 (copy), v6 (copy), t (copy)
					if p1.ignoreResponsesAfterTimeout then
						Flag = true
					end
					handleFailure(`No fetch response after {RequestTimeoutSec} sec`, PopResult, v5, v6, t)
				end)
				local Success, Result = pcall(function()
					-- upvalues: NoSupportsMultiGet (upval), PopResult (copy), Items (copy), p1 (upval), PromiseModule (upval), Flag (ref), handleSuccess (upval), v5 (copy), v6 (copy), t (copy), DelayedThread (copy), handleFailure (upval)
					if NoSupportsMultiGet then
						p1.fetchFn(Items):andThen(function(Result)
							-- upvalues: Flag (upval), handleSuccess (upval), PopResult (upval), v5 (upval), v6 (upval), t (upval), DelayedThread (upval)
							if not Flag then
								handleSuccess(Result, PopResult, v5, v6, t)
								task.cancel(DelayedThread)
								
								return
							end
						end):catch(function(Err)
							-- upvalues: Flag (upval), handleFailure (upval), PopResult (upval), v5 (upval), v6 (upval), t (upval), DelayedThread (upval)
							if not Flag then
								handleFailure(Err, PopResult, v5, v6, t)
								task.cancel(DelayedThread)
								
								return
							end
						end)
						
						return
					end
					local Fns = {}
					
					for _, value in PopResult do
						table.insert(Fns, p1.fetchFn(value, Items[value]))
					end
					PromiseModule.all(Fns):andThen(function(Result)
						-- upvalues: Flag (upval), PopResult (upval), handleSuccess (upval), v5 (upval), v6 (upval), t (upval), DelayedThread (upval)
						if Flag then return end
						local t4 = {}
						
						for i, value in PopResult do
							t4[value] = Result[i]
						end
						handleSuccess(t4, PopResult, v5, v6, t)
						task.cancel(DelayedThread)
					end):catch(function(Err)
						-- upvalues: Flag (upval), handleFailure (upval), PopResult (upval), v5 (upval), v6 (upval), t (upval), DelayedThread (upval)
						if not Flag then
							handleFailure(Err, PopResult, v5, v6, t)
							task.cancel(DelayedThread)
							
							return
						end
					end)
				end)
				
				if not Success then
					handleFailure(Result, PopResult, v5, v6, t)
					task.cancel(DelayedThread)
				end
				scheduleFetch()
			end)
		end
		return Item, Item2
	end
	
	local function getCachedItem(p15)
		-- upvalues: Cache (copy)
		return Cache.getItem(p15)
	end
	
	local function getCachedItems(p15)
		-- upvalues: Cache (copy)
		return Cache.getItems(p15)
	end
	
	local function fetchItem(p15, p16)
		-- upvalues: getAndFetchItem (copy), FORCE_FETCH (copy)
		return getAndFetchItem(p15, p16 or FORCE_FETCH)
	end
	
	local function fetchItems(p15, p16)
		-- upvalues: getAndFetchItems (copy), FORCE_FETCH (copy)
		return (getAndFetchItems(p15, p16 or FORCE_FETCH))
	end
	
	local function refetchItem(Key)
		-- upvalues: t1 (copy), t (ref), Cache (copy), RequestQueueModule (copy), DelayedThread (ref), QueueProcessDelaySec (ref), LocalPlayerUserId (ref), FFlagDataHydrationAccountReset (upval), Callback (ref), RequestBatchSize (ref), RequestTimeoutSec (copy), p1 (copy), handleFailure (copy), NoSupportsMultiGet (copy), PromiseModule (upval), handleSuccess (copy), scheduleFetch (copy)
		t1[Key] = (t1[Key] or 0) + 1
		t[Key] = nil
		Cache.resetFailedItem(Key)
		
		if not RequestQueueModule.hasItem(Key) then
			RequestQueueModule.push(Key)
		end
		if DelayedThread == nil and not RequestQueueModule.isEmpty() then
			DelayedThread = task.delay(QueueProcessDelaySec, function()
				-- upvalues: LocalPlayerUserId (upval), FFlagDataHydrationAccountReset (upval), Callback (upval), DelayedThread (upval), RequestQueueModule (upval), RequestBatchSize (upval), t (upval), t1 (upval), Cache (upval), RequestTimeoutSec (upval), p1 (upval), handleFailure (upval), NoSupportsMultiGet (upval), PromiseModule (upval), handleSuccess (upval), scheduleFetch (upval)
				local v7 = LocalPlayerUserId
				local v8 = if FFlagDataHydrationAccountReset then Callback(false) else nil
				DelayedThread = nil
				
				if RequestQueueModule.isEmpty() then return end
				local PopResult = RequestQueueModule.pop(RequestBatchSize)
				
				for _, value in PopResult do
					t[value] = true
				end
				local t = {}
				
				for _, value1 in PopResult do
					t[value1] = t1[value1] or 0
				end
				local Items = Cache.getItems(PopResult)
				local Flag = false
				local DelayedThread = task.delay(RequestTimeoutSec, function()
					-- upvalues: p1 (upval), Flag (ref), handleFailure (upval), RequestTimeoutSec (upval), PopResult (copy), v7 (copy), v8 (copy), t (copy)
					if p1.ignoreResponsesAfterTimeout then
						Flag = true
					end
					handleFailure(`No fetch response after {RequestTimeoutSec} sec`, PopResult, v7, v8, t)
				end)
				local Success, Result = pcall(function()
					-- upvalues: NoSupportsMultiGet (upval), PopResult (copy), Items (copy), p1 (upval), PromiseModule (upval), Flag (ref), handleSuccess (upval), v7 (copy), v8 (copy), t (copy), DelayedThread (copy), handleFailure (upval)
					if NoSupportsMultiGet then
						p1.fetchFn(Items):andThen(function(Result)
							-- upvalues: Flag (upval), handleSuccess (upval), PopResult (upval), v7 (upval), v8 (upval), t (upval), DelayedThread (upval)
							if not Flag then
								handleSuccess(Result, PopResult, v7, v8, t)
								task.cancel(DelayedThread)
								
								return
							end
						end):catch(function(Err)
							-- upvalues: Flag (upval), handleFailure (upval), PopResult (upval), v7 (upval), v8 (upval), t (upval), DelayedThread (upval)
							if not Flag then
								handleFailure(Err, PopResult, v7, v8, t)
								task.cancel(DelayedThread)
								
								return
							end
						end)
						
						return
					end
					local Fns = {}
					
					for _, value in PopResult do
						table.insert(Fns, p1.fetchFn(value, Items[value]))
					end
					PromiseModule.all(Fns):andThen(function(Result)
						-- upvalues: Flag (upval), PopResult (upval), handleSuccess (upval), v7 (upval), v8 (upval), t (upval), DelayedThread (upval)
						if Flag then return end
						local t4 = {}
						
						for i, value in PopResult do
							t4[value] = Result[i]
						end
						handleSuccess(t4, PopResult, v7, v8, t)
						task.cancel(DelayedThread)
					end):catch(function(Err)
						-- upvalues: Flag (upval), handleFailure (upval), PopResult (upval), v7 (upval), v8 (upval), t (upval), DelayedThread (upval)
						if not Flag then
							handleFailure(Err, PopResult, v7, v8, t)
							task.cancel(DelayedThread)
							
							return
						end
					end)
				end)
				
				if not Success then
					handleFailure(Result, PopResult, v7, v8, t)
					task.cancel(DelayedThread)
				end
				scheduleFetch()
			end)
		end
		return Cache.getItem(Key)
	end
	
	local function clear()
		-- upvalues: FFlagDataHydrationAccountReset (upval), Callback1 (ref), Callback (ref), DelayedThread (ref), t (ref), RequestQueueModule (copy), MutationLayerModule (ref), p1 (copy), Cache (copy)
		if FFlagDataHydrationAccountReset then
			Callback1(Callback(false) + 1)
		end
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		t = {}
		
		if FFlagDataHydrationAccountReset then
			RequestQueueModule.clear()
			
			if MutationLayerModule then
				MutationLayerModule.clearAll()
			end
			if p1.onBeforeClear then
				p1.onBeforeClear()
			end
			Cache.clear()
			
			if p1.onClear then
				p1.onClear()
				
				return
			end
		else
			Cache.clear()
			RequestQueueModule.clear()
			
			if MutationLayerModule then
				MutationLayerModule.clearAll()
			end
			if p1.onClear then
				p1.onClear()
			end
		end
	end
	
	local Connection = nil
	local Callback4 = nil
	
	if FFlagDataHydrationAccountReset then
		Callback4 = ObserveLocalPlayerUserIdFunction(function(p15)
			-- upvalues: LocalPlayerUserId (ref), clear (copy), FFlagBuildExperienceMonetizationMultiKindModule (upval), Callback2 (ref), Callback3 (ref)
			LocalPlayerUserId = p15
			clear()
			
			if FFlagBuildExperienceMonetizationMultiKindModule then
				Callback2(Callback3(false) + 1)
			end
		end)
	else
		Connection = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
			-- upvalues: GetLocalPlayerUserIdFunction (upval), LocalPlayerUserId (ref), clear (copy), FFlagBuildExperienceMonetizationMultiKindModule (upval), Callback2 (ref), Callback3 (ref)
			local LocalPlayerUserId1 = GetLocalPlayerUserIdFunction()
			
			if LocalPlayerUserId1 ~= LocalPlayerUserId then
				LocalPlayerUserId = LocalPlayerUserId1
				clear()
				
				if FFlagBuildExperienceMonetizationMultiKindModule then
					Callback2(Callback3(false) + 1)
				end
			end
		end)
	end
	local config = {
		getAndFetchItems = getAndFetchItems,
		getAndFetchItem = getAndFetchItem,
		getCachedItem = getCachedItem,
		getCachedItems = getCachedItems,
		fetchItem = fetchItem,
		fetchItems = fetchItems,
		refetchItem = refetchItem,
		isRequestInQueueOrInFlight = isRequestInQueueOrInFlight,
		dispose = function()
			-- upvalues: Callback4 (ref), Connection (ref), FFlagDataHydrationAccountReset (upval), clear (copy), Cache (copy)
			if Callback4 then
				Callback4()
				Callback4 = nil
			end
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
			if FFlagDataHydrationAccountReset then
				clear()
			end
			Cache.dispose()
		end,
		clear = clear,
		getAccountGeneration = if FFlagDataHydrationAccountReset then Callback else nil,
		getAccountResetGeneration = if FFlagBuildExperienceMonetizationMultiKindModule then Callback3 else nil,
		isCurrentRequest = if FFlagDataHydrationAccountReset then isCurrentRequest else nil
	}
	
	if MutationLayerModule then
		function config.getOptimisticCachedItem(p15)
			-- upvalues: Cache (copy), MutationLayerModule (ref)
			local Item, Item2 = Cache.getItem(p15)
			
			return MutationLayerModule.getMergedResult(p15, Item), Item2
		end
		
		function config.getOptimisticCachedItems(p15)
			-- upvalues: Cache (copy), MutationLayerModule (ref)
			local Items, Items2 = Cache.getItems(p15)
			local MergedResults = {}
			
			for i, item in Items do
				MergedResults[i] = MutationLayerModule.getMergedResult(i, item)
			end
			return MergedResults, Items2
		end
		
		function config.getOptimisticAndFetchItem(p16, p17, p18)
			-- upvalues: getAndFetchItem (copy), MutationLayerModule (ref)
			local AndFetchItem, AndFetchItem2 = getAndFetchItem(p16, p17, p18)
			
			return MutationLayerModule.getMergedResult(p16, AndFetchItem), AndFetchItem2
		end
		
		function config.getOptimisticAndFetchItems(p16, p17, p18)
			-- upvalues: getAndFetchItems (copy), MutationLayerModule (ref)
			local MergedResults = {}
			
			for i, value in getAndFetchItems(p16, p17, p18) do
				MergedResults[i] = MutationLayerModule.getMergedResult(i, value)
			end
			return MergedResults
		end
		
		function config.setMutation(p19, p20)
			-- upvalues: MutationLayerModule (ref)
			MutationLayerModule.set(p19, p20)
		end
		
		function config.clearMutation(p19)
			-- upvalues: MutationLayerModule (ref)
			MutationLayerModule.clear(p19)
		end
		
		function config.commitMutation(p19)
			-- upvalues: RequestQueueModule (copy), t (ref), MutationLayerModule (ref), Cache (copy)
			if if RequestQueueModule.hasItem(p19) then true else t[p19] ~= nil then
				MutationLayerModule.markCommitted(p19)
				
				return
			end
			local GetResult = MutationLayerModule.get(p19)
			
			if GetResult ~= nil then
				Cache.updateItem(p19, GetResult)
			end
			MutationLayerModule.clear(p19)
		end
	end
	return config
end