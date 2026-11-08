local FIntAppChatScrollToLatestThresholdPercentModule = require(script:FindFirstAncestor("AppChat").Flags.FIntAppChatScrollToLatestThresholdPercent)

return function(p1, p2: number, p3): boolean
	-- upvalues: FIntAppChatScrollToLatestThresholdPercentModule (copy)
	return p2 > 0 and p2 * math.max(0, p3 or FIntAppChatScrollToLatestThresholdPercentModule) / 100 < p1
end