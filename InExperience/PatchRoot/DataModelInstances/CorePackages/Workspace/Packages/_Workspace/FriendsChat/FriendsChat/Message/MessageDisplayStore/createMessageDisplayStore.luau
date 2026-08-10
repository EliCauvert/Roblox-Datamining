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

local function _(p0) --[[ line: 58 | named "messageSortTime" ]]
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

local function resolveProfileNameInfo(p1, p2) --[[ line: 77 ]]
	if p1 == nil or p1.names == nil then
		return { name = nil, username = nil }
	end
	local getCombinedName = p1.names.getCombinedName
	local getDisplayName = p1.names.getDisplayName
	local getUsername = p1.names.getUsername
	local var14 = if getUsername then getUsername(p2) else nil
	local var15 = if getCombinedName then getCombinedName(p2) else nil
	local var16 = if getDisplayName then getDisplayName(p2) else nil
	
	return {
		name = if var15 ~= nil and var15 ~= "" then if var16 == nil or var16 == "" then var14 else var16 else var15,
		username = var14
	}
end

local function resolveNameInfos(p3, p4) --[[ line: 105 ]]
	-- upvalues: userProfileStore (ref), resolveProfileNameInfo (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in p3 do
		if not t_1[v] then
			t_1[v] = true
			table.insert(t, v)
			table.insert(t_2, tostring(v))
		end
	end
	local var20 = userProfileStore.get().fetchNamesByUserIds(t_2)(p4)
	local var21 = if var20 and var20.data then var20.data else {}
	local t_3 = {}
	
	for i_1, v_1 in t do
		t_3[v_1] = resolveProfileNameInfo(var21[i_1], p4)
	end
	return t_3
end

return function(p5, p6) --[[ line: 127 | named "createMessageDisplayStore" ]]
	-- upvalues: signalsModule (ref), getConversationStoreModule (ref), conversationModule (ref), resolveNameInfos (ref), getLocalUserIdModule (ref), getConversationMessageStoreModule (ref), t (ref), classifyMessageModule (ref), cryoModule (ref), buildRowDisplayModule (ref)
	local t_1 = {}
	local t_2 = {}
	local var25 = signalsModule.createComputed(function(p7) --[[ line: 134 ]]
		-- upvalues: p6 (ref), getConversationStoreModule (copy), conversationModule (copy)
		if p6 == nil then
			return false
		end
		local conversation = getConversationStoreModule(p7).getConversation(p6, p7)
		
		return conversation ~= nil and conversation.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
	end)
	
	local function resolveForRowSpec(p8, p9) --[[ line: 143 ]]
		-- upvalues: resolveNameInfos (copy), getLocalUserIdModule (copy), var25 (ref)
		return if p8.kind == "userText" or p8.kind == "hiddenUser" then {
			namesByUserId = resolveNameInfos({ p8.senderUserId }, p9)
		} elseif p8.kind == "replyHeader" then {
			namesByUserId = resolveNameInfos({ p8.senderUserId, p8.repliedToUserId }, p9),
			localUserId = getLocalUserIdModule(),
			isGroup = var25(p9)
		} else {}
	end
	
	local function _(p10) --[[ line: 157 | named "getMessageRowSpecs" ]]
		-- upvalues: t_1 (ref), signalsModule (copy), getConversationMessageStoreModule (copy), t (copy), classifyMessageModule (copy)
		local var30 = t_1[p10]
		
		if var30 == nil then
			var30 = signalsModule.createComputed(function(p11) --[[ line: 160 ]]
				-- upvalues: getConversationMessageStoreModule (copy), p10 (ref), t (copy), classifyMessageModule (copy)
				local message = getConversationMessageStoreModule(p11).getMessage(p10, p11)
				
				return if message == nil then t else classifyMessageModule(message)
			end)
			t_1[p10] = var30
		end
		return var30
	end
	
	local function getMessageSortTime(p12) --[[ line: 175 ]]
		-- upvalues: t_2 (ref), signalsModule (copy), getConversationMessageStoreModule (copy)
		local var32 = t_2[p12]
		
		if var32 == nil then
			var32 = signalsModule.createComputed(function(p13) --[[ line: 178 ]]
				-- upvalues: getConversationMessageStoreModule (copy), p12 (ref)
				local message = getConversationMessageStoreModule(p13).getMessage(p12, p13)
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
			end, function(p14, p15) --[[ line: 180 ]]
				return p14 == p15
			end)
			t_2[p12] = var32
		end
		return var32
	end
	
	local var28 = signalsModule.createComputed(function(p16) --[[ line: 191 ]]
		-- upvalues: p5 (ref), t_1 (ref), signalsModule (copy), getConversationMessageStoreModule (copy), t (copy), classifyMessageModule (copy), getMessageSortTime (ref)
		local var37 = p5(p16)
		local t_2 = {}
		local var39 = 0
		
		for i, v in var37 do
			local var40 = t_1[v]
			
			if var40 == nil then
				var40 = signalsModule.createComputed(function(p17) --[[ line: 160 ]]
					-- upvalues: getConversationMessageStoreModule (copy), v (ref), t (copy), classifyMessageModule (copy)
					local message = getConversationMessageStoreModule(p17).getMessage(v, p17)
					
					return if message == nil then t else classifyMessageModule(message)
				end)
				t_1[v] = var40
			end
			local count = #var40(p16)
			
			if count ~= 0 then
				if var39 + count > 50 then break end
				var39 += count
				table.insert(t_2, {
					sourceId = v,
					count = count,
					sortTime = getMessageSortTime(v)(p16)
				})
			end
		end
		table.sort(t_2, function(p18, p19) --[[ line: 217 ]]
			return if p18.sortTime == p19.sortTime then p18.sourceId < p19.sourceId else p18.sortTime < p19.sortTime
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
		getDisplayIds = signalsModule.createComputed(function(p20) --[[ line: 237 ]]
			-- upvalues: var28 (ref)
			return var28(p20).idList
		end, cryoModule.List.equals),
		getDisplayFromId = function(p21, p22, p23) --[[ line: 245 ]]
			-- upvalues: var28 (ref), t_1 (ref), signalsModule (copy), getConversationMessageStoreModule (copy), t (copy), classifyMessageModule (copy), buildRowDisplayModule (copy), resolveForRowSpec (ref)
			if p21 == nil then
				return nil
			end
			local var45 = var28(false).idToHandle[p21]
			
			if var45 == nil then
				return nil
			end
			local messageId = var45.messageId
			local var46 = t_1[messageId]
			
			if var46 == nil then
				var46 = signalsModule.createComputed(function(p24) --[[ line: 160 ]]
					-- upvalues: getConversationMessageStoreModule (copy), messageId (ref), t (copy), classifyMessageModule (copy)
					local message = getConversationMessageStoreModule(p24).getMessage(messageId, p24)
					
					return if message == nil then t else classifyMessageModule(message)
				end)
				t_1[messageId] = var46
			end
			local rowIndex = var46(p22)[var45.rowIndex]
			
			return if rowIndex == nil then nil else buildRowDisplayModule(rowIndex, resolveForRowSpec(rowIndex, p22), p23 or {})
		end
	}
end