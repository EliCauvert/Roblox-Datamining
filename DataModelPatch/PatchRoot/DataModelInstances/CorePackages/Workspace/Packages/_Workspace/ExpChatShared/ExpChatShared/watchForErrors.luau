local AnalyticsModule = require(script:FindFirstAncestor("ExpChatShared").Analytics)

return function(p1, p2, p3)
	-- upvalues: AnalyticsModule (copy)
	p1.Error:Connect(function(_, Text: string, SourceScript)
		-- upvalues: p2 (copy), p3 (copy), AnalyticsModule (upval)
		if SourceScript == p2 or Text and string.find(Text, "ExpChat") then
			AnalyticsModule.reportCounter(if p3 then "expChatErrorCountServer" else "expChatErrorCountClient")
		end
	end)
end