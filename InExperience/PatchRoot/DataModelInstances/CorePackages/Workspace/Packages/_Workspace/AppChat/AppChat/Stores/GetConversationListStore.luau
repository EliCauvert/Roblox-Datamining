local appChat = script:FindFirstAncestor("AppChat")
local signalsModule = require(appChat.Parent.Signals)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local createConversationListStoreModule = require(script.createConversationListStore)

return signalsModule.createComputed(function()
	-- upvalues: createConversationListStoreModule (ref), getConversationStoreModule (ref)
	return createConversationListStoreModule(getConversationStoreModule(false))
end)