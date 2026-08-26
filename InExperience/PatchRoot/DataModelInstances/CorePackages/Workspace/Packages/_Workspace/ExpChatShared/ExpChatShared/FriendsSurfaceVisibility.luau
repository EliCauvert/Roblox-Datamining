local var1, var2 = require(script:FindFirstAncestor("ExpChatShared").Parent.Signals).createSignal(nil)

return {
	getVisibleConversationId = var1,
	setVisibleConversationId = var2
}