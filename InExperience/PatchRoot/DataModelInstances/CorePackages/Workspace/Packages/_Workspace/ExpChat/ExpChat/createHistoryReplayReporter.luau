local ExpChatSharedModule = require(script:FindFirstAncestor("ExpChat").Parent.ExpChatShared)

return function(p1)
	-- upvalues: ExpChatSharedModule (copy)
	local GetHistoricalCount = p1 and p1.getHistoricalCount
	local Clock = p1 and p1.clock or os.clock
	local Report = p1 and p1.report or ExpChatSharedModule.Analytics.reportHistoryReplayed
	local ClockResult = Clock()
	local Total = 0
	
	return function(Amount)
		-- upvalues: Total (ref), Report (copy), GetHistoricalCount (copy), Clock (copy), ClockResult (copy)
		Total += Amount
		Report(Total, if GetHistoricalCount then GetHistoricalCount() else 0, (math.round((Clock() - ClockResult) * 1000)))
	end
end