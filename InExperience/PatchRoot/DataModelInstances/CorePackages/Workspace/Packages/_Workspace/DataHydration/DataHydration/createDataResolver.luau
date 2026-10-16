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

return function(p1) --[[ Line: 28 | Named "createDataResolver" ]]
	-- upvalues: LuaAppDataHydrationDefaultBatchSize (copy), LuaAppDataHydrationQueueProcessDelaySec (copy), LuaAppDataHydrationDefaultRequestTimeoutSec (copy), CreateRequestQueueModule (copy), GetLocalPlayerUserIdFunction (copy), FFlagDataHydrationAccountReset (copy), SignalsModule (copy), FFlagBuildExperienceMonetizationMultiKindModule (copy), CreateMutationLayerModule (copy), PromiseModule (copy), ObserveLocalPlayerUserIdFunction (copy), Players (copy)
	local NoSupportsMultiGet = p1.supportsMultiGet == nil or p1.supportsMultiGet
	local RequestBatchSize = if p1.requestBatchSize then if NoSupportsMultiGet or p1.requestBatchSize then p1.requestBatchSize else 1 elseif NoSupportsMultiGet or p1.requestBatchSize then LuaAppDataHydrationDefaultBatchSize else 1
	local QueueProcessDelaySec = if p1.queueProcessDelaySec then if NoSupportsMultiGet or p1.queueProcessDelaySec then p1.queueProcessDelaySec else 0 elseif NoSupportsMultiGet or p1.queueProcessDelaySec then LuaAppDataHydrationQueueProcessDelaySec else 0
	local RequestTimeoutSec = p1.requestTimeoutSec or LuaAppDataHydrationDefaultRequestTimeoutSec
	local Cache = p1.cache
	local RequestQueueModule = CreateRequestQueueModule()
	local t = {}
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
	
	local function FORCE_FETCH(): boolean --[[ Line: 78 ]]
		return true
	end
	
	local function _(p2) --[[ Line: 82 | Named "logError" ]]
		-- upvalues: p1 (copy)
		if p1.logError then
			p1.logError(p2)
		end
	end
	
	local function isCurrentRequest(p2, p3): boolean --[[ Line: 89 ]]
		-- upvalues: Callback (ref), GetLocalPlayerUserIdFunction (upval)
		return p3 == Callback(false) and p2 == GetLocalPlayerUserIdFunction()
	end
	
	local function handleFailure(Message, PopResult, p2, p3) --[[ Line: 98 ]]
		-- upvalues: FFlagDataHydrationAccountReset (upval), Callback (ref), GetLocalPlayerUserIdFunction (upval), LocalPlayerUserId (ref), p1 (copy), t (ref), Cache (copy), MutationLayerModule (ref)
		if FFlagDataHydrationAccountReset then
			if p3 ~= Callback(false) or p2 ~= GetLocalPlayerUserIdFunction() then return end
		elseif p2 ~= LocalPlayerUserId then return end
		if p1.logError then
			p1.logError(Message)
		end
		for _, value in PopResult do
			t[value] = nil
		end
		Cache.markItemsAsFailed(PopResult)
		
		if MutationLayerModule then
			MutationLayerModule.drainCommitted(PopResult, Cache.updateItem)
		end
	end
	
	local function handleSuccess(List, PopResult, p4, p5) --[[ Line: 122 ]]
		-- upvalues: FFlagDataHydrationAccountReset (upval), Callback (ref), GetLocalPlayerUserIdFunction (upval), LocalPlayerUserId (ref), t (ref), p1 (copy), Cache (copy), MutationLayerModule (ref), handleFailure (copy)
		if FFlagDataHydrationAccountReset then
			if p5 ~= Callback(false) or p4 ~= GetLocalPlayerUserIdFunction() then return end
		elseif p4 ~= LocalPlayerUserId then return end
		for i, _ in List do
			t[i] = nil
		end
		if p1.replaceItems then
			Cache.replaceItems(List)
		else
			Cache.updateItems(List)
		end
		local List1 = {}
		
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
		if #List1 > 0 then
			handleFailure("Items missing in response", List1, p4, p5)
		end
	end
	
	local function scheduleFetch() --[[ Line: 169 ]]
		-- upvalues: DelayedThread (ref), RequestQueueModule (copy), QueueProcessDelaySec (ref), LocalPlayerUserId (ref), FFlagDataHydrationAccountReset (upval), Callback (ref), RequestBatchSize (ref), t (ref), Cache (copy), RequestTimeoutSec (copy), p1 (copy), handleFailure (copy), NoSupportsMultiGet (copy), PromiseModule (upval), handleSuccess (copy), scheduleFetch (copy)
		if DelayedThread == nil and not RequestQueueModule.isEmpty() then
			DelayedThread = task.delay(QueueProcessDelaySec, function() --[[ Line: 175 ]]
				-- upvalues: LocalPlayerUserId (upval), FFlagDataHydrationAccountReset (upval), Callback (upval), DelayedThread (upval), RequestQueueModule (upval), RequestBatchSize (upval), t (upval), Cache (upval), RequestTimeoutSec (upval), p1 (upval), handleFailure (upval), NoSupportsMultiGet (upval), PromiseModule (upval), handleSuccess (upval), scheduleFetch (upval)
				local v1 = LocalPlayerUserId
				local v2 = if FFlagDataHydrationAccountReset then Callback(false) else nil
				DelayedThread = nil
				
				if RequestQueueModule.isEmpty() then return end
				local PopResult = RequestQueueModule.pop(RequestBatchSize)
				
				for _, value in PopResult do
					t[value] = true
				end
				local Items = Cache.getItems(PopResult)
				local Flag = false
				local DelayedThread = task.delay(RequestTimeoutSec, function() --[[ Line: 194 ]]
					-- upvalues: p1 (upval), Flag (ref), handleFailure (upval), RequestTimeoutSec (upval), PopResult (copy), v1 (copy), v2 (copy)
					if p1.ignoreResponsesAfterTimeout then
						Flag = true
					end
					handleFailure(`No fetch response after {RequestTimeoutSec} sec`, PopResult, v1, v2)
				end)
				local Success, Result = pcall(function() --[[ Line: 206 ]]
					-- upvalues: NoSupportsMultiGet (upval), PopResult (copy), Items (copy), p1 (upval), PromiseModule (upval), Flag (ref), handleSuccess (upval), v1 (copy), v2 (copy), DelayedThread (copy), handleFailure (upval)
					if NoSupportsMultiGet then
						p1.fetchFn(Items):andThen(function(Result) --[[ Line: 235 ]]
							-- upvalues: Flag (upval), handleSuccess (upval), PopResult (upval), v1 (upval), v2 (upval), DelayedThread (upval)
							if not Flag then
								handleSuccess(Result, PopResult, v1, v2)
								task.cancel(DelayedThread)
								
								return
							end
						end):catch(function(Err) --[[ Line: 242 ]]
							-- upvalues: Flag (upval), handleFailure (upval), PopResult (upval), v1 (upval), v2 (upval), DelayedThread (upval)
							if not Flag then
								handleFailure(Err, PopResult, v1, v2)
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
					PromiseModule.all(Fns):andThen(function(Result) --[[ Line: 215 ]]
						-- upvalues: Flag (upval), PopResult (upval), handleSuccess (upval), v1 (upval), v2 (upval), DelayedThread (upval)
						if Flag then return end
						local t = {}
						
						for i, value in PopResult do
							t[value] = Result[i]
						end
						handleSuccess(t, PopResult, v1, v2)
						task.cancel(DelayedThread)
					end):catch(function(Err) --[[ Line: 226 ]]
						-- upvalues: Flag (upval), handleFailure (upval), PopResult (upval), v1 (upval), v2 (upval), DelayedThread (upval)
						if not Flag then
							handleFailure(Err, PopResult, v1, v2)
							task.cancel(DelayedThread)
							
							return
						end
					end)
				end)
				
				if not Success then
					handleFailure(Result, PopResult, v1, v2)
					task.cancel(DelayedThread)
				end
				scheduleFetch()
			end)
			
			return
		end
	end
	
	local function isRequestInQueueOrInFlight(p6): boolean --[[ Line: 261 ]]
		-- upvalues: RequestQueueModule (copy), t (ref)
		return if RequestQueueModule.hasItem(p6) then true else t[p6] ~= nil
	end
	
	local function getAndFetchItems(p6, p7, p8) --[[ Line: 271 ]]
		-- upvalues: Cache (copy), RequestQueueModule (copy), t (ref), DelayedThread (ref), QueueProcessDelaySec (ref), LocalPlayerUserId (ref), FFlagDataHydrationAccountReset (upval), Callback (ref), RequestBatchSize (ref), RequestTimeoutSec (copy), p1 (copy), handleFailure (copy), NoSupportsMultiGet (copy), PromiseModule (upval), handleSuccess (copy), scheduleFetch (copy)
		local Items, Items2 = Cache.getItems(p6, p7, p8)
		local t1 = {}
		local List = {}
		
		for i, item in Items do
			t1[i] = item
			
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
				return t1
			end
			DelayedThread = task.delay(QueueProcessDelaySec, function() --[[ Line: 175 ]]
				-- upvalues: LocalPlayerUserId (upval), FFlagDataHydrationAccountReset (upval), Callback (upval), DelayedThread (upval), RequestQueueModule (upval), RequestBatchSize (upval), t (upval), Cache (upval), RequestTimeoutSec (upval), p1 (upval), handleFailure (upval), NoSupportsMultiGet (upval), PromiseModule (upval), handleSuccess (upval), scheduleFetch (upval)
				local v3 = LocalPlayerUserId
				local v4 = if FFlagDataHydrationAccountReset then Callback(false) else nil
				DelayedThread = nil
				
				if RequestQueueModule.isEmpty() then return end
				local PopResult = RequestQueueModule.pop(RequestBatchSize)
				
				for _, value in PopResult do
					t[value] = true
				end
				local Items = Cache.getItems(PopResult)
				local Flag = false
				local DelayedThread = task.delay(RequestTimeoutSec, function() --[[ Line: 194 ]]
					-- upvalues: p1 (upval), Flag (ref), handleFailure (upval), RequestTimeoutSec (upval), PopResult (copy), v3 (copy), v4 (copy)
					if p1.ignoreResponsesAfterTimeout then
						Flag = true
					end
					handleFailure(`No fetch response after {RequestTimeoutSec} sec`, PopResult, v3, v4)
				end)
				local Success, Result = pcall(function() --[[ Line: 206 ]]
					-- upvalues: NoSupportsMultiGet (upval), PopResult (copy), Items (copy), p1 (upval), PromiseModule (upval), Flag (ref), handleSuccess (upval), v3 (copy), v4 (copy), DelayedThread (copy), handleFailure (upval)
					if NoSupportsMultiGet then
						p1.fetchFn(Items):andThen(function(Result) --[[ Line: 235 ]]
							-- upvalues: Flag (upval), handleSuccess (upval), PopResult (upval), v3 (upval), v4 (upval), DelayedThread (upval)
							if not Flag then
								handleSuccess(Result, PopResult, v3, v4)
								task.cancel(DelayedThread)
								
								return
							end
						end):catch(function(Err) --[[ Line: 242 ]]
							-- upvalues: Flag (upval), handleFailure (upval), PopResult (upval), v3 (upval), v4 (upval), DelayedThread (upval)
							if not Flag then
								handleFailure(Err, PopResult, v3, v4)
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
					PromiseModule.all(Fns):andThen(function(Result) --[[ Line: 215 ]]
						-- upvalues: Flag (upval), PopResult (upval), handleSuccess (upval), v3 (upval), v4 (upval), DelayedThread (upval)
						if Flag then return end
						local t = {}
						
						for i, value in PopResult do
							t[value] = Result[i]
						end
						handleSuccess(t, PopResult, v3, v4)
						task.cancel(DelayedThread)
					end):catch(function(Err) --[[ Line: 226 ]]
						-- upvalues: Flag (upval), handleFailure (upval), PopResult (upval), v3 (upval), v4 (upval), DelayedThread (upval)
						if not Flag then
							handleFailure(Err, PopResult, v3, v4)
							task.cancel(DelayedThread)
							
							return
						end
					end)
				end)
				
				if not Success then
					handleFailure(Result, PopResult, v3, v4)
					task.cancel(DelayedThread)
				end
				scheduleFetch()
			end)
		end
		return t1
	end
	
	local function getAndFetchItem(p9, p10, p11) --[[ Line: 293 ]]
		-- upvalues: Cache (copy), RequestQueueModule (copy), t (ref), DelayedThread (ref), QueueProcessDelaySec (ref), LocalPlayerUserId (ref), FFlagDataHydrationAccountReset (upval), Callback (ref), RequestBatchSize (ref), RequestTimeoutSec (copy), p1 (copy), handleFailure (copy), NoSupportsMultiGet (copy), PromiseModule (upval), handleSuccess (copy), scheduleFetch (copy)
		local Item, Item2 = Cache.getItem(p9, p10, p11)
		
		if Item2 and not (if RequestQueueModule.hasItem(p9) then true else t[p9] ~= nil) then
			Cache.resetFailedItem(p9)
			RequestQueueModule.push(p9)
		end
		if not RequestQueueModule.isEmpty() and DelayedThread == nil then
			if RequestQueueModule.isEmpty() then
				return Item, Item2
			end
			DelayedThread = task.delay(QueueProcessDelaySec, function() --[[ Line: 175 ]]
				-- upvalues: LocalPlayerUserId (upval), FFlagDataHydrationAccountReset (upval), Callback (upval), DelayedThread (upval), RequestQueueModule (upval), RequestBatchSize (upval), t (upval), Cache (upval), RequestTimeoutSec (upval), p1 (upval), handleFailure (upval), NoSupportsMultiGet (upval), PromiseModule (upval), handleSuccess (upval), scheduleFetch (upval)
				local v5 = LocalPlayerUserId
				local v6 = if FFlagDataHydrationAccountReset then Callback(false) else nil
				DelayedThread = nil
				
				if RequestQueueModule.isEmpty() then return end
				local PopResult = RequestQueueModule.pop(RequestBatchSize)
				
				for _, value in PopResult do
					t[value] = true
				end
				local Items = Cache.getItems(PopResult)
				local Flag = false
				local DelayedThread = task.delay(RequestTimeoutSec, function() --[[ Line: 194 ]]
					-- upvalues: p1 (upval), Flag (ref), handleFailure (upval), RequestTimeoutSec (upval), PopResult (copy), v5 (copy), v6 (copy)
					if p1.ignoreResponsesAfterTimeout then
						Flag = true
					end
					handleFailure(`No fetch response after {RequestTimeoutSec} sec`, PopResult, v5, v6)
				end)
				local Success, Result = pcall(function() --[[ Line: 206 ]]
					-- upvalues: NoSupportsMultiGet (upval), PopResult (copy), Items (copy), p1 (upval), PromiseModule (upval), Flag (ref), handleSuccess (upval), v5 (copy), v6 (copy), DelayedThread (copy), handleFailure (upval)
					if NoSupportsMultiGet then
						p1.fetchFn(Items):andThen(function(Result) --[[ Line: 235 ]]
							-- upvalues: Flag (upval), handleSuccess (upval), PopResult (upval), v5 (upval), v6 (upval), DelayedThread (upval)
							if not Flag then
								handleSuccess(Result, PopResult, v5, v6)
								task.cancel(DelayedThread)
								
								return
							end
						end):catch(function(Err) --[[ Line: 242 ]]
							-- upvalues: Flag (upval), handleFailure (upval), PopResult (upval), v5 (upval), v6 (upval), DelayedThread (upval)
							if not Flag then
								handleFailure(Err, PopResult, v5, v6)
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
					PromiseModule.all(Fns):andThen(function(Result) --[[ Line: 215 ]]
						-- upvalues: Flag (upval), PopResult (upval), handleSuccess (upval), v5 (upval), v6 (upval), DelayedThread (upval)
						if Flag then return end
						local t = {}
						
						for i, value in PopResult do
							t[value] = Result[i]
						end
						handleSuccess(t, PopResult, v5, v6)
						task.cancel(DelayedThread)
					end):catch(function(Err) --[[ Line: 226 ]]
						-- upvalues: Flag (upval), handleFailure (upval), PopResult (upval), v5 (upval), v6 (upval), DelayedThread (upval)
						if not Flag then
							handleFailure(Err, PopResult, v5, v6)
							task.cancel(DelayedThread)
							
							return
						end
					end)
				end)
				
				if not Success then
					handleFailure(Result, PopResult, v5, v6)
					task.cancel(DelayedThread)
				end
				scheduleFetch()
			end)
		end
		return Item, Item2
	end
	
	local function getCachedItem(p12) --[[ Line: 305 ]]
		-- upvalues: Cache (copy)
		return Cache.getItem(p12)
	end
	
	local function getCachedItems(p12) --[[ Line: 309 ]]
		-- upvalues: Cache (copy)
		return Cache.getItems(p12)
	end
	
	local function fetchItem(p12, p13) --[[ Line: 313 ]]
		-- upvalues: getAndFetchItem (copy), FORCE_FETCH (copy)
		return getAndFetchItem(p12, p13 or FORCE_FETCH)
	end
	
	local function fetchItems(p12, p13) --[[ Line: 317 ]]
		-- upvalues: getAndFetchItems (copy), FORCE_FETCH (copy)
		return (getAndFetchItems(p12, p13 or FORCE_FETCH))
	end
	
	local function clear() --[[ Line: 321 ]]
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
		Callback4 = ObserveLocalPlayerUserIdFunction(function(p12) --[[ Line: 359 ]]
			-- upvalues: LocalPlayerUserId (ref), clear (copy), FFlagBuildExperienceMonetizationMultiKindModule (upval), Callback2 (ref), Callback3 (ref)
			LocalPlayerUserId = p12
			clear()
			
			if FFlagBuildExperienceMonetizationMultiKindModule then
				Callback2(Callback3(false) + 1)
			end
		end)
	else
		Connection = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ Line: 367 ]]
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
		isRequestInQueueOrInFlight = isRequestInQueueOrInFlight,
		dispose = function() --[[ Line: 379 ]]
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
		function config.getOptimisticCachedItem(p12) --[[ Line: 417 ]]
			-- upvalues: Cache (copy), MutationLayerModule (ref)
			local Item, Item2 = Cache.getItem(p12)
			
			return MutationLayerModule.getMergedResult(p12, Item), Item2
		end
		
		function config.getOptimisticCachedItems(p12) --[[ Line: 422 ]]
			-- upvalues: Cache (copy), MutationLayerModule (ref)
			local Items, Items2 = Cache.getItems(p12)
			local MergedResults = {}
			
			for i, item in Items do
				MergedResults[i] = MutationLayerModule.getMergedResult(i, item)
			end
			return MergedResults, Items2
		end
		
		function config.getOptimisticAndFetchItem(p13, p14, p15) --[[ Line: 432 ]]
			-- upvalues: getAndFetchItem (copy), MutationLayerModule (ref)
			local AndFetchItem, AndFetchItem2 = getAndFetchItem(p13, p14, p15)
			
			return MutationLayerModule.getMergedResult(p13, AndFetchItem), AndFetchItem2
		end
		
		function config.getOptimisticAndFetchItems(p13, p14, p15) --[[ Line: 441 ]]
			-- upvalues: getAndFetchItems (copy), MutationLayerModule (ref)
			local MergedResults = {}
			
			for i, value in getAndFetchItems(p13, p14, p15) do
				MergedResults[i] = MutationLayerModule.getMergedResult(i, value)
			end
			return MergedResults
		end
		
		function config.setMutation(p16, p17) --[[ Line: 455 ]]
			-- upvalues: MutationLayerModule (ref)
			MutationLayerModule.set(p16, p17)
		end
		
		function config.clearMutation(p16) --[[ Line: 460 ]]
			-- upvalues: MutationLayerModule (ref)
			MutationLayerModule.clear(p16)
		end
		
		function config.commitMutation(p16) --[[ Line: 465 ]]
			-- upvalues: RequestQueueModule (copy), t (ref), MutationLayerModule (ref), Cache (copy)
			if if RequestQueueModule.hasItem(p16) then true else t[p16] ~= nil then
				MutationLayerModule.markCommitted(p16)
				
				return
			end
			local GetResult = MutationLayerModule.get(p16)
			
			if GetResult ~= nil then
				Cache.updateItem(p16, GetResult)
			end
			MutationLayerModule.clear(p16)
		end
	end
	return config
end