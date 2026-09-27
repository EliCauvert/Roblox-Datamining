local fFlagExpChatIgnoreHistoricalMessagesModule = require(script:FindFirstAncestor("ExpChat").Flags.FFlagExpChatIgnoreHistoricalMessages)

return function(p1)
	-- upvalues: fFlagExpChatIgnoreHistoricalMessagesModule (ref)
	return fFlagExpChatIgnoreHistoricalMessagesModule and p1.IsHistorical == true
end