local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local CreateProxyFunction = SignalsExperimentalModule.createProxy
local ArraySetModule = require(AppChat.DataStructures.ArraySet)
local FFlagAppChatBatchMessageListPagePublicationModule = require(AppChat.Flags.FFlagAppChatBatchMessageListPagePublication)
local FFlagAppChatIncrementalPaginationProjectionModule = require(AppChat.Flags.FFlagAppChatIncrementalPaginationProjection)

local function _() --[[ Line: 109 | Named "newConversationOrdering" ]]
	-- upvalues: ArraySetModule (copy)
	return { messageIds = ArraySetModule.new({}) }
end

local _ = function() --[[ Line: 115 | Named "newMessagePaginationMetadata" ]]
	return {
		nextPageCursor = nil,
		isLoading = false,
		fetchedOldest = false
	}
end

return function() --[[ Line: 123 | Named "createConversationMessageListStore" ]]
	-- upvalues: CreateProxyFunction (copy), SignalsModule (copy), ArraySetModule (copy), FFlagAppChatIncrementalPaginationProjectionModule (copy), CryoModule (copy), FFlagAppChatBatchMessageListPagePublicationModule (copy), SignalsExperimentalModule (copy)
	local Proxy = CreateProxyFunction({})
	local Proxy1 = CreateProxyFunction({})
	local t = {}
	local t1 = {}
	local Revision = 0
	
	local function publishMutation(Key, Operation, Tbl, Tbl1, BoundaryMessageId) --[[ Line: 146 ]]
		-- upvalues: Revision (ref), t (copy), SignalsModule (upval), t1 (copy)
		Revision += 1
		
		if t[Key] == nil then
			t[Key], t1[Key] = SignalsModule.createSignal(nil)
		end
		t1[Key]({
			operation = Operation,
			messageIds = table.clone(Tbl),
			insertedIds = table.clone(Tbl1),
			boundaryMessageId = BoundaryMessageId,
			revision = Revision
		})
	end
	
	local function _(p1) --[[ Line: 164 | Named "getOrDefaultOrdering" ]]
		-- upvalues: Proxy (copy), ArraySetModule (upval)
		local ProxyEntry = Proxy[p1]
		
		return if ProxyEntry == nil then { messageIds = ArraySetModule.new({}) } else ProxyEntry
	end
	
	local _ = function(p1) --[[ Line: 172 | Named "getOrDefaultMetadata" ]]
		-- upvalues: Proxy1 (copy)
		local ProxyEntry = Proxy1[p1]
		
		return if ProxyEntry == nil then {
			nextPageCursor = nil,
			isLoading = false,
			fetchedOldest = false
		} else ProxyEntry
	end
	
	local function appendMessagesInternal(Key, List) --[[ Line: 213 ]]
		-- upvalues: Proxy (copy), ArraySetModule (upval)
		local ProxyEntry = Proxy[Key]
		local Config = if ProxyEntry == nil then { messageIds = ArraySetModule.new({}) } else ProxyEntry
		local v1 = Config.messageIds:at(Config.messageIds:size())
		local List1 = {}
		
		for _, value in List do
			if Config.messageIds:add(value) then
				table.insert(List1, value)
			end
		end
		if #List1 > 0 then
			Proxy[Key] = table.clone(Config)
		end
		return List1, v1
	end
	
	local function updatePagination(Key, p1, FetchedOldest) --[[ Line: 268 ]]
		-- upvalues: Proxy1 (copy), CryoModule (upval)
		local ProxyEntry = Proxy1[Key]
		local Config = if ProxyEntry == nil then {
			nextPageCursor = nil,
			isLoading = false,
			fetchedOldest = false
		} else ProxyEntry
		Proxy1[Key] = CryoModule.Dictionary.union(Config, {
			isLoading = false,
			nextPageCursor = if p1 and p1 ~= "" then p1 else Config.nextPageCursor,
			fetchedOldest = FetchedOldest
		})
	end
	
	local _ = function(p1, p2, p3) --[[ Line: 277 | Named "receivePageInternal" ]]
		-- upvalues: appendMessagesInternal (copy), updatePagination (copy), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (copy)
		local AppendMessagesInternalResult, AppendMessagesInternalResult2 = appendMessagesInternal(p1, p2)
		updatePagination(p1, p3, p3 == nil or p3 == "")
		
		if FFlagAppChatIncrementalPaginationProjectionModule then
			publishMutation(p1, "AppendAndAdvanceCursor", p2, AppendMessagesInternalResult, AppendMessagesInternalResult2)
		end
	end
	
	return {
		conversations = Proxy,
		metadata = Proxy1,
		getMutation = function(Key) --[[ Line: 135 ]]
			-- upvalues: t (copy), SignalsModule (upval), t1 (copy)
			local Entry = t[Key]
			
			if Entry == nil then
				local Signal, Signal2 = SignalsModule.createSignal(nil)
				t[Key] = Signal
				t1[Key] = Signal2
				
				return Signal
			else
				return Entry
			end
		end,
		prependMessages = function(Key, List) --[[ Line: 182 ]]
			-- upvalues: Proxy (copy), ArraySetModule (upval), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (copy)
			local ProxyEntry = Proxy[Key]
			local Config = if ProxyEntry == nil then { messageIds = ArraySetModule.new({}) } else ProxyEntry
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
				
				if FFlagAppChatIncrementalPaginationProjectionModule then
					publishMutation(Key, "Prepend", List, List1, BoundaryMessageId)
				end
				return
			elseif FFlagAppChatIncrementalPaginationProjectionModule and #List > 0 then
				publishMutation(Key, "Prepend", List, {}, nil)
			end
		end,
		appendMessages = function(p1, p2) --[[ Line: 231 ]]
			-- upvalues: appendMessagesInternal (copy), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (copy)
			local AppendMessagesInternalResult, AppendMessagesInternalResult2 = appendMessagesInternal(p1, p2)
			
			if FFlagAppChatIncrementalPaginationProjectionModule and #p2 > 0 then
				publishMutation(p1, "Append", p2, AppendMessagesInternalResult, AppendMessagesInternalResult2)
			end
		end,
		removeMessage = function(Key, p1) --[[ Line: 239 ]]
			-- upvalues: Proxy (copy), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (copy)
			local ProxyEntry = Proxy[Key]
			
			if ProxyEntry == nil then return end
			if not ProxyEntry.messageIds:remove(p1) then return end
			Proxy[Key] = table.clone(ProxyEntry)
			
			if FFlagAppChatIncrementalPaginationProjectionModule then
				publishMutation(Key, "Remove", { p1 }, {}, nil)
			end
		end,
		publishMessageUpdates = function(p1, p2) --[[ Line: 253 ]]
			-- upvalues: publishMutation (copy)
			if #p2 > 0 then
				publishMutation(p1, "Update", p2, {}, nil)
			end
		end,
		setLoading = function(Key, IsLoading) --[[ Line: 260 ]]
			-- upvalues: Proxy1 (copy), CryoModule (upval)
			local ProxyEntry = Proxy1[Key]
			Proxy1[Key] = CryoModule.Dictionary.union(if ProxyEntry == nil then {
				nextPageCursor = nil,
				isLoading = false,
				fetchedOldest = false
			} else ProxyEntry, { isLoading = IsLoading })
		end,
		updatePagination = updatePagination,
		receivePage = function(p1, p2, p3) --[[ Line: 286 ]]
			-- upvalues: FFlagAppChatBatchMessageListPagePublicationModule (upval), SignalsExperimentalModule (upval), appendMessagesInternal (copy), updatePagination (copy), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (copy)
			if FFlagAppChatBatchMessageListPagePublicationModule then
				SignalsExperimentalModule.batch(function() --[[ Line: 288 ]]
					-- upvalues: p1 (copy), p2 (copy), p3 (copy), appendMessagesInternal (upval), updatePagination (upval), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (upval)
					local AppendMessagesInternalResult, AppendMessagesInternalResult2 = appendMessagesInternal(p1, p2)
					updatePagination(p1, p3, p3 == nil or p3 == "")
					
					if FFlagAppChatIncrementalPaginationProjectionModule then
						publishMutation(p1, "AppendAndAdvanceCursor", p2, AppendMessagesInternalResult, AppendMessagesInternalResult2)
					end
				end)
				
				return
			end
			local AppendMessagesInternalResult, AppendMessagesInternalResult2 = appendMessagesInternal(p1, p2)
			updatePagination(p1, p3, p3 == nil or p3 == "")
			
			if FFlagAppChatIncrementalPaginationProjectionModule then
				publishMutation(p1, "AppendAndAdvanceCursor", p2, AppendMessagesInternalResult, AppendMessagesInternalResult2)
			end
		end,
		clearConversation = function(Key) --[[ Line: 296 ]]
			-- upvalues: Proxy (copy), Proxy1 (copy), FFlagAppChatIncrementalPaginationProjectionModule (upval), publishMutation (copy)
			Proxy[Key] = nil
			Proxy1[Key] = nil
			
			if FFlagAppChatIncrementalPaginationProjectionModule then
				publishMutation(Key, "Reset", {}, {}, nil)
			end
		end,
		clear = function() --[[ Line: 304 ]]
			-- upvalues: Proxy (copy), Proxy1 (copy), FFlagAppChatIncrementalPaginationProjectionModule (upval), t (copy), publishMutation (copy)
			local List = {}
			local t2 = {}
			
			for i in Proxy do
				table.insert(List, i)
				t2[i] = true
				Proxy[i] = nil
			end
			for i1 in Proxy1 do
				Proxy1[i1] = nil
			end
			if FFlagAppChatIncrementalPaginationProjectionModule then
				for i2 in t do
					if not t2[i2] then
						table.insert(List, i2)
					end
				end
				for _, value in List do
					publishMutation(value, "Reset", {}, {}, nil)
				end
			end
		end,
		getIndex = function(p1, p2, p3) --[[ Line: 327 ]]
			-- upvalues: Proxy (copy)
			local ProxyResultEntry = Proxy(p3)[p1]
			
			return if ProxyResultEntry == nil then nil else ProxyResultEntry.messageIds:indexOf(p2)
		end,
		getOrderedIds = function(p1, p2) --[[ Line: 335 ]]
			-- upvalues: Proxy (copy)
			local ProxyResultEntry = Proxy(p2)[p1]
			
			return if ProxyResultEntry == nil then {} else ProxyResultEntry.messageIds:values()
		end,
		getPrevId = function(p1, p2, p3) --[[ Line: 343 ]]
			-- upvalues: Proxy (copy)
			local ProxyResultEntry = Proxy(p3)[p1]
			
			if ProxyResultEntry == nil then
				return nil
			else
				local IndexOfResult: number = ProxyResultEntry.messageIds:indexOf(p2)
				
				return if IndexOfResult == nil or IndexOfResult <= 1 then nil else ProxyResultEntry.messageIds:at(IndexOfResult - 1)
			end
		end,
		getNextId = function(p1, p2, p3) --[[ Line: 355 ]]
			-- upvalues: Proxy (copy)
			local ProxyResultEntry = Proxy(p3)[p1]
			
			if ProxyResultEntry == nil then
				return nil
			else
				local IndexOfResult: number = ProxyResultEntry.messageIds:indexOf(p2)
				
				return if IndexOfResult == nil or ProxyResultEntry.messageIds:size() <= IndexOfResult then nil else ProxyResultEntry.messageIds:at(IndexOfResult + 1)
			end
		end,
		getMetadata = function(p1, p2) --[[ Line: 367 ]]
			-- upvalues: Proxy1 (copy)
			return Proxy1(p2)[p1]
		end
	}
end