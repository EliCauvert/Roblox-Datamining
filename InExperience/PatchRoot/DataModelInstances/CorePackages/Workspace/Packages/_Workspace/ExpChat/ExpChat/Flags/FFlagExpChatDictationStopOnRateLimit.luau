local FFlagExpChatDictationStateStore = require(script:FindFirstAncestor("ExpChat").Parent.SharedFlags).FFlagExpChatDictationStateStore

return game:DefineFastFlag("ExpChatDictationStopOnRateLimit", false) and FFlagExpChatDictationStateStore