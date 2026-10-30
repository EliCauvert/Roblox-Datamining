local Parent = script:FindFirstAncestor("FriendsChat").Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local GetConversationMessageStoreModule = require(Parent.AppChat.GetConversationMessageStore)
local ClassifyMessageModule = require(script.Parent.classifyMessage)
local BuildRowDisplayModule = require(script.Parent.buildRowDisplay)
local CreateFrozenSortTimesModule = require(script.Parent.createFrozenSortTimes)
local CreateGetIsGroupModule = require(script.Parent.createGetIsGroup)
local ResolveNameInfosModule = require(script.Parent.resolveNameInfos)
local GetLocalUserIdModule = require(script.Parent.Parent.Parent.Utils.getLocalUserId)
local t = {}

return function(Callback, p1)
	-- upvalues: CreateFrozenSortTimesModule (copy), CreateGetIsGroupModule (copy), ResolveNameInfosModule (copy), GetLocalUserIdModule (copy), SignalsModule (copy), GetConversationMessageStoreModule (copy), t (copy), ClassifyMessageModule (copy), CryoModule (copy), BuildRowDisplayModule (copy)
	local t1 = {}
	local FrozenSortTimesModule = CreateFrozenSortTimesModule()
	local GetIsGroupModule = CreateGetIsGroupModule(p1)
	
	local function resolveForRowSpec(p2, p3)
		-- upvalues: ResolveNameInfosModule (upval), GetLocalUserIdModule (upval), GetIsGroupModule (copy)
		return if p2.kind == "userText" or p2.kind == "hiddenUser" then {
			namesByUserId = ResolveNameInfosModule({ p2.senderUserId }, p3)
		} elseif p2.kind == "replyHeader" then {
			namesByUserId = ResolveNameInfosModule({ p2.senderUserId, p2.repliedToUserId }, p3),
			localUserId = GetLocalUserIdModule(),
			isGroup = GetIsGroupModule(p3)
		} else {}
	end
	
	local function _(Key)
		-- upvalues: t1 (copy), SignalsModule (upval), GetConversationMessageStoreModule (upval), t (upval), ClassifyMessageModule (upval)
		local Entry = t1[Key]
		
		if Entry == nil then
			Entry = SignalsModule.createComputed(function(p2)
				-- upvalues: GetConversationMessageStoreModule (upval), Key (copy), t (upval), ClassifyMessageModule (upval)
				local Message = GetConversationMessageStoreModule(p2).getMessage(Key, p2)
				
				return if Message == nil then t else ClassifyMessageModule(Message)
			end)
			t1[Key] = Entry
		end
		return Entry
	end
	
	local Computed = SignalsModule.createComputed(function(p2)
		-- upvalues: Callback (copy), t1 (copy), SignalsModule (upval), GetConversationMessageStoreModule (upval), t (upval), ClassifyMessageModule (upval), FrozenSortTimesModule (copy)
		local List = {}
		local Total = 0
		
		for _, SourceId in Callback(p2) do
			local Entry = t1[SourceId]
			
			if Entry == nil then
				Entry = SignalsModule.createComputed(function(p3)
					-- upvalues: GetConversationMessageStoreModule (upval), SourceId (copy), t (upval), ClassifyMessageModule (upval)
					local Message = GetConversationMessageStoreModule(p3).getMessage(SourceId, p3)
					
					return if Message == nil then t else ClassifyMessageModule(Message)
				end)
				t1[SourceId] = Entry
			end
			local Count = #Entry(p2)
			
			if Count ~= 0 then
				if Total + Count > 50 then break end
				Total += Count
				table.insert(List, {
					sourceId = SourceId,
					count = Count,
					sortTime = FrozenSortTimesModule(SourceId, p2)
				})
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
		getDisplayIds = SignalsModule.createComputed(function(p3)
			-- upvalues: Computed (copy)
			return Computed(p3).idList
		end, CryoModule.List.equals),
		getDisplayFromId = function(p3, p4, p5)
			-- upvalues: Computed (copy), t1 (copy), SignalsModule (upval), GetConversationMessageStoreModule (upval), t (upval), ClassifyMessageModule (upval), BuildRowDisplayModule (upval), resolveForRowSpec (copy)
			if p3 == nil then
				return nil
			end
			local IdToHandleEntry = Computed(false).idToHandle[p3]
			
			if IdToHandleEntry == nil then
				return nil
			end
			local MessageId = IdToHandleEntry.messageId
			local Entry = t1[MessageId]
			
			if Entry == nil then
				Entry = SignalsModule.createComputed(function(p6)
					-- upvalues: GetConversationMessageStoreModule (upval), MessageId (copy), t (upval), ClassifyMessageModule (upval)
					local Message = GetConversationMessageStoreModule(p6).getMessage(MessageId, p6)
					
					return if Message == nil then t else ClassifyMessageModule(Message)
				end)
				t1[MessageId] = Entry
			end
			local EntryResultEntry = Entry(p4)[IdToHandleEntry.rowIndex]
			
			return if EntryResultEntry == nil then nil else BuildRowDisplayModule(EntryResultEntry, resolveForRowSpec(EntryResultEntry, p4), p5 or {})
		end,
		getMessageIdFromDisplayId = function(p3)
			-- upvalues: Computed (copy)
			if p3 == nil then
				return nil
			else
				local IdToHandleEntry = Computed(false).idToHandle[p3]
				
				return if IdToHandleEntry then IdToHandleEntry.messageId else nil
			end
		end
	}
end