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
	getRpcTimeoutSeconds = function() --[[ Line: 13 ]]
		return game:GetFastInt("CreatorAgentChatRpcTimeoutSeconds")
	end,
	getRtnIdleFallbackSeconds = function() --[[ Line: 17 ]]
		return game:GetFastInt("CreatorAgentChatRtnIdleFallbackSeconds")
	end,
	getRtnSequenceGapFallbackSeconds = function() --[[ Line: 21 ]]
		return game:GetFastInt("CreatorAgentChatRtnSequenceGapFallbackSeconds")
	end,
	getPollMinIntervalSeconds = function() --[[ Line: 25 ]]
		return game:GetFastInt("CreatorAgentChatPollMinIntervalSeconds")
	end,
	getPollMaxIntervalSeconds = function() --[[ Line: 29 ]]
		return game:GetFastInt("CreatorAgentChatPollMaxIntervalSeconds")
	end,
	getPollBackoffMultiplier = function() --[[ Line: 33 ]]
		return game:GetFastInt("CreatorAgentChatPollBackoffMultiplier")
	end,
	getMaxReconciliationHistoryPages = function() --[[ Line: 37 ]]
		return game:GetFastInt("CreatorAgentChatMaxReconciliationHistoryPages")
	end,
	getMaxCachedSessionHistories = function() --[[ Line: 41 ]]
		return game:GetFastInt("CreatorAgentChatMaxCachedSessionHistories")
	end,
	getPrefetchHistoryPagesOnRefresh = function() --[[ Line: 45 ]]
		return game:GetFastInt("CreatorAgentChatPrefetchHistoryPagesOnRefresh")
	end
}