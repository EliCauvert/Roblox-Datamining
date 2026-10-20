local Parent = script:FindFirstAncestor("FriendsChat").Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local UserProfileStore = require(Parent.UserProfiles).Stores.UserProfileStore
local GetConversationMessageStoreModule = require(Parent.AppChat.GetConversationMessageStore)
local GetConversationStoreModule = require(Parent.AppChat.GetConversationStore)
local ConversationModule = require(Parent.AppChat.Conversation)
local ClassifyMessageModule = require(script.Parent.classifyMessage)
local BuildRowDisplayModule = require(script.Parent.buildRowDisplay)
local GetLocalUserIdModule = require(script.Parent.Parent.Parent.Utils.getLocalUserId)
local t = {}

local function _(p1)
	local CreatedAt = if p1 then p1.created_at else nil
	
	if CreatedAt == nil then
		return 1e999
	end
	local _DateTime = DateTime.fromIsoDate(CreatedAt)
	
	if _DateTime then
		return _DateTime.UnixTimestampMillis
	else
		local Number: number? = tonumber(CreatedAt)
		
		return if Number then Number * 1000 else 1e999
	end
end

local function resolveProfileNameInfo(p1, p2)
	if p1 == nil or p1.names == nil then
		return { name = nil, username = nil }
	else
		local GetCombinedNameFunction = p1.names.getCombinedName
		local GetDisplayNameFunction = p1.names.getDisplayName
		local GetUsernameFunction = p1.names.getUsername
		local Username = if GetUsernameFunction then GetUsernameFunction(p2) else nil
		local CombinedName = if GetCombinedNameFunction then GetCombinedNameFunction(p2) else nil
		local DisplayName = if GetDisplayNameFunction then GetDisplayNameFunction(p2) else nil
		
		return {
			name = if CombinedName == nil or CombinedName == "" then if DisplayName == nil or DisplayName == "" then Username else DisplayName else CombinedName,
			username = Username
		}
	end
end

local function resolveNameInfos(List, p1)
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
	local v1 = UserProfileStore.get().fetchNamesByUserIds(List2)(p1)
	local Data = if v1 and v1.data then v1.data else {}
	local t1 = {}
	
	for i, value1 in List1 do
		t1[value1] = resolveProfileNameInfo(Data[i], p1)
	end
	return t1
end

