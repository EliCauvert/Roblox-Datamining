local appChat = script:FindFirstAncestor("AppChat")
local signalsModule = require(appChat.Parent.Signals)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local getConversationMessageStoreModule = require(appChat.Stores.GetConversationMessageStore)
local createConversationViewModelStoreModule = require(script.createConversationViewModelStore)

return signalsModule.createComputed(function() --[[ line: 12 ]]
	-- upvalues: getConversationStoreModule (ref), getConversationMessageStoreModule (ref), createConversationViewModelStoreModule (ref)
	return createConversationViewModelStoreModule(getConversationStoreModule(false), getConversationMessageStoreModule(false))
end)