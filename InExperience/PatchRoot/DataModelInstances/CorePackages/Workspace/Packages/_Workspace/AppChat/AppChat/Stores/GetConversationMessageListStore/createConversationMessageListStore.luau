local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local createProxy = signalsExperimentalModule.createProxy
local arraySetModule = require(appChat.DataStructures.ArraySet)
local fFlagAppChatBatchMessageListPagePublicationModule = require(appChat.Flags.FFlagAppChatBatchMessageListPagePublication)
local fFlagAppChatIncrementalPaginationProjectionModule = require(appChat.Flags.FFlagAppChatIncrementalPaginationProjection)

local function _()
	-- upvalues: arraySetModule (ref)
	return { messageIds = arraySetModule.new({}) }
end

local _ = function()
	return {
		nextPageCursor = nil,
		isLoading = false,
		fetchedOldest = false
	}
end

return function()
	-- upvalues: createProxy (ref), signalsModule (ref), arraySetModule (ref), fFlagAppChatIncrementalPaginationProjectionModule (ref), cryoModule (ref), fFlagAppChatBatchMessageListPagePublicationModule (ref), signalsExperimentalModule (ref)
	local var1 = createProxy({})
	local var2 = createProxy({})
	local t = {}
	local t_1 = {}
	local var3 = 0
	
	local function getMutation(p1)
		-- upvalues: t (ref), signalsModule (copy), t_1 (ref)
		local var4 = t[p1]
		
		if var4 == nil then
			local var5, var6 = signalsModule.createSignal(nil)
			t[p1] = var5
			t_1[p1] = var6
			
			return var5
		end
		return var4
	end
	
	local function publishMutation(p1, p2, p3, p4, p5)
		-- upvalues: var3 (write), t (ref), signalsModule (copy), t_1 (ref)
		var3 += 1
		
		if t[p1] == nil then
			local var4, var5 = signalsModule.createSignal(nil)
			t[p1] = var4
			t_1[p1] = var5
		end
		t_1[p1]({
			operation = p2,
			messageIds = table.clone(p3),
			insertedIds = table.clone(p4),
			boundaryMessageId = p5,
			revision = var3
		})
	end
	
	local function _(p1)
		-- upvalues: var1 (ref), arraySetModule (copy)
		local var4 = var1[p1]
		
		return if var4 == nil then { messageIds = arraySetModule.new({}) } else var4
	end
	
	local _ = function(p1)
		-- upvalues: var2 (ref)
		local var4 = var2[p1]
		
		return if var4 == nil then {
			nextPageCursor = nil,
			isLoading = false,
			fetchedOldest = false
		} else var4
	end
	
	local function prependMessages(p1, p2)
		-- upvalues: var1 (ref), arraySetModule (copy), fFlagAppChatIncrementalPaginationProjectionModule (copy), publishMutation (ref)
		local var4 = var1[p1]
		local var5 = if var4 ~= nil then { messageIds = arraySetModule.new({}) } else var4
		local var6 = nil
		local t = {}
		
		if fFlagAppChatIncrementalPaginationProjectionModule then
			var6 = var5.messageIds:at(1)
			local t_1 = {}
			
			for i, v in p2 do
				if not var5.messageIds:has(v) and not t_1[v] then
					t_1[v] = true
					table.insert(t, v)
				end
			end
		end
		if var5.messageIds:prependAll(p2) then
			var1[p1] = table.clone(var5)
			
			if fFlagAppChatIncrementalPaginationProjectionModule then
				publishMutation(p1, "Prepend", p2, t, var6)
			end
			return
		elseif fFlagAppChatIncrementalPaginationProjectionModule and #p2 > 0 then
			publishMutation(p1, "Prepend", p2, {}, nil)
		end
	end
	
	local function appendMessagesInternal(p3, p4)
		-- upvalues: var1 (ref), arraySetModule (copy)
		local var7 = var1[p3]
		local var8 = if var7 ~= nil then { messageIds = arraySetModule.new({}) } else var7
		local var9 = var8.messageIds:at(var8.messageIds:size())
		local t = {}
		
		for i, v in p4 do
			if var8.messageIds:add(v) then
				table.insert(t, v)
			end
		end
		if #t > 0 then
			var1[p3] = table.clone(var8)
		end
		return t, var9
	end
	
	local function appendMessages(p5, p6)
		-- upvalues: appendMessagesInternal (ref), fFlagAppChatIncrementalPaginationProjectionModule (copy), publishMutation (ref)
		local var10, var11 = appendMessagesInternal(p5, p6)
		
		if fFlagAppChatIncrementalPaginationProjectionModule and #p6 > 0 then
			publishMutation(p5, "Append", p6, var10, var11)
		end
	end
	
	local function removeMessage(p5, p6)
		-- upvalues: var1 (ref), fFlagAppChatIncrementalPaginationProjectionModule (copy), publishMutation (ref)
		local var10 = var1[p5]
		
		if var10 == nil then return end
		if not var10.messageIds:remove(p6) then return end
		var1[p5] = table.clone(var10)
		
		if fFlagAppChatIncrementalPaginationProjectionModule then
			publishMutation(p5, "Remove", { p6 }, {}, nil)
		end
	end
	
	local function publishMessageUpdates(p5, p6)
		-- upvalues: publishMutation (ref)
		if #p6 > 0 then
			publishMutation(p5, "Update", p6, {}, nil)
		end
	end
	
	local function setLoading(value, p5)
		-- upvalues: var2 (ref), cryoModule (copy)
		local var10 = var2[value]
		var2[value] = cryoModule.Dictionary.union(if var10 ~= nil then {
			nextPageCursor = nil,
			isLoading = false,
			fetchedOldest = false
		} else var10, { isLoading = p5 })
	end
	
	local function updatePagination(p5, p6, p7)
		-- upvalues: var2 (ref), cryoModule (copy)
		local var10 = var2[p5]
		local var11 = if var10 ~= nil then {
			nextPageCursor = nil,
			isLoading = false,
			fetchedOldest = false
		} else var10
		var2[p5] = cryoModule.Dictionary.union(var11, {
			isLoading = false,
			nextPageCursor = if p6 and p6 ~= "" then p6 else var11.nextPageCursor,
			fetchedOldest = p7
		})
	end
	
	local _ = function(p5, p6, p7)
		-- upvalues: appendMessagesInternal (ref), updatePagination (ref), fFlagAppChatIncrementalPaginationProjectionModule (copy), publishMutation (ref)
		local var10, var11 = appendMessagesInternal(p5, p6)
		updatePagination(p5, p7, if p7 ~= nil then p7 == "" else true)
		
		if fFlagAppChatIncrementalPaginationProjectionModule then
			publishMutation(p5, "AppendAndAdvanceCursor", p6, var10, var11)
		end
	end
	
	return {
		conversations = var1,
		metadata = var2,
		getMutation = getMutation,
		prependMessages = prependMessages,
		appendMessages = appendMessages,
		removeMessage = removeMessage,
		publishMessageUpdates = publishMessageUpdates,
		setLoading = setLoading,
		updatePagination = updatePagination,
		receivePage = function(p5, p6, p7)
			-- upvalues: fFlagAppChatBatchMessageListPagePublicationModule (copy), signalsExperimentalModule (copy), appendMessagesInternal (ref), updatePagination (ref), fFlagAppChatIncrementalPaginationProjectionModule (copy), publishMutation (ref)
			if fFlagAppChatBatchMessageListPagePublicationModule then
				signalsExperimentalModule.batch(function()
					-- upvalues: p5 (ref), p6 (ref), p7 (ref), appendMessagesInternal (copy), updatePagination (copy), fFlagAppChatIncrementalPaginationProjectionModule (copy), publishMutation (copy)
					local var10, var11 = appendMessagesInternal(p5, p6)
					updatePagination(p5, p7, if p7 ~= nil then p7 == "" else true)
					
					if fFlagAppChatIncrementalPaginationProjectionModule then
						publishMutation(p5, "AppendAndAdvanceCursor", p6, var10, var11)
					end
				end)
				
				return
			end
			local var10, var11 = appendMessagesInternal(p5, p6)
			updatePagination(p5, p7, if p7 ~= nil then p7 == "" else true)
			
			if fFlagAppChatIncrementalPaginationProjectionModule then
				publishMutation(p5, "AppendAndAdvanceCursor", p6, var10, var11)
			end
		end,
		clearConversation = function(p5)
			-- upvalues: var1 (ref), var2 (ref), fFlagAppChatIncrementalPaginationProjectionModule (copy), publishMutation (ref)
			var1[p5] = nil
			var2[p5] = nil
			
			if fFlagAppChatIncrementalPaginationProjectionModule then
				publishMutation(p5, "Reset", {}, {}, nil)
			end
		end,
		clear = function()
			-- upvalues: var1 (ref), var2 (ref), fFlagAppChatIncrementalPaginationProjectionModule (copy), t (ref), publishMutation (ref)
			local t_1 = {}
			local t_2 = {}
			
			for i in var1 do
				table.insert(t_1, i)
				t_2[i] = true
				var1[i] = nil
			end
			for i_1 in var2 do
				var2[i_1] = nil
			end
			if fFlagAppChatIncrementalPaginationProjectionModule then
				for i_2 in t do
					if not t_2[i_2] then
						table.insert(t_1, i_2)
					end
				end
				for i_3, v in t_1 do
					publishMutation(v, "Reset", {}, {}, nil)
				end
			end
		end,
		getIndex = function(p5, p6, p7)
			-- upvalues: var1 (ref)
			local var10 = var1(p7)[p5]
			
			return if var10 == nil then nil else var10.messageIds:indexOf(p6)
		end,
		getOrderedIds = function(p5, p6)
			-- upvalues: var1 (ref)
			local var10 = var1(p6)[p5]
			
			return if var10 == nil then {} else var10.messageIds:values()
		end,
		getPrevId = function(p5, p6, p7)
			-- upvalues: var1 (ref)
			local var10 = var1(p7)[p5]
			
			if var10 == nil then
				return nil
			end
			local var11 = var10.messageIds:indexOf(p6)
			
			return if var11 == nil or var11 <= 1 then nil else var10.messageIds:at(var11 - 1)
		end,
		getNextId = function(p5, p6, p7)
			-- upvalues: var1 (ref)
			local var10 = var1(p7)[p5]
			
			if var10 == nil then
				return nil
			end
			local var11 = var10.messageIds:indexOf(p6)
			
			return if var11 == nil or var10.messageIds:size() <= var11 then nil else var10.messageIds:at(var11 + 1)
		end,
		getMetadata = function(p5, p6)
			-- upvalues: var2 (ref)
			return var2(p6)[p5]
		end
	}
end