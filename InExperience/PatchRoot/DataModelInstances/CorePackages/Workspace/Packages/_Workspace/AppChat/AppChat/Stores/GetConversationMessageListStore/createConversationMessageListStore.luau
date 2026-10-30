local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local CreateProxyFunction = SignalsExperimentalModule.createProxy
local ArraySetModule = require(AppChat.DataStructures.ArraySet)
local FFlagAppChatBatchMessageListPagePublicationModule = require(AppChat.Flags.FFlagAppChatBatchMessageListPagePublication)
local FFlagAppChatIncrementalPaginationProjectionModule = require(AppChat.Flags.FFlagAppChatIncrementalPaginationProjection)
local FFlagAppChatGroupedVariantNeighbourIdsModule = require(AppChat.Flags.FFlagAppChatGroupedVariantNeighbourIds)

local function _()
	-- upvalues: ArraySetModule (copy)
	return { messageIds = ArraySetModule.new({}) }
end

local _ = function()
	return {
		nextPageCursor = nil,
		isLoading = false,
		fetchedOldest = false
	}
end

return function()
	-- upvalues: CreateProxyFunction (copy), SignalsModule (copy), SignalsExperimentalModule (copy), ArraySetModule (copy), FFlagAppChatGroupedVariantNeighbourIdsModule (copy), FFlagAppChatIncrementalPaginationProjectionModule (copy), CryoModule (copy), FFlagAppChatBatchMessageListPagePublicationModule (copy)
	local Proxy = CreateProxyFunction({})
	local Proxy1 = CreateProxyFunction({})
	local Proxy2 = CreateProxyFunction({})
	local Proxy3 = CreateProxyFunction({})
	local t = {}
	local t1 = {}
	local Revision = 0
	local Count = 0
	local Keys = {}
	local t2 = {}
	
	local function publishMutation(Key, Operation, Tbl, Tbl1, BoundaryMessageId)
		-- upvalues: Revision (ref), t (copy), SignalsModule (upval), t1 (copy), Count (ref), t2 (ref), Keys (ref)
		Revision += 1
		
		if t[Key] == nil then
			t[Key], t1[Key] = SignalsModule.createSignal(nil)
		end
		local config = {
			operation = Operation,
			messageIds = table.clone(Tbl),
			insertedIds = table.clone(Tbl1),
			boundaryMessageId = BoundaryMessageId,
			revision = Revision
		}
		
		if Count <= 0 then
			t1[Key](config)
			
			return
		end
		local Entry = t2[Key]
		
		if Entry == nil then
			Entry = {}
			t2[Key] = Entry
			table.insert(Keys, Key)
		end
		table.insert(Entry, config)
	end
	
	local function publishQueuedMutations()
		-- upvalues: Keys (ref), t2 (ref), t1 (copy)
		local Keys1 = Keys
		local t = t2
		Keys = {}
		t2 = {}
		
		for _, value in Keys1 do
			local Entry = t[value]
			
			if #Entry == 1 then
				t1[value](Entry[1])
			else
				t1[value]({
					operation = "Batch",
					boundaryMessageId = nil,
					messageIds = {},
					insertedIds = {},
					revision = Entry[#Entry].revision,
					mutations = Entry
				})
			end
		end
	end
	
	local function addTraceback(Err)
		return if type(Err) == "string" then debug.traceback(Err, 2) else Err
	end
	
	local function _(p1)
		-- upvalues: Proxy (copy), ArraySetModule (upval)
		local ProxyEntry = Proxy[p1]
		
		return if ProxyEntry == nil then { messageIds = ArraySetModule.new({}) } else ProxyEntry
	end
	
	local _ = function(p1)
		-- upvalues: Proxy1 (copy)
		local ProxyEntry = Proxy1[p1]
		
		return if ProxyEntry == nil then {
			nextPageCursor = nil,
			isLoading = false,
			fetchedOldest = false
		} else ProxyEntry
	end
	
	local _ = function(Text, Text1): string
		return Text .. "\0" .. Text1
	end
	
	local function writeNeighbourIds(Key, p1, SizeResult: number, IndexOfResult: number)
		-- upvalues: Proxy2 (copy), Proxy3 (copy)
		for i = math.max(SizeResult, 1), math.min(IndexOfResult, p1.messageIds:size()) do
			local Text = Key .. "\0" .. p1.messageIds:at(i)
			Proxy2[Text] = p1.messageIds:at(i - 1)
			Proxy3[Text] = p1.messageIds:at(i + 1)
		end
	end
	
	local _ = function(Text, List)
		-- upvalues: Proxy2 (copy), Proxy3 (copy)
		for _, value in List do
			local Text1 = Text .. "\0" .. value
			Proxy2[Text1] = nil
			Proxy3[Text1] = nil
		end
	end
	
	local _ = function(p2)
		-- upvalues: FFlagAppChatGroupedVariantNeighbourIdsModule (upval), SignalsExperimentalModule (upval), Count (ref), addTraceback (copy), publishQueuedMutations (copy)
		if not FFlagAppChatGroupedVariantNeighbourIdsModule then
			local v1: () -> () = p2
			v1()
			
			return
		end
		local v1 = nil
		local v2 = nil
		SignalsExperimentalModule.batch(function()
			-- upvalues: Count (upval), v1 (ref), v2 (ref), p2 (copy), addTraceback (upval), publishQueuedMutations (upval)
			Count += 1
			v1, v53 = xpcall(p2, addTraceback)
			Count -= 1
			
			if Count == 0 then
				publishQueuedMutations()
			end
		end)
		
		if not v1 then
			error(v2, 0)
		end
	end
	
	local function prependMessagesInternal(Key, List)
		-- upvalues: Proxy (copy), ArraySetModule (upval), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (copy), FFlagAppChatGroupedVariantNeighbourIdsModule (upval), writeNeighbourIds (copy)
		local ProxyEntry = Proxy[Key]
		local Config = if ProxyEntry == nil then { messageIds = ArraySetModule.new({}) } else ProxyEntry
		local SizeResult = Config.messageIds:size()
		local BoundaryMessageId = nil
		local List1 = {}
		
		if FFlagAppChatIncrementalPaginationProjectionModule then
			BoundaryMessageId = Config.messageIds:at(1)
			local t = {}
			
			for _, value in List do
				if not Config.messageIds:has(value) and not t[value] then
					t[value] = true
					table.insert(List1, value)
				end
			end
		end
		if Config.messageIds:prependAll(List) then
			Proxy[Key] = table.clone(Config)
			
			if FFlagAppChatGroupedVariantNeighbourIdsModule then
				writeNeighbourIds(Key, Config, 1, Config.messageIds:size() - SizeResult + 1)
			end
			if FFlagAppChatIncrementalPaginationProjectionModule then
				publishMutation(Key, "Prepend", List, List1, BoundaryMessageId)
			end
			return
		elseif FFlagAppChatIncrementalPaginationProjectionModule and #List > 0 then
			publishMutation(Key, "Prepend", List, {}, nil)
		end
	end
	
	local function appendMessagesInternal(Key, List)
		-- upvalues: Proxy (copy), ArraySetModule (upval), FFlagAppChatGroupedVariantNeighbourIdsModule (upval), writeNeighbourIds (copy)
		local ProxyEntry = Proxy[Key]
		local Config = if ProxyEntry == nil then { messageIds = ArraySetModule.new({}) } else ProxyEntry
		local SizeResult = Config.messageIds:size()
		local v1 = Config.messageIds:at(SizeResult)
		local List1 = {}
		
		for _, value in List do
			if Config.messageIds:add(value) then
				table.insert(List1, value)
			end
		end
		if #List1 > 0 then
			Proxy[Key] = table.clone(Config)
		end
		if FFlagAppChatGroupedVariantNeighbourIdsModule and #List1 > 0 then
			writeNeighbourIds(Key, Config, SizeResult, Config.messageIds:size())
		end
		return List1, v1
	end
	
	local _ = function(p2, p3)
		-- upvalues: appendMessagesInternal (copy), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (copy)
		local AppendMessagesInternalResult, AppendMessagesInternalResult2 = appendMessagesInternal(p2, p3)
		
		if FFlagAppChatIncrementalPaginationProjectionModule and #p3 > 0 then
			publishMutation(p2, "Append", p3, AppendMessagesInternalResult, AppendMessagesInternalResult2)
		end
	end
	
	local function removeMessageInternal(Key, p2)
		-- upvalues: Proxy (copy), FFlagAppChatGroupedVariantNeighbourIdsModule (upval), Proxy2 (copy), Proxy3 (copy), writeNeighbourIds (copy), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (copy)
		local ProxyEntry = Proxy[Key]
		
		if ProxyEntry == nil then return end
		local IndexOfResult: number = ProxyEntry.messageIds:indexOf(p2)
		
		if IndexOfResult == nil or not ProxyEntry.messageIds:remove(p2) then return end
		Proxy[Key] = table.clone(ProxyEntry)
		
		if FFlagAppChatGroupedVariantNeighbourIdsModule then
			for _, value in { p2 } do
				local Text = Key .. "\0" .. value
				Proxy2[Text] = nil
				Proxy3[Text] = nil
			end
			writeNeighbourIds(Key, ProxyEntry, IndexOfResult - 1, IndexOfResult)
		end
		if FFlagAppChatIncrementalPaginationProjectionModule then
			publishMutation(Key, "Remove", { p2 }, {}, nil)
		end
	end
	
	local function updatePagination(Key, p3, FetchedOldest)
		-- upvalues: Proxy1 (copy), CryoModule (upval)
		local ProxyEntry = Proxy1[Key]
		local Config = if ProxyEntry == nil then {
			nextPageCursor = nil,
			isLoading = false,
			fetchedOldest = false
		} else ProxyEntry
		Proxy1[Key] = CryoModule.Dictionary.union(Config, {
			isLoading = false,
			nextPageCursor = if p3 and p3 ~= "" then p3 else Config.nextPageCursor,
			fetchedOldest = FetchedOldest
		})
	end
	
	local _ = function(p3, p4, p5)
		-- upvalues: appendMessagesInternal (copy), updatePagination (copy), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (copy)
		local AppendMessagesInternalResult, AppendMessagesInternalResult2 = appendMessagesInternal(p3, p4)
		updatePagination(p3, p5, p5 == nil or p5 == "")
		
		if FFlagAppChatIncrementalPaginationProjectionModule then
			publishMutation(p3, "AppendAndAdvanceCursor", p4, AppendMessagesInternalResult, AppendMessagesInternalResult2)
		end
	end
	
	local function clearConversationInternal(Key)
		-- upvalues: FFlagAppChatGroupedVariantNeighbourIdsModule (upval), Proxy (copy), Proxy2 (copy), Proxy3 (copy), Proxy1 (copy), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (copy)
		if FFlagAppChatGroupedVariantNeighbourIdsModule then
			local ProxyEntry = Proxy[Key]
			
			if ProxyEntry ~= nil then
				for _, value in ProxyEntry.messageIds:values() do
					local Text = Key .. "\0" .. value
					Proxy2[Text] = nil
					Proxy3[Text] = nil
				end
			end
		end
		Proxy[Key] = nil
		Proxy1[Key] = nil
		
		if FFlagAppChatIncrementalPaginationProjectionModule then
			publishMutation(Key, "Reset", {}, {}, nil)
		end
	end
	
	local function clearInternal()
		-- upvalues: Proxy (copy), FFlagAppChatGroupedVariantNeighbourIdsModule (upval), Proxy2 (copy), Proxy3 (copy), Proxy1 (copy), FFlagAppChatIncrementalPaginationProjectionModule (upval), t (copy), publishMutation (copy)
		local List = {}
		local t3 = {}
		
		for i, value in Proxy do
			table.insert(List, i)
			t3[i] = true
			
			if FFlagAppChatGroupedVariantNeighbourIdsModule and value ~= nil then
				for _, value1 in value.messageIds:values() do
					local Text = i .. "\0" .. value1
					Proxy2[Text] = nil
					Proxy3[Text] = nil
				end
			end
			Proxy[i] = nil
		end
		for i1 in Proxy1 do
			Proxy1[i1] = nil
		end
		if FFlagAppChatIncrementalPaginationProjectionModule then
			for i2 in t do
				if not t3[i2] then
					table.insert(List, i2)
				end
			end
			for _, value2 in List do
				publishMutation(value2, "Reset", {}, {}, nil)
			end
		end
	end
	
	return {
		conversations = Proxy,
		metadata = Proxy1,
		getMutation = function(Key)
			-- upvalues: t (copy), SignalsModule (upval), t3 (copy)
			local Entry = t[Key]
			
			if Entry == nil then
				local Signal, Signal2 = SignalsModule.createSignal(nil)
				t[Key] = Signal
				t3[Key] = Signal2
				
				return Signal
			else
				return Entry
			end
		end,
		batchMutations = function(p3)
			-- upvalues: SignalsExperimentalModule (upval), Count (ref), addTraceback (copy), publishQueuedMutations (copy)
			local v2 = nil
			local v3 = nil
			SignalsExperimentalModule.batch(function()
				-- upvalues: Count (upval), v2 (ref), v3 (ref), p3 (copy), addTraceback (upval), publishQueuedMutations (upval)
				Count += 1
				v2, v47 = xpcall(p3, addTraceback)
				Count -= 1
				
				if Count == 0 then
					publishQueuedMutations()
				end
			end)
			
			if not v2 then
				error(v3, 0)
			end
		end,
		prependMessages = function(p3, p4)
			-- upvalues: prependMessagesInternal (copy), FFlagAppChatGroupedVariantNeighbourIdsModule (upval), SignalsExperimentalModule (upval), Count (ref), addTraceback (copy), publishQueuedMutations (copy)
			local function v60()
				-- upvalues: prependMessagesInternal (upval), p3 (copy), p4 (copy)
				prependMessagesInternal(p3, p4)
			end
			
			if not FFlagAppChatGroupedVariantNeighbourIdsModule then
				local v2: (any, any) -> () = prependMessagesInternal
				local v3 = p3
				v2(v3, p4)
				
				return
			end
			local v2 = nil
			local v3 = nil
			SignalsExperimentalModule.batch(function()
				-- upvalues: Count (upval), v2 (ref), v3 (ref), v60 (copy), addTraceback (upval), publishQueuedMutations (upval)
				Count += 1
				v2, v62 = xpcall(v60, addTraceback)
				Count -= 1
				
				if Count == 0 then
					publishQueuedMutations()
				end
			end)
			
			if not v2 then
				error(v3, 0)
			end
		end,
		appendMessages = function(p3, p4)
			-- upvalues: appendMessagesInternal (copy), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (copy), FFlagAppChatGroupedVariantNeighbourIdsModule (upval), SignalsExperimentalModule (upval), Count (ref), addTraceback (copy), publishQueuedMutations (copy)
			local function v70()
				-- upvalues: p3 (copy), p4 (copy), appendMessagesInternal (upval), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (upval)
				local AppendMessagesInternalResult, AppendMessagesInternalResult2 = appendMessagesInternal(p3, p4)
				
				if FFlagAppChatIncrementalPaginationProjectionModule and #p4 > 0 then
					publishMutation(p3, "Append", p4, AppendMessagesInternalResult, AppendMessagesInternalResult2)
				end
			end
			
			if FFlagAppChatGroupedVariantNeighbourIdsModule then
				local v2 = nil
				local v3 = nil
				SignalsExperimentalModule.batch(function()
					-- upvalues: Count (upval), v2 (ref), v3 (ref), v70 (copy), addTraceback (upval), publishQueuedMutations (upval)
					Count += 1
					v2, v72 = xpcall(v70, addTraceback)
					Count -= 1
					
					if Count == 0 then
						publishQueuedMutations()
					end
				end)
				
				if not v2 then
					error(v3, 0)
				end
				return
			else
				local v2 = appendMessagesInternal
				local v3 = p3
				local CallbackResult, CallbackResult2 = v2(v3, p4)
				
				if FFlagAppChatIncrementalPaginationProjectionModule and #p4 > 0 then
					publishMutation(p3, "Append", p4, CallbackResult, CallbackResult2)
				end
			end
		end,
		removeMessage = function(p3, p4)
			-- upvalues: removeMessageInternal (copy), FFlagAppChatGroupedVariantNeighbourIdsModule (upval), SignalsExperimentalModule (upval), Count (ref), addTraceback (copy), publishQueuedMutations (copy)
			local function v80()
				-- upvalues: removeMessageInternal (upval), p3 (copy), p4 (copy)
				removeMessageInternal(p3, p4)
			end
			
			if not FFlagAppChatGroupedVariantNeighbourIdsModule then
				local v2: (any, any) -> () = removeMessageInternal
				local v3 = p3
				v2(v3, p4)
				
				return
			end
			local v2 = nil
			local v3 = nil
			SignalsExperimentalModule.batch(function()
				-- upvalues: Count (upval), v2 (ref), v3 (ref), v80 (copy), addTraceback (upval), publishQueuedMutations (upval)
				Count += 1
				v2, v82 = xpcall(v80, addTraceback)
				Count -= 1
				
				if Count == 0 then
					publishQueuedMutations()
				end
			end)
			
			if not v2 then
				error(v3, 0)
			end
		end,
		publishMessageUpdates = function(p3, p4)
			-- upvalues: publishMutation (copy)
			if #p4 > 0 then
				publishMutation(p3, "Update", p4, {}, nil)
			end
		end,
		setLoading = function(Key, IsLoading)
			-- upvalues: Proxy1 (copy), CryoModule (upval)
			local ProxyEntry = Proxy1[Key]
			Proxy1[Key] = CryoModule.Dictionary.union(if ProxyEntry == nil then {
				nextPageCursor = nil,
				isLoading = false,
				fetchedOldest = false
			} else ProxyEntry, { isLoading = IsLoading })
		end,
		updatePagination = updatePagination,
		receivePage = function(p3, p4, p5)
			-- upvalues: FFlagAppChatGroupedVariantNeighbourIdsModule (upval), appendMessagesInternal (copy), updatePagination (copy), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (copy), SignalsExperimentalModule (upval), Count (ref), addTraceback (copy), publishQueuedMutations (copy), FFlagAppChatBatchMessageListPagePublicationModule (upval)
			if FFlagAppChatGroupedVariantNeighbourIdsModule then
				local function v88()
					-- upvalues: p3 (copy), p4 (copy), p5 (copy), appendMessagesInternal (upval), updatePagination (upval), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (upval)
					local AppendMessagesInternalResult, AppendMessagesInternalResult2 = appendMessagesInternal(p3, p4)
					updatePagination(p3, p5, p5 == nil or p5 == "")
					
					if FFlagAppChatIncrementalPaginationProjectionModule then
						publishMutation(p3, "AppendAndAdvanceCursor", p4, AppendMessagesInternalResult, AppendMessagesInternalResult2)
					end
				end
				
				local v2 = nil
				local v3 = nil
				SignalsExperimentalModule.batch(function()
					-- upvalues: Count (upval), v2 (ref), v3 (ref), v88 (copy), addTraceback (upval), publishQueuedMutations (upval)
					Count += 1
					v2, v90 = xpcall(v88, addTraceback)
					Count -= 1
					
					if Count == 0 then
						publishQueuedMutations()
					end
				end)
				
				if not v2 then
					error(v3, 0)
				end
				return
			elseif FFlagAppChatBatchMessageListPagePublicationModule then
				local function v2()
					-- upvalues: p3 (copy), p4 (copy), p5 (copy), appendMessagesInternal (upval), updatePagination (upval), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (upval)
					local AppendMessagesInternalResult, AppendMessagesInternalResult2 = appendMessagesInternal(p3, p4)
					updatePagination(p3, p5, p5 == nil or p5 == "")
					
					if FFlagAppChatIncrementalPaginationProjectionModule then
						publishMutation(p3, "AppendAndAdvanceCursor", p4, AppendMessagesInternalResult, AppendMessagesInternalResult2)
					end
				end
				
				SignalsExperimentalModule.batch(v2)
				
				return
			else
				local v2 = p3
				local v3 = p4
				local AppendMessagesInternalResult, AppendMessagesInternalResult2 = appendMessagesInternal(v2, v3)
				v3 = updatePagination
				v3(p3, p5, p5 == nil or p5 == "")
				v3 = FFlagAppChatIncrementalPaginationProjectionModule
				
				if v3 then
					v3 = publishMutation
					v3(p3, "AppendAndAdvanceCursor", p4, AppendMessagesInternalResult, AppendMessagesInternalResult2)
				end
			end
		end,
		clearConversation = function(Key)
			-- upvalues: clearConversationInternal (copy), FFlagAppChatGroupedVariantNeighbourIdsModule (upval), SignalsExperimentalModule (upval), Count (ref), addTraceback (copy), publishQueuedMutations (copy)
			local function v99()
				-- upvalues: clearConversationInternal (upval), Key (copy)
				clearConversationInternal(Key)
			end
			
			if not FFlagAppChatGroupedVariantNeighbourIdsModule then
				local v2: (any) -> () = clearConversationInternal
				local v3 = Key
				v2(v3)
				
				return
			end
			local v2 = nil
			local v3 = nil
			SignalsExperimentalModule.batch(function()
				-- upvalues: Count (upval), v2 (ref), v3 (ref), v99 (copy), addTraceback (upval), publishQueuedMutations (upval)
				Count += 1
				v2, v101 = xpcall(v99, addTraceback)
				Count -= 1
				
				if Count == 0 then
					publishQueuedMutations()
				end
			end)
			
			if not v2 then
				error(v3, 0)
			end
		end,
		clear = function()
			-- upvalues: clearInternal (copy), FFlagAppChatGroupedVariantNeighbourIdsModule (upval), SignalsExperimentalModule (upval), Count (ref), addTraceback (copy), publishQueuedMutations (copy)
			if not FFlagAppChatGroupedVariantNeighbourIdsModule then
				local v2: () -> () = clearInternal
				v2()
				
				return
			end
			local v2 = nil
			local v3 = nil
			SignalsExperimentalModule.batch(function()
				-- upvalues: Count (upval), v2 (ref), v3 (ref), clearInternal (copy), addTraceback (upval), publishQueuedMutations (upval)
				Count += 1
				v2, v106 = xpcall(clearInternal, addTraceback)
				Count -= 1
				
				if Count == 0 then
					publishQueuedMutations()
				end
			end)
			
			if not v2 then
				error(v3, 0)
			end
		end,
		getIndex = function(p3, p4, p5)
			-- upvalues: Proxy (copy)
			local ProxyResultEntry = Proxy(p5)[p3]
			
			return if ProxyResultEntry == nil then nil else ProxyResultEntry.messageIds:indexOf(p4)
		end,
		getOrderedIds = function(p3, p4)
			-- upvalues: Proxy (copy)
			local ProxyResultEntry = Proxy(p4)[p3]
			
			return if ProxyResultEntry == nil then {} else ProxyResultEntry.messageIds:values()
		end,
		getPrevId = function(p3, p4, p5)
			-- upvalues: Proxy (copy)
			local ProxyResultEntry = Proxy(p5)[p3]
			
			if ProxyResultEntry == nil then
				return nil
			else
				local IndexOfResult: number = ProxyResultEntry.messageIds:indexOf(p4)
				
				return if IndexOfResult == nil or IndexOfResult <= 1 then nil else ProxyResultEntry.messageIds:at(IndexOfResult - 1)
			end
		end,
		getNextId = function(p3, p4, p5)
			-- upvalues: Proxy (copy)
			local ProxyResultEntry = Proxy(p5)[p3]
			
			if ProxyResultEntry == nil then
				return nil
			else
				local IndexOfResult: number = ProxyResultEntry.messageIds:indexOf(p4)
				
				return if IndexOfResult == nil or ProxyResultEntry.messageIds:size() <= IndexOfResult then nil else ProxyResultEntry.messageIds:at(IndexOfResult + 1)
			end
		end,
		getNeighbourIds = function(Text, Text1, p3)
			-- upvalues: Proxy2 (copy), Proxy3 (copy)
			local Text2 = Text .. "\0" .. Text1
			
			return { prevId = Proxy2(p3)[Text2], nextId = Proxy3(p3)[Text2] }
		end,
		getMetadata = function(p3, p4)
			-- upvalues: Proxy1 (copy)
			return Proxy1(p4)[p3]
		end
	}
end