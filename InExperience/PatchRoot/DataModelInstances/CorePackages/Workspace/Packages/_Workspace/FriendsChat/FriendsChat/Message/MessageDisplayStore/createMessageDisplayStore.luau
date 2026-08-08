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

local function _(p0) --[[ line: 57 | named "messageSortTime" ]]
	local var11 = if p0 then p0.created_at else nil
	
	if var11 == nil then
		return 1e999
	end
	local dateTime = DateTime.fromIsoDate(var11)
	
	if dateTime then
		return dateTime.UnixTimestampMillis
	end
	local var13 = tonumber(var11)
	
	return if var13 then var13 * 1000 else 1e999
end

local function shallowArrayEquals(p1, p2) --[[ line: 73 ]]
	if p1 == p2 then
		return true
	elseif p1 == nil or p2 == nil or #p1 ~= #p2 then
		return false
	end
	for i, v in p1 do
		if p2[i] ~= v then
			return false
		end
	end
	return true
end

local function resolveProfileNameInfo(p3, p4) --[[ line: 91 ]]
	if p3 == nil or p3.names == nil then
		return { name = nil, username = nil }
	end
	local getCombinedName = p3.names.getCombinedName
	local getDisplayName = p3.names.getDisplayName
	local getUsername = p3.names.getUsername
	local var14 = if getUsername then getUsername(p4) else nil
	local var15 = if getCombinedName then getCombinedName(p4) else nil
	local var16 = if getDisplayName then getDisplayName(p4) else nil
	
	return {
		name = if var15 ~= nil and var15 ~= "" then if var16 == nil or var16 == "" then var14 else var16 else var15,
		username = var14
	}
end