return function(Callback, p2)
	-- upvalues: SignalsModule (copy), GetConversationStoreModule (copy), ConversationModule (copy), resolveNameInfos (copy), GetLocalUserIdModule (copy), GetConversationMessageStoreModule (copy), t (copy), ClassifyMessageModule (copy), CryoModule (copy), BuildRowDisplayModule (copy)
	local t2 = {}
	local t3 = {}
	local Computed = SignalsModule.createComputed(function(p3): boolean
		-- upvalues: p2 (copy), GetConversationStoreModule (upval), ConversationModule (upval)
		if p2 == nil then
			return false
		else
			local Conversation = GetConversationStoreModule(p3).getConversation(p2, p3)
			
			return Conversation ~= nil and Conversation.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION
		end
	end)
	
	local function resolveForRowSpec(p3, p4)
		-- upvalues: resolveNameInfos (upval), GetLocalUserIdModule (upval), Computed (copy)
		return if p3.kind == "userText" or p3.kind == "hiddenUser" then {
			namesByUserId = resolveNameInfos({ p3.senderUserId }, p4)
		} elseif p3.kind == "replyHeader" then {
			namesByUserId = resolveNameInfos({ p3.senderUserId, p3.repliedToUserId }, p4),
			localUserId = GetLocalUserIdModule(),
			isGroup = Computed(p4)
		} else {}
	end
	
	local function _(Key)
		-- upvalues: t2 (copy), SignalsModule (upval), GetConversationMessageStoreModule (upval), t (upval), ClassifyMessageModule (upval)
		local Entry = t2[Key]
		
		if Entry == nil then
			Entry = SignalsModule.createComputed(function(p3)
				-- upvalues: GetConversationMessageStoreModule (upval), Key (copy), t (upval), ClassifyMessageModule (upval)
				local Message = GetConversationMessageStoreModule(p3).getMessage(Key, p3)
				
				return if Message == nil then t else ClassifyMessageModule(Message)
			end)
			t2[Key] = Entry
		end
		return Entry
	end
	
	local _ = function(Key, p3)
		-- upvalues: t3 (copy), GetConversationMessageStoreModule (upval)
		local Entry = t3[Key]
		
		if Entry ~= nil then
			return Entry
		end
		local Message = GetConversationMessageStoreModule(p3).getMessage(Key, p3)
		
		if Message == nil then
			return 1e999
		end
		local CreatedAt = if Message then Message.created_at else nil
		local UnixTimestampMillis = nil
		
		if CreatedAt == nil then
			UnixTimestampMillis = 1e999
		else
			local _DateTime = DateTime.fromIsoDate(CreatedAt)
			
			if _DateTime then
				UnixTimestampMillis = _DateTime.UnixTimestampMillis
			else
				local Number: number? = tonumber(CreatedAt)
				UnixTimestampMillis = if Number then Number * 1000 else 1e999
			end
		end
		t3[Key] = UnixTimestampMillis
		
		return UnixTimestampMillis
	end
	
	local Computed1 = SignalsModule.createComputed(function(p3)
		-- upvalues: Callback (copy), t2 (copy), SignalsModule (upval), GetConversationMessageStoreModule (upval), t (upval), ClassifyMessageModule (upval), t3 (copy)
		local List = {}
		local Total = 0
		
		for _, SourceId in Callback(p3) do
			local Entry = t2[SourceId]
			
			if Entry == nil then
				Entry = SignalsModule.createComputed(function(p4)
					-- upvalues: GetConversationMessageStoreModule (upval), SourceId (copy), t (upval), ClassifyMessageModule (upval)
					local Message = GetConversationMessageStoreModule(p4).getMessage(SourceId, p4)
					
					return if Message == nil then t else ClassifyMessageModule(Message)
				end)
				t2[SourceId] = Entry
			end
			local Count = #Entry(p3)
			
			if Count ~= 0 then
				if Total + Count > 50 then break end
				Total += Count
				local config = { sourceId = SourceId, count = Count }
				local Entry1 = t3[SourceId]
				local SortTime = nil
				
				if Entry1 == nil then
					local Message = GetConversationMessageStoreModule(p3).getMessage(SourceId, p3)
					
					if Message == nil then
						SortTime = 1e999
					else
						local CreatedAt = if Message then Message.created_at else nil
						local UnixTimestampMillis = nil
						
						if CreatedAt == nil then
							UnixTimestampMillis = 1e999
						else
							local _DateTime = DateTime.fromIsoDate(CreatedAt)
							
							if _DateTime then
								UnixTimestampMillis = _DateTime.UnixTimestampMillis
							else
								local Number: number? = tonumber(CreatedAt)
								UnixTimestampMillis = if Number then Number * 1000 else 1e999
							end
						end
						t3[SourceId] = UnixTimestampMillis
						SortTime = UnixTimestampMillis
					end
				else
					SortTime = Entry1
				end
				config.sortTime = SortTime
				table.insert(List, config)
			end
		end
		table.sort(List, function(A, B): boolean
			return if A.sortTime == B.sortTime then A.sourceId < B.sourceId else A.sortTime < B.sortTime
		end)
		local IdList = {}
		local IdToHandle = {}
		
		for _, value in List do
			for i = 1, value.count do
				local Text: string = `{value.sourceId}_{i}`
				table.insert(IdList, Text)
				IdToHandle[Text] = { messageId = value.sourceId, rowIndex = i }
			end
		end
		return { idList = IdList, idToHandle = IdToHandle }
	end)
	
	return {
		getDisplayIds = SignalsModule.createComputed(function(p4)
			-- upvalues: Computed1 (copy)
			return Computed1(p4).idList
		end, CryoModule.List.equals),
		getDisplayFromId = function(p4, p5, p6)
			-- upvalues: Computed1 (copy), t2 (copy), SignalsModule (upval), GetConversationMessageStoreModule (upval), t (upval), ClassifyMessageModule (upval), BuildRowDisplayModule (upval), resolveForRowSpec (copy)
			if p4 == nil then
				return nil
			end
			local IdToHandleEntry = Computed1(false).idToHandle[p4]
			
			if IdToHandleEntry == nil then
				return nil
			end
			local MessageId = IdToHandleEntry.messageId
			local Entry = t2[MessageId]
			
			if Entry == nil then
				Entry = SignalsModule.createComputed(function(p7)
					-- upvalues: GetConversationMessageStoreModule (upval), MessageId (copy), t (upval), ClassifyMessageModule (upval)
					local Message = GetConversationMessageStoreModule(p7).getMessage(MessageId, p7)
					
					return if Message == nil then t else ClassifyMessageModule(Message)
				end)
				t2[MessageId] = Entry
			end
			local EntryResultEntry = Entry(p5)[IdToHandleEntry.rowIndex]
			
			return if EntryResultEntry == nil then nil else BuildRowDisplayModule(EntryResultEntry, resolveForRowSpec(EntryResultEntry, p5), p6 or {})
		end,
		getMessageIdFromDisplayId = function(p4)
			-- upvalues: Computed1 (copy)
			if p4 == nil then
				return nil
			else
				local IdToHandleEntry = Computed1(false).idToHandle[p4]
				
				return if IdToHandleEntry then IdToHandleEntry.messageId else nil
			end
		end
	}
end