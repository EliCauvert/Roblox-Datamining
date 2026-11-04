local FFlagAppChatSignalsActionHandlersModule = require(script:FindFirstAncestor("AppChat").Flags.FFlagAppChatSignalsActionHandlers)

return game:DefineFastFlag("AppChatUseSignalsForChatSettings", false) and FFlagAppChatSignalsActionHandlersModule