local function resolveNameInfos(p5, p6) --[[ line: 119 ]]
	-- upvalues: userProfileStore (ref), resolveProfileNameInfo (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in p5 do
		if not t_1[v] then
			t_1[v] = true
			table.insert(t, v)
			table.insert(t_2, tostring(v))
		end
	end
	local var20 = userProfileStore.get().fetchNamesByUserIds(t_2)(p6)
	local var21 = if var20 and var20.data then var20.data else {}
	local t_3 = {}
	
	for i_1, v_1 in t do
		t_3[v_1] = resolveProfileNameInfo(var21[i_1], p6)
	end
	return t_3
end

return function(p7, p8) --[[ line: 141 | named "createMessageDisplayStore" ]]
	-- upvalues: signalsModule (ref), getConversationStoreModule (ref), conversationModule (ref), resolveNameInfos (ref), getLocalUserIdModule (ref), getConversationMessageStoreModule (ref), t (ref), classifyMessageModule (ref), shallowArrayEquals (ref), buildRowDisplayModule (ref)
	local t_1 = {}
	local t_2 = {}
	local var25 = signalsModule.createComputed(function(p9) --[[ line: 148 ]]
		-- upvalues: p8 (ref), getConversationStoreModule (copy), conversationModule (copy)
		if p8 == nil then
			return false
		end
		local conversation = getConversationStoreModule(p9).getConversation(p8, p9)
		
		return conversation ~= nil and conversation.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
	end)
	
	local function resolveForRowSpec(p10, p11) --[[ line: 157 ]]
		-- upvalues: resolveNameInfos (copy), getLocalUserIdModule (copy), var25 (ref)
		return if p10.kind == "userText" or p10.kind == "hiddenUser" then {
			namesByUserId = resolveNameInfos({ p10.senderUserId }, p11)
		} elseif p10.kind == "replyHeader" then {
			namesByUserId = resolveNameInfos({ p10.senderUserId, p10.repliedToUserId }, p11),
			localUserId = getLocalUserIdModule(),
			isGroup = var25(p11)
		} else {}
	end
	
	local function _(p12) --[[ line: 171 | named "getMessageRowSpecs" ]]
		-- upvalues: t_1 (ref), signalsModule (copy), getConversationMessageStoreModule (copy), t (copy), classifyMessageModule (copy)
		local var30 = t_1[p12]
		
		if var30 == nil then
			var30 = signalsModule.createComputed(function(p13) --[[ line: 174 ]]
				-- upvalues: getConversationMessageStoreModule (copy), p12 (ref), t (copy), classifyMessageModule (copy)
				local message = getConversationMessageStoreModule(p13).getMessage(p12, p13)
				
				return if message == nil then t else classifyMessageModule(message)
			end)
			t_1[p12] = var30
		end
		return var30
	end
	
	local function getMessageSortTime(p14) --[[ line: 189 ]]
		-- upvalues: t_2 (ref), signalsModule (copy), getConversationMessageStoreModule (copy)
		local var32 = t_2[p14]
		
		if var32 == nil then
			var32 = signalsModule.createComputed(function(p15) --[[ line: 192 ]]
				-- upvalues: getConversationMessageStoreModule (copy), p14 (ref)
				local message = getConversationMessageStoreModule(p15).getMessage(p14, p15)
				local var34 = if message then message.created_at else nil
				
				if var34 == nil then
					return 1e999
				end
				local dateTime = DateTime.fromIsoDate(var34)
				
				if dateTime then
					return dateTime.UnixTimestampMillis
				end
				local var36 = tonumber(var34)
				
				return if var36 then var36 * 1000 else 1e999
			end, function(p16, p17) --[[ line: 194 ]]
				return p16 == p17
			end)
			t_2[p14] = var32
		end
		return var32
	end
	
	local var28 = signalsModule.createComputed(function(p18) --[[ line: 205 ]]
		-- upvalues: p7 (ref), t_1 (ref), signalsModule (copy), getConversationMessageStoreModule (copy), t (copy), classifyMessageModule (copy), getMessageSortTime (ref)
		local var37 = p7(p18)
		local t_2 = {}
		local var39 = 0
		
		for i, v in var37 do
			local var40 = t_1[v]
			
			if var40 == nil then
				var40 = signalsModule.createComputed(function(p19) --[[ line: 174 ]]
					-- upvalues: getConversationMessageStoreModule (copy), v (ref), t (copy), classifyMessageModule (copy)
					local message = getConversationMessageStoreModule(p19).getMessage(v, p19)
					
					return if message == nil then t else classifyMessageModule(message)
				end)
				t_1[v] = var40
			end
			local count = #var40(p18)
			
			if count ~= 0 then
				if var39 + count > 50 then break end
				var39 += count
				table.insert(t_2, {
					sourceId = v,
					count = count,
					sortTime = getMessageSortTime(v)(p18)
				})
			end
		end
		table.sort(t_2, function(p20, p21) --[[ line: 231 ]]
			return if p20.sortTime == p21.sortTime then p20.sourceId < p21.sourceId else p20.sortTime < p21.sortTime
		end)
		local t_3 = {}
		local t_4 = {}
		
		for count, v_1 in t_2 do
			for i_2 = 1, v_1.count do
				local sourceId = `{v_1.sourceId}_{i_2}`
				table.insert(t_3, sourceId)
				t_4[sourceId] = { messageId = v_1.sourceId, rowIndex = i_2 }
			end
		end
		return { idList = t_3, idToHandle = t_4 }
	end)
	
	return {
		getDisplayIds = signalsModule.createComputed(function(p22) --[[ line: 251 ]]
			-- upvalues: var28 (ref)
			return var28(p22).idList
		end, shallowArrayEquals),
		getDisplayFromId = function(p23, p24, p25) --[[ line: 259 ]]
			-- upvalues: var28 (ref), t_1 (ref), signalsModule (copy), getConversationMessageStoreModule (copy), t (copy), classifyMessageModule (copy), buildRowDisplayModule (copy), resolveForRowSpec (ref)
			if p23 == nil then
				return nil
			end
			local var45 = var28(false).idToHandle[p23]
			
			if var45 == nil then
				return nil
			end
			local messageId = var45.messageId
			local var46 = t_1[messageId]
			
			if var46 == nil then
				var46 = signalsModule.createComputed(function(p26) --[[ line: 174 ]]
					-- upvalues: getConversationMessageStoreModule (copy), messageId (ref), t (copy), classifyMessageModule (copy)
					local message = getConversationMessageStoreModule(p26).getMessage(messageId, p26)
					
					return if message == nil then t else classifyMessageModule(message)
				end)
				t_1[messageId] = var46
			end
			local rowIndex = var46(p24)[var45.rowIndex]
			
			return if rowIndex == nil then nil else buildRowDisplayModule(rowIndex, resolveForRowSpec(rowIndex, p24), p25 or {})
		end
	}
end