local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local GetConversationListStoreModule = require(Parent.AppChat.GetConversationListStore)
local SignalsModule = require(Parent.Signals)
local FetchConversationListPageToSignalsModule = require(Parent.AppChat.fetchConversationListPageToSignals)
local ListRecipientsStatusModule = require(ShareSheet.Recipients.ListRecipientsStatus)
local RecipientModule = require(ShareSheet.Recipients.Recipient)
local _ = require(ShareSheet.Types)

return function()
	-- upvalues: GetConversationListStoreModule (copy), SignalsModule (copy), RecipientModule (copy), ListRecipientsStatusModule (copy), FetchConversationListPageToSignalsModule (copy)
	local ConversationListStoreModule = GetConversationListStoreModule(false)
	local t = {}
	local Computed = SignalsModule.createComputed(function(p1)
		-- upvalues: ConversationListStoreModule (copy), t (ref), RecipientModule (upval)
		local Conversations = ConversationListStoreModule.getConversations(p1)
		local Buffer = table.create(#Conversations)
		local t1 = {}
		
		for i, conversation in Conversations do
			local Entry = t[conversation] or RecipientModule.fromConversation(conversation)
			t1[conversation] = Entry
			Buffer[i] = Entry
		end
		t = t1
		
		return Buffer
	end)
	local Computed1 = SignalsModule.createComputed(function(p2)
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
		refresh = function()
			-- upvalues: FetchConversationListPageToSignalsModule (upval)
			FetchConversationListPageToSignalsModule()
		end,
		loadMore = function(Cursor)
			-- upvalues: Computed1 (copy), FetchConversationListPageToSignalsModule (upval)
			if Computed1(false).nextPageToken == Cursor then
				FetchConversationListPageToSignalsModule({ cursor = Cursor })
			end
		end
	}
end