game:DefineFastInt("CreatorAgentChatRpcTimeoutSeconds", 30)
game:DefineFastInt("CreatorAgentChatRtnIdleFallbackSeconds", 10)
game:DefineFastInt("CreatorAgentChatRtnSequenceGapFallbackSeconds", 10)
game:DefineFastInt("CreatorAgentChatPollMinIntervalSeconds", 2)
game:DefineFastInt("CreatorAgentChatPollMaxIntervalSeconds", 30)
game:DefineFastInt("CreatorAgentChatPollBackoffMultiplier", 2)
game:DefineFastInt("CreatorAgentChatMaxReconciliationHistoryPages", 3)
game:DefineFastInt("CreatorAgentChatMaxCachedSessionHistories", 5)
game:DefineFastInt("CreatorAgentChatPrefetchHistoryPagesOnRefresh", 1)

return {
	getRpcTimeoutSeconds = function()
		return game:GetFastInt("CreatorAgentChatRpcTimeoutSeconds")
	end,
	getRtnIdleFallbackSeconds = function()
		return game:GetFastInt("CreatorAgentChatRtnIdleFallbackSeconds")
	end,
	getRtnSequenceGapFallbackSeconds = function()
		return game:GetFastInt("CreatorAgentChatRtnSequenceGapFallbackSeconds")
	end,
	getPollMinIntervalSeconds = function()
		return game:GetFastInt("CreatorAgentChatPollMinIntervalSeconds")
	end,
	getPollMaxIntervalSeconds = function()
		return game:GetFastInt("CreatorAgentChatPollMaxIntervalSeconds")
	end,
	getPollBackoffMultiplier = function()
		return game:GetFastInt("CreatorAgentChatPollBackoffMultiplier")
	end,
	getMaxReconciliationHistoryPages = function()
		return game:GetFastInt("CreatorAgentChatMaxReconciliationHistoryPages")
	end,
	getMaxCachedSessionHistories = function()
		return game:GetFastInt("CreatorAgentChatMaxCachedSessionHistories")
	end,
	getPrefetchHistoryPagesOnRefresh = function()
		return game:GetFastInt("CreatorAgentChatPrefetchHistoryPagesOnRefresh")
	end
}