local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local getConversationListStoreModule = require(parent.AppChat.GetConversationListStore)
local signalsModule = require(parent.Signals)
local fetchConversationListPageToSignalsModule = require(parent.AppChat.fetchConversationListPageToSignals)
local listRecipientsStatusModule = require(shareSheet.Recipients.ListRecipientsStatus)
local _ = require(shareSheet.Types)

return function()
	-- upvalues: getConversationListStoreModule (ref), signalsModule (ref), listRecipientsStatusModule (ref), fetchConversationListPageToSignalsModule (ref)
	local var1 = getConversationListStoreModule(false)
	local t = {}
	local var2 = signalsModule.createComputed(function(p1)
		-- upvalues: var1 (ref), t (write)
		local conversations = var1.getConversations(p1)
		local list = table.create(#conversations)
		local t_1 = {}
		
		for i, v in conversations do
			local var3 = t[v] or { id = v.id, conversation = v }
			t_1[v] = var3
			list[i] = var3
		end
		t = t_1
		
		return list
	end)
	local var4 = signalsModule.createComputed(function(p2)
		-- upvalues: var2 (ref), var1 (ref), listRecipientsStatusModule (copy)
		local var5 = var2(p2)
		local listStatus = var1.getListStatus(p2)
		local var6 = listStatus.isFetchingConversations == true
		
		return {
			recipients = var5,
			status = if listStatus.error ~= nil then if #var5 == 0 and (var6 or listStatus.hasFetchedInitialPage ~= true) then listRecipientsStatusModule.Loading else listRecipientsStatusModule.Ready else listRecipientsStatusModule.Failed,
			nextPageToken = if listStatus.oldestConversationIsFetched == true then nil else listStatus.nextCursor,
			isFetchingNextPage = var6
		}
	end)
	
	return {
		getResult = var4,
		refresh = function()
			-- upvalues: fetchConversationListPageToSignalsModule (copy)
			fetchConversationListPageToSignalsModule()
		end,
		loadMore = function(p2)
			-- upvalues: var4 (ref), fetchConversationListPageToSignalsModule (copy)
			if var4(false).nextPageToken == p2 then
				fetchConversationListPageToSignalsModule({ cursor = p2 })
			end
		end
	}
end