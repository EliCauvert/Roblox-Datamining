local FFlagAppChatSignalsMessageStoreModule = require(script:FindFirstAncestor("AppChat").Flags.FFlagAppChatSignalsMessageStore)

return game:DefineFastFlag("AppChatSignalsReplyStore", false) and FFlagAppChatSignalsMessageStoreModule