local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local GetConversationListStoreModule = require(Parent.AppChat.GetConversationListStore)
local SignalsModule = require(Parent.Signals)
local FetchConversationListPageToSignalsModule = require(Parent.AppChat.fetchConversationListPageToSignals)
local ListRecipientsStatusModule = require(ShareSheet.Recipients.ListRecipientsStatus)
local _ = require(ShareSheet.Types)

return function() --[[ Line: 15 | Named "createChatInboxRecipientList" ]]
	-- upvalues: GetConversationListStoreModule (copy), SignalsModule (copy), ListRecipientsStatusModule (copy), FetchConversationListPageToSignalsModule (copy)
	local ConversationListStoreModule = GetConversationListStoreModule(false)
	local t = {}
	local Computed = SignalsModule.createComputed(function(p1) --[[ Line: 22 ]]
		-- upvalues: ConversationListStoreModule (copy), t (ref)
		local Conversations = ConversationListStoreModule.getConversations(p1)
		local Buffer = table.create(#Conversations)
		local t1 = {}
		
		for i, conversation in Conversations do
			local Entry = t[conversation] or { id = conversation.id, conversation = conversation }
			t1[conversation] = Entry
			Buffer[i] = Entry
		end
		t = t1
		
		return Buffer
	end)
	local Computed1 = SignalsModule.createComputed(function(p2) --[[ Line: 36 ]]
		-- upvalues: Computed (copy), ConversationListStoreModule (copy), ListRecipientsStatusModule (upval)
		local ComputedResult = Computed(p2)
		local ListStatus = ConversationListStoreModule.getListStatus(p2)
		local IsIsFetchingConversations = ListStatus.isFetchingConversations == true
		
		return {
			recipients = ComputedResult,
			status = if ListStatus.error == nil then if #ComputedResult == 0 and (IsIsFetchingConversations or ListStatus.hasFetchedInitialPage ~= true) then ListRecipientsStatusModule.Loading else ListRecipientsStatusModule.Ready else ListRecipientsStatusModule.Failed,
			nextPageToken = if ListStatus.oldestConversationIsFetched == true then nil else ListStatus.nextCursor,
			isFetchingNextPage = IsIsFetchingConversations
		}
	end)
	
	return {
		getResult = Computed1,
		refresh = function() --[[ Line: 55 ]]
			-- upvalues: FetchConversationListPageToSignalsModule (upval)
			FetchConversationListPageToSignalsModule()
		end,
		loadMore = function(Cursor) --[[ Line: 58 ]]
			-- upvalues: Computed1 (copy), FetchConversationListPageToSignalsModule (upval)
			if Computed1(false).nextPageToken == Cursor then
				FetchConversationListPageToSignalsModule({ cursor = Cursor })
			end
		end
	}
end