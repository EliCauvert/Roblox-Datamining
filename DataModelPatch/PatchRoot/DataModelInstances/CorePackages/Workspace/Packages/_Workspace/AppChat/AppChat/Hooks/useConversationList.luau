local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetConversationListStoreModule = require(AppChat.Stores.GetConversationListStore)
local config = {
	oldestConversationIsFetched = false,
	isFetchingConversations = false
}

return function(Enabled)
	-- upvalues: GetConversationListStoreModule (copy), ReactModule (copy), SignalsModule (copy), config (copy), SignalsReactModule (copy)
	local ConversationListStoreModule = GetConversationListStoreModule(false)
	local IsEnabled = Enabled ~= false
	
	return {
		items = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), IsEnabled (copy), ConversationListStoreModule (copy)
			return SignalsModule.createComputed(function(p1)
				-- upvalues: IsEnabled (upval), ConversationListStoreModule (upval)
				return if IsEnabled then ConversationListStoreModule.getConversations(p1) else {}
			end)
		end, { ConversationListStoreModule, IsEnabled }))),
		listStatus = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), IsEnabled (copy), config (upval), ConversationListStoreModule (copy)
			return SignalsModule.createComputed(function(p1)
				-- upvalues: IsEnabled (upval), config (upval), ConversationListStoreModule (upval)
				return if IsEnabled then ConversationListStoreModule.getListStatus(p1) else config
			end)
		end, { ConversationListStoreModule, IsEnabled })))
	}
end