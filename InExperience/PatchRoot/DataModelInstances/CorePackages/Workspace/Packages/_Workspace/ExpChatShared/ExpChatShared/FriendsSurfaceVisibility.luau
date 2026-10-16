local Signal, Signal2 = require(script:FindFirstAncestor("ExpChatShared").Parent.Signals).createSignal(nil)

return {
	getVisibleConversationId = Signal,
	setVisibleConversationId = Signal2
}