local FFlagExpChatIgnoreHistoricalMessagesModule = require(script:FindFirstAncestor("ExpChat").Flags.FFlagExpChatIgnoreHistoricalMessages)

return function(p1): boolean --[[ Line: 4 ]]
	-- upvalues: FFlagExpChatIgnoreHistoricalMessagesModule (copy)
	return FFlagExpChatIgnoreHistoricalMessagesModule and p1.IsHistorical == true
end