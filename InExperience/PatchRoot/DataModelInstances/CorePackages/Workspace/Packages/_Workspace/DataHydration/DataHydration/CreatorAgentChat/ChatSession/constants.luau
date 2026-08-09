game:DefineFastInt("CreatorAgentChatRpcTimeoutSeconds", 30)
game:DefineFastInt("CreatorAgentChatRtnIdleFallbackSeconds", 10)
game:DefineFastInt("CreatorAgentChatPollMinIntervalSeconds", 2)
game:DefineFastInt("CreatorAgentChatPollMaxIntervalSeconds", 30)
game:DefineFastInt("CreatorAgentChatPollBackoffMultiplier", 2)
game:DefineFastInt("CreatorAgentChatMaxReconciliationHistoryPages", 3)
game:DefineFastInt("CreatorAgentChatMaxCachedSessionHistories", 5)
game:DefineFastInt("CreatorAgentChatPrefetchHistoryPagesOnRefresh", 1)

return {
	getRpcTimeoutSeconds = function() --[[ line: 13 ]]
		return game:GetFastInt("CreatorAgentChatRpcTimeoutSeconds")
	end,
	getRtnIdleFallbackSeconds = function() --[[ line: 17 ]]
		return game:GetFastInt("CreatorAgentChatRtnIdleFallbackSeconds")
	end,
	getPollMinIntervalSeconds = function() --[[ line: 21 ]]
		return game:GetFastInt("CreatorAgentChatPollMinIntervalSeconds")
	end,
	getPollMaxIntervalSeconds = function() --[[ line: 25 ]]
		return game:GetFastInt("CreatorAgentChatPollMaxIntervalSeconds")
	end,
	getPollBackoffMultiplier = function() --[[ line: 29 ]]
		return game:GetFastInt("CreatorAgentChatPollBackoffMultiplier")
	end,
	getMaxReconciliationHistoryPages = function() --[[ line: 33 ]]
		return game:GetFastInt("CreatorAgentChatMaxReconciliationHistoryPages")
	end,
	getMaxCachedSessionHistories = function() --[[ line: 37 ]]
		return game:GetFastInt("CreatorAgentChatMaxCachedSessionHistories")
	end,
	getPrefetchHistoryPagesOnRefresh = function() --[[ line: 41 ]]
		return game:GetFastInt("CreatorAgentChatPrefetchHistoryPagesOnRefresh")
	end
}