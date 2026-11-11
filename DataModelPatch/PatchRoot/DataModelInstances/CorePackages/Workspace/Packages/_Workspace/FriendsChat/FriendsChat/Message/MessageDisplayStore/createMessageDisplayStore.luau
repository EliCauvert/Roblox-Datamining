local Parent = script:FindFirstAncestor("FriendsChat").Parent
local SignalsModule = require(Parent.Signals)
local UserProfileStore = require(Parent.UserProfiles).Stores.UserProfileStore
local GetConversationMessageStoreModule = require(Parent.AppChat.GetConversationMessageStore)
local GetConversationStoreModule = require(Parent.AppChat.GetConversationStore)
local ConversationModule = require(Parent.AppChat.Conversation)
local ClassifyMessageModule = require(script.Parent.classifyMessage)
local BuildRowDisplayModule = require(script.Parent.buildRowDisplay)
local GetLocalUserIdModule = require(script.Parent.Parent.Parent.Utils.getLocalUserId)
local t = {}

local function shallowArrayEquals(List, p1): boolean
	if List == p1 then
		return true
	end
	if List == nil or p1 == nil or #List ~= #p1 then
		return false
	end
	for i, value in List do
		if p1[i] ~= value then
			return false
		end
	end
	return true
end

local function resolveProfileNameInfo(p2, p3)
	if p2 == nil or p2.names == nil then
		return { displayName = nil, username = nil }
	else
		local GetDisplayNameFunction = p2.names.getDisplayName
		local GetUsernameFunction = p2.names.getUsername
		
		return {
			displayName = if GetDisplayNameFunction then GetDisplayNameFunction(p3) else nil,
			username = if GetUsernameFunction then GetUsernameFunction(p3) else nil
		}
	end
end

local function resolveNameInfos(List, p2)
	-- upvalues: UserProfileStore (copy), resolveProfileNameInfo (copy)
	local List1 = {}
	local t = {}
	local List2 = {}
	
	for _, value in List do
		if not t[value] then
			t[value] = true
			table.insert(List1, value)
			table.insert(List2, (tostring(value)))
		end
	end
	local v1 = UserProfileStore.get().fetchNamesByUserIds(List2)(p2)
	local Data = if v1 and v1.data then v1.data else {}
	local t1 = {}
	
	for i, value1 in List1 do
		t1[value1] = resolveProfileNameInfo(Data[i], p2)
	end
	return t1
end

return function(Callback, p3, p4)
	-- upvalues: SignalsModule (copy), GetConversationStoreModule (copy), ConversationModule (copy), resolveNameInfos (copy), GetLocalUserIdModule (copy), GetConversationMessageStoreModule (copy), t (copy), ClassifyMessageModule (copy), shallowArrayEquals (copy), BuildRowDisplayModule (copy)
	local t2 = {}
	local Computed = SignalsModule.createComputed(function(p5): boolean
		-- upvalues: p3 (copy), GetConversationStoreModule (upval), ConversationModule (upval)
		if p3 == nil then
			return false
		else
			local Conversation = GetConversationStoreModule(p5).getConversation(p3, p5)
			
			return Conversation ~= nil and Conversation.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION
		end
	end)
	
	local function resolveForRowSpec(p5, p6)
		-- upvalues: resolveNameInfos (upval), GetLocalUserIdModule (upval), Computed (copy)
		return if p5.kind == "userText" or p5.kind == "hiddenUser" then {
			namesByUserId = resolveNameInfos({ p5.senderUserId }, p6)
		} elseif p5.kind == "replyHeader" then {
			namesByUserId = resolveNameInfos({ p5.senderUserId, p5.repliedToUserId }, p6),
			localUserId = GetLocalUserIdModule(),
			isGroup = Computed(p6)
		} else {}
	end
	
	local function _(Key)
		-- upvalues: t2 (copy), SignalsModule (upval), GetConversationMessageStoreModule (upval), t (upval), ClassifyMessageModule (upval)
		local Entry = t2[Key]
		
		if Entry == nil then
			Entry = SignalsModule.createComputed(function(p5)
				-- upvalues: GetConversationMessageStoreModule (upval), Key (copy), t (upval), ClassifyMessageModule (upval)
				local Message = GetConversationMessageStoreModule(p5).getMessage(Key, p5)
				
				return if Message == nil then t else ClassifyMessageModule(Message)
			end)
			t2[Key] = Entry
		end
		return Entry
	end
	
	local Computed1 = SignalsModule.createComputed(function(p5)
		-- upvalues: Callback (copy), t2 (copy), SignalsModule (upval), GetConversationMessageStoreModule (upval), t (upval), ClassifyMessageModule (upval)
		local List = {}
		local Total = 0
		
		for _, SourceId in Callback(p5) do
			local Entry = t2[SourceId]
			
			if Entry == nil then
				Entry = SignalsModule.createComputed(function(p6)
					-- upvalues: GetConversationMessageStoreModule (upval), SourceId (copy), t (upval), ClassifyMessageModule (upval)
					local Message = GetConversationMessageStoreModule(p6).getMessage(SourceId, p6)
					
					return if Message == nil then t else ClassifyMessageModule(Message)
				end)
				t2[SourceId] = Entry
			end
			local Count = #Entry(p5)
			
			if Count ~= 0 then
				if Total + Count > 50 then break end
				Total += Count
				table.insert(List, { sourceId = SourceId, count = Count })
			end
		end
		local IdList = {}
		local IdToHandle = {}
		
		for i = #List, 1, -1 do
			local Entry = List[i]
			
			for i1 = 1, Entry.count do
				local Text: string = `{Entry.sourceId}_{i1}`
				table.insert(IdList, Text)
				IdToHandle[Text] = { messageId = Entry.sourceId, rowIndex = i1 }
			end
		end
		return { idList = IdList, idToHandle = IdToHandle }
	end)
	
	return {
		getDisplayIds = SignalsModule.createComputed(function(p6)
			-- upvalues: Computed1 (copy)
			return Computed1(p6).idList
		end, shallowArrayEquals),
		getDisplayFromId = function(p6, p7)
			-- upvalues: Computed1 (copy), t2 (copy), SignalsModule (upval), GetConversationMessageStoreModule (upval), t (upval), ClassifyMessageModule (upval), BuildRowDisplayModule (upval), resolveForRowSpec (copy), p4 (copy)
			if p6 == nil then
				return nil
			end
			local IdToHandleEntry = Computed1(false).idToHandle[p6]
			
			if IdToHandleEntry == nil then
				return nil
			end
			local MessageId = IdToHandleEntry.messageId
			local Entry = t2[MessageId]
			
			if Entry == nil then
				Entry = SignalsModule.createComputed(function(p8)
					-- upvalues: GetConversationMessageStoreModule (upval), MessageId (copy), t (upval), ClassifyMessageModule (upval)
					local Message = GetConversationMessageStoreModule(p8).getMessage(MessageId, p8)
					
					return if Message == nil then t else ClassifyMessageModule(Message)
				end)
				t2[MessageId] = Entry
			end
			local EntryResultEntry = Entry(p7)[IdToHandleEntry.rowIndex]
			
			return if EntryResultEntry == nil then nil else BuildRowDisplayModule(EntryResultEntry, resolveForRowSpec(EntryResultEntry, p7), p4)
		end
	}
end