local parent = script:FindFirstAncestor("FriendsChat").Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local userProfileStore = require(parent.UserProfiles).Stores.UserProfileStore
local getConversationMessageStoreModule = require(parent.AppChat.GetConversationMessageStore)
local getConversationStoreModule = require(parent.AppChat.GetConversationStore)
local conversationModule = require(parent.AppChat.Conversation)
local classifyMessageModule = require(script.Parent.classifyMessage)
local buildRowDisplayModule = require(script.Parent.buildRowDisplay)
local getLocalUserIdModule = require(script.Parent.Parent.Parent.Utils.getLocalUserId)
local t = {}

local function _(p1)
	local var1 = if p1 then p1.created_at else nil
	
	if var1 == nil then
		return 1e999
	end
	local dateTime = DateTime.fromIsoDate(var1)
	
	if dateTime then
		return dateTime.UnixTimestampMillis
	end
	local var2 = tonumber(var1)
	
	return if var2 then var2 * 1000 else 1e999
end

local function resolveProfileNameInfo(p1, p2)
	if p1 == nil or p1.names == nil then
		return { name = nil, username = nil }
	end
	local getCombinedName = p1.names.getCombinedName
	local getDisplayName = p1.names.getDisplayName
	local getUsername = p1.names.getUsername
	local var1 = if getUsername then getUsername(p2) else nil
	local var2 = if getCombinedName then getCombinedName(p2) else nil
	local var3 = if getDisplayName then getDisplayName(p2) else nil
	
	return {
		name = if var2 ~= nil and var2 ~= "" then if var3 == nil or var3 == "" then var1 else var3 else var2,
		username = var1
	}
end

