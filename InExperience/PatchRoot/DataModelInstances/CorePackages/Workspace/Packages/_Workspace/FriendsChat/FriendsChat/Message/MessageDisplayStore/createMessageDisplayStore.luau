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

local function _(p0) --[[ line: 59 | named "messageSortTime" ]]
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

local function resolveProfileNameInfo(p1, p2) --[[ line: 78 ]]
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

local function resolveNameInfos(p3, p4) --[[ line: 106 ]]
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

return function(p5, p6) --[[ line: 128 | named "createMessageDisplayStore" ]]
	-- upvalues: signalsModule (ref), getConversationStoreModule (ref), conversationModule (ref), resolveNameInfos (ref), getLocalUserIdModule (ref), getConversationMessageStoreModule (ref), t (ref), classifyMessageModule (ref), cryoModule (ref), buildRowDisplayModule (ref)
	local t_1 = {}
	local t_2 = {}
	local var25 = signalsModule.createComputed(function(p7) --[[ line: 135 ]]
		-- upvalues: p6 (ref), getConversationStoreModule (copy), conversationModule (copy)
		if p6 == nil then
			return false
		end
		local conversation = getConversationStoreModule(p7).getConversation(p6, p7)
		
		return conversation ~= nil and conversation.conversationType == conversationModule.Type.MULTI_USER_CONVERSATION
	end)
	
	local function resolveForRowSpec(p8, p9) --[[ line: 144 ]]
		-- upvalues: resolveNameInfos (copy), getLocalUserIdModule (copy), var25 (ref)
		return if p8.kind == "userText" or p8.kind == "hiddenUser" then {
			namesByUserId = resolveNameInfos({ p8.senderUserId }, p9)
		} elseif p8.kind == "replyHeader" then {
			namesByUserId = resolveNameInfos({ p8.senderUserId, p8.repliedToUserId }, p9),
			localUserId = getLocalUserIdModule(),
			isGroup = var25(p9)
		} else {}
	end
	
	local function _(p10) --[[ line: 158 | named "getMessageRowSpecs" ]]
		-- upvalues: t_1 (ref), signalsModule (copy), getConversationMessageStoreModule (copy), t (copy), classifyMessageModule (copy)
		local var29 = t_1[p10]
		
		if var29 == nil then
			var29 = signalsModule.createComputed(function(p11) --[[ line: 161 ]]
				-- upvalues: getConversationMessageStoreModule (copy), p10 (ref), t (copy), classifyMessageModule (copy)
				local message = getConversationMessageStoreModule(p11).getMessage(p10, p11)
				
				return if message == nil then t else classifyMessageModule(message)
			end)
			t_1[p10] = var29
		end
		return var29
	end
	
	local _ = function(p12, p13) --[[ line: 184 | named "getFrozenMessageSortTime" ]]
		-- upvalues: t_2 (ref), getConversationMessageStoreModule (copy)
		local var31 = t_2[p12]
		
		if var31 ~= nil then
			return var31
		end
		local message = getConversationMessageStoreModule(p13).getMessage(p12, p13)
		
		if message == nil then
			return 1e999
		end
		local var34
		local var33 = if message then message.created_at else nil
		
		if var33 == nil then
			var34 = 1e999
		else
			local dateTime = DateTime.fromIsoDate(var33)
			
			if dateTime then
				var34 = dateTime.UnixTimestampMillis
			else
				local var36 = tonumber(var33)
				var34 = if var36 then var36 * 1000 else 1e999
			end
		end
		t_2[p12] = var34
		
		return var34
	end
	
	local var27 = signalsModule.createComputed(function(p14) --[[ line: 201 ]]
		-- upvalues: p5 (ref), t_1 (ref), signalsModule (copy), getConversationMessageStoreModule (copy), t (copy), classifyMessageModule (copy), t_2 (ref)
		local var37 = p5(p14)
		local t_3 = {}
		local var39 = 0
		
		for i, v in var37 do
			local var40 = t_1[v]
			
			if var40 == nil then
				var40 = signalsModule.createComputed(function(p15) --[[ line: 161 ]]
					-- upvalues: getConversationMessageStoreModule (copy), v (ref), t (copy), classifyMessageModule (copy)
					local message = getConversationMessageStoreModule(p15).getMessage(v, p15)
					
					return if message == nil then t else classifyMessageModule(message)
				end)
				t_1[v] = var40
			end
			local count = #var40(p14)
			
			if count ~= 0 then
				if var39 + count > 50 then break end
				local var44
				var39 += count
				local t_4 = { sourceId = v, count = count }
				local var43 = t_2[v]
				
				if var43 == nil then
					local message = getConversationMessageStoreModule(p14).getMessage(v, p14)
					
					if message == nil then
						var44 = 1e999
					else
						local var47
						local var46 = if message then message.created_at else nil
						
						if var46 == nil then
							var47 = 1e999
						else
							local dateTime = DateTime.fromIsoDate(var46)
							
							if dateTime then
								var47 = dateTime.UnixTimestampMillis
							else
								local var49 = tonumber(var46)
								var47 = if var49 then var49 * 1000 else 1e999
							end
						end
						t_2[v] = var47
						var44 = var47
					end
				else
					var44 = var43
				end
				t_4.sortTime = var44
				table.insert(t_3, t_4)
			end
		end
		table.sort(t_3, function(p16, p17) --[[ line: 227 ]]
			return if p16.sortTime == p17.sortTime then p16.sourceId < p17.sourceId else p16.sortTime < p17.sortTime
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
		getDisplayIds = signalsModule.createComputed(function(p18) --[[ line: 247 ]]
			-- upvalues: var27 (ref)
			return var27(p18).idList
		end, cryoModule.List.equals),
		getDisplayFromId = function(p19, p20, p21) --[[ line: 255 ]]
			-- upvalues: var27 (ref), t_1 (ref), signalsModule (copy), getConversationMessageStoreModule (copy), t (copy), classifyMessageModule (copy), buildRowDisplayModule (copy), resolveForRowSpec (ref)
			if p19 == nil then
				return nil
			end
			local var53 = var27(false).idToHandle[p19]
			
			if var53 == nil then
				return nil
			end
			local messageId = var53.messageId
			local var54 = t_1[messageId]
			
			if var54 == nil then
				var54 = signalsModule.createComputed(function(p22) --[[ line: 161 ]]
					-- upvalues: getConversationMessageStoreModule (copy), messageId (ref), t (copy), classifyMessageModule (copy)
					local message = getConversationMessageStoreModule(p22).getMessage(messageId, p22)
					
					return if message == nil then t else classifyMessageModule(message)
				end)
				t_1[messageId] = var54
			end
			local rowIndex = var54(p20)[var53.rowIndex]
			
			return if rowIndex == nil then nil else buildRowDisplayModule(rowIndex, resolveForRowSpec(rowIndex, p20), p21 or {})
		end,
		getMessageIdFromDisplayId = function(p23) --[[ line: 274 ]]
			-- upvalues: var27 (ref)
			if p23 == nil then
				return nil
			end
			local var55 = var27(false).idToHandle[p23]
			
			return if var55 then var55.messageId else nil
		end
	}
end