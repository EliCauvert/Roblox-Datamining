local parent = script:FindFirstAncestor("FriendsChat").Parent
local signalsModule = require(parent.Signals)
local userProfileStore = require(parent.UserProfiles).Stores.UserProfileStore
local getConversationMessageStoreModule = require(parent.AppChat.GetConversationMessageStore)
local getConversationStoreModule = require(parent.AppChat.GetConversationStore)
local conversationModule = require(parent.AppChat.Conversation)
local classifyMessageModule = require(script.Parent.classifyMessage)
local buildRowDisplayModule = require(script.Parent.buildRowDisplay)
local getLocalUserIdModule = require(script.Parent.Parent.Parent.Utils.getLocalUserId)
local t = {}

local function shallowArrayEquals(p0, p1) --[[ line: 52 ]]
	if p0 == p1 then
		return true
	elseif p0 == nil or p1 == nil or #p0 ~= #p1 then
		return false
	end
	for i, v in p0 do
		if p1[i] ~= v then
			return false
		end
	end
	return true
end

local function resolveProfileNameInfo(p2, p3) --[[ line: 70 ]]
	if p2 == nil or p2.names == nil then
		return { name = nil, username = nil }
	end
	local getCombinedName = p2.names.getCombinedName
	local getDisplayName = p2.names.getDisplayName
	local getUsername = p2.names.getUsername
	local var11 = if getUsername then getUsername(p3) else nil
	local var12 = if getCombinedName then getCombinedName(p3) else nil
	local var13 = if getDisplayName then getDisplayName(p3) else nil
	
	return {
		name = if var12 ~= nil and var12 ~= "" then if var13 == nil or var13 == "" then var11 else var13 else var12,
		username = var11
	}
end

local function resolveNameInfos(p4, p5) --[[ line: 98 ]]
	-- upvalues: userProfileStore (ref), resolveProfileNameInfo (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in p4 do
		if not t_1[v] then
			t_1[v] = true
			table.insert(t, v)
			table.insert(t_2, tostring(v))
		end
	end
	local var17 = userProfileStore.get().fetchNamesByUserIds(t_2)(p5)
	local var18 = if var17 and var17.data then var17.data else {}
	local t_3 = {}
	
	for i_1, v_1 in t do
		t_3[v_1] = resolveProfileNameInfo(var18[i_1], p5)
	end
	return t_3
end

return function(p6, p7) --[[ line: 120 | named "createMessageDisplayStore" ]]
	-- upvalues: signalsModule (ref), getConversationStoreModule (ref), conversationModule (ref), resolveNameInfos (ref), getLocalUserIdModule (ref), getConversationMessageStoreModule (ref), t (ref), classifyMessageModule (ref), shallowArrayEquals (ref), buildRowDisplayModule (ref)
	local t_1 = {}
	local var21 = signalsModule.createComputed(function(p8) --[[ line: 126 ]]
		-- upvalues: p7 (ref), getConversationStoreModule (copy), conversationModule (copy)
		if p7 == nil then
			return false
		end
		local conversation = getConversationStoreModule(p8).getConversation(p7, p8)
		
		return conversation ~= nil and conversation.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
	end)
	
	local function resolveForRowSpec(p9, p10) --[[ line: 135 ]]
		-- upvalues: resolveNameInfos (copy), getLocalUserIdModule (copy), var21 (ref)
		return if p9.kind == "userText" or p9.kind == "hiddenUser" then {
			namesByUserId = resolveNameInfos({ p9.senderUserId }, p10)
		} elseif p9.kind == "replyHeader" then {
			namesByUserId = resolveNameInfos({ p9.senderUserId, p9.repliedToUserId }, p10),
			localUserId = getLocalUserIdModule(),
			isGroup = var21(p10)
		} else {}
	end
	
	local function _(p11) --[[ line: 149 | named "getMessageRowSpecs" ]]
		-- upvalues: t_1 (ref), signalsModule (copy), getConversationMessageStoreModule (copy), t (copy), classifyMessageModule (copy)
		local var25 = t_1[p11]
		
		if var25 == nil then
			var25 = signalsModule.createComputed(function(p12) --[[ line: 152 ]]
				-- upvalues: getConversationMessageStoreModule (copy), p11 (ref), t (copy), classifyMessageModule (copy)
				local message = getConversationMessageStoreModule(p12).getMessage(p11, p12)
				
				return if message == nil then t else classifyMessageModule(message)
			end)
			t_1[p11] = var25
		end
		return var25
	end
	
	local var23 = signalsModule.createComputed(function(p13) --[[ line: 167 ]]
		-- upvalues: p6 (ref), t_1 (ref), signalsModule (copy), getConversationMessageStoreModule (copy), t (copy), classifyMessageModule (copy)
		local count
		local var27 = p6(p13)
		local t_2 = {}
		local var29 = 0
		
		for i, v in var27 do
			local var30 = t_1[v]
			
			if var30 == nil then
				var30 = signalsModule.createComputed(function(p14) --[[ line: 152 ]]
					-- upvalues: getConversationMessageStoreModule (copy), v (ref), t (copy), classifyMessageModule (copy)
					local message = getConversationMessageStoreModule(p14).getMessage(v, p14)
					
					return if message == nil then t else classifyMessageModule(message)
				end)
				t_1[v] = var30
			end
			count = #var30(p13)
			
			if count ~= 0 then
				if var29 + count > 50 then break end
				var29 += count
				table.insert(t_2, { sourceId = v, count = count })
			end
		end
		local t_3 = {}
		local t_4 = {}
		
		for i_2 = #t_2, 1, -1 do
			count = t_2[i_2]
			
			for i_1 = 1, count.count do
				local sourceId = `{count.sourceId}_{i_1}`
				table.insert(t_3, sourceId)
				t_4[sourceId] = { messageId = count.sourceId, rowIndex = i_1 }
			end
		end
		return { idList = t_3, idToHandle = t_4 }
	end)
	
	return {
		getDisplayIds = signalsModule.createComputed(function(p15) --[[ line: 199 ]]
			-- upvalues: var23 (ref)
			return var23(p15).idList
		end, shallowArrayEquals),
		getDisplayFromId = function(p16, p17, p18) --[[ line: 207 ]]
			-- upvalues: var23 (ref), t_1 (ref), signalsModule (copy), getConversationMessageStoreModule (copy), t (copy), classifyMessageModule (copy), buildRowDisplayModule (copy), resolveForRowSpec (ref)
			if p16 == nil then
				return nil
			end
			local var35 = var23(false).idToHandle[p16]
			
			if var35 == nil then
				return nil
			end
			local messageId = var35.messageId
			local var36 = t_1[messageId]
			
			if var36 == nil then
				var36 = signalsModule.createComputed(function(p19) --[[ line: 152 ]]
					-- upvalues: getConversationMessageStoreModule (copy), messageId (ref), t (copy), classifyMessageModule (copy)
					local message = getConversationMessageStoreModule(p19).getMessage(messageId, p19)
					
					return if message == nil then t else classifyMessageModule(message)
				end)
				t_1[messageId] = var36
			end
			local rowIndex = var36(p17)[var35.rowIndex]
			
			return if rowIndex == nil then nil else buildRowDisplayModule(rowIndex, resolveForRowSpec(rowIndex, p17), p18 or {})
		end
	}
end