local function resolveNameInfos(p1, p2)
	-- upvalues: userProfileStore (ref), resolveProfileNameInfo (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in p1 do
		if not t_1[v] then
			t_1[v] = true
			table.insert(t, v)
			table.insert(t_2, tostring(v))
		end
	end
	local var1 = userProfileStore.get().fetchNamesByUserIds(t_2)(p2)
	local var2 = if var1 and var1.data then var1.data else {}
	local t_3 = {}
	
	for i_1, v_1 in t do
		t_3[v_1] = resolveProfileNameInfo(var2[i_1], p2)
	end
	return t_3
end

return function(p3, p4)
	-- upvalues: signalsModule (ref), getConversationStoreModule (ref), conversationModule (ref), resolveNameInfos (ref), getLocalUserIdModule (ref), getConversationMessageStoreModule (ref), t (ref), classifyMessageModule (ref), cryoModule (ref), buildRowDisplayModule (ref)
	local t_1 = {}
	local t_2 = {}
	local var3 = signalsModule.createComputed(function(p5)
		-- upvalues: p4 (ref), getConversationStoreModule (copy), conversationModule (copy)
		if p4 == nil then
			return false
		end
		local conversation = getConversationStoreModule(p5).getConversation(p4, p5)
		
		return conversation ~= nil and conversation.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
	end)
	
	local function resolveForRowSpec(p5, p6)
		-- upvalues: resolveNameInfos (copy), getLocalUserIdModule (copy), var3 (ref)
		return if p5.kind == "userText" or p5.kind == "hiddenUser" then {
			namesByUserId = resolveNameInfos({ p5.senderUserId }, p6)
		} elseif p5.kind == "replyHeader" then {
			namesByUserId = resolveNameInfos({ p5.senderUserId, p5.repliedToUserId }, p6),
			localUserId = getLocalUserIdModule(),
			isGroup = var3(p6)
		} else {}
	end
	
	local function _(p5)
		-- upvalues: t_1 (ref), signalsModule (copy), getConversationMessageStoreModule (copy), t (copy), classifyMessageModule (copy)
		local var4 = t_1[p5]
		
		if var4 == nil then
			var4 = signalsModule.createComputed(function(p6)
				-- upvalues: getConversationMessageStoreModule (copy), p5 (ref), t (copy), classifyMessageModule (copy)
				local message = getConversationMessageStoreModule(p6).getMessage(p5, p6)
				
				return if message == nil then t else classifyMessageModule(message)
			end)
			t_1[p5] = var4
		end
		return var4
	end
	
	local _ = function(p5, p6)
		-- upvalues: t_2 (ref), getConversationMessageStoreModule (copy)
		local var4 = t_2[p5]
		
		if var4 ~= nil then
			return var4
		end
		local message = getConversationMessageStoreModule(p6).getMessage(p5, p6)
		
		if message == nil then
			return 1e999
		end
		local var5
		local var6 = if message then message.created_at else nil
		
		if var6 == nil then
			var5 = 1e999
		else
			local dateTime = DateTime.fromIsoDate(var6)
			
			if dateTime then
				var5 = dateTime.UnixTimestampMillis
			else
				local var7 = tonumber(var6)
				var5 = if var7 then var7 * 1000 else 1e999
			end
		end
		t_2[p5] = var5
		
		return var5
	end
	
	local var4 = signalsModule.createComputed(function(p5)
		-- upvalues: p3 (ref), t_1 (ref), signalsModule (copy), getConversationMessageStoreModule (copy), t (copy), classifyMessageModule (copy), t_2 (ref)
		local var5 = p3(p5)
		local t_3 = {}
		local var6 = 0
		
		for i, v in var5 do
			local var7 = t_1[v]
			
			if var7 == nil then
				var7 = signalsModule.createComputed(function(p6)
					-- upvalues: getConversationMessageStoreModule (copy), v (ref), t (copy), classifyMessageModule (copy)
					local message = getConversationMessageStoreModule(p6).getMessage(v, p6)
					
					return if message == nil then t else classifyMessageModule(message)
				end)
				t_1[v] = var7
			end
			local count = #var7(p5)
			
			if count ~= 0 then
				if var6 + count > 50 then break end
				local var8
				var6 += count
				local t_4 = { sourceId = v, count = count }
				local var9 = t_2[v]
				
				if var9 == nil then
					local message = getConversationMessageStoreModule(p5).getMessage(v, p5)
					
					if message == nil then
						var8 = 1e999
					else
						local var10
						local var11 = if message then message.created_at else nil
						
						if var11 == nil then
							var10 = 1e999
						else
							local dateTime = DateTime.fromIsoDate(var11)
							
							if dateTime then
								var10 = dateTime.UnixTimestampMillis
							else
								local var12 = tonumber(var11)
								var10 = if var12 then var12 * 1000 else 1e999
							end
						end
						t_2[v] = var10
						var8 = var10
					end
				else
					var8 = var9
				end
				t_4.sortTime = var8
				table.insert(t_3, t_4)
			end
		end
		table.sort(t_3, function(p6, p7)
			return if p6.sortTime == p7.sortTime then p6.sourceId < p7.sourceId else p6.sortTime < p7.sortTime
		end)
		local t_4 = {}
		local t_5 = {}
		
		for i_1, v_1 in t_3 do
			for i_2 = 1, v_1.count do
				local sourceId = `{v_1.sourceId}_{i_2}`
				table.insert(t_4, sourceId)
				t_5[sourceId] = { messageId = v_1.sourceId, rowIndex = i_2 }
			end
		end
		return { idList = t_4, idToHandle = t_5 }
	end)
	
	return {
		getDisplayIds = signalsModule.createComputed(function(p6)
			-- upvalues: var4 (ref)
			return var4(p6).idList
		end, cryoModule.List.equals),
		getDisplayFromId = function(p6, p7, p8)
			-- upvalues: var4 (ref), t_1 (ref), signalsModule (copy), getConversationMessageStoreModule (copy), t (copy), classifyMessageModule (copy), buildRowDisplayModule (copy), resolveForRowSpec (ref)
			if p6 == nil then
				return nil
			end
			local var13 = var4(false).idToHandle[p6]
			
			if var13 == nil then
				return nil
			end
			local messageId = var13.messageId
			local var14 = t_1[messageId]
			
			if var14 == nil then
				var14 = signalsModule.createComputed(function(p9)
					-- upvalues: getConversationMessageStoreModule (copy), messageId (ref), t (copy), classifyMessageModule (copy)
					local message = getConversationMessageStoreModule(p9).getMessage(messageId, p9)
					
					return if message == nil then t else classifyMessageModule(message)
				end)
				t_1[messageId] = var14
			end
			local rowIndex = var14(p7)[var13.rowIndex]
			
			return if rowIndex == nil then nil else buildRowDisplayModule(rowIndex, resolveForRowSpec(rowIndex, p7), p8 or {})
		end,
		getMessageIdFromDisplayId = function(p6)
			-- upvalues: var4 (ref)
			if p6 == nil then
				return nil
			end
			local var13 = var4(false).idToHandle[p6]
			
			return if var13 then var13.messageId else nil
		end
	}
end