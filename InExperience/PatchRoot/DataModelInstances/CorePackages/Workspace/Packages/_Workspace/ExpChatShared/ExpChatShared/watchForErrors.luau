local analyticsModule = require(script:FindFirstAncestor("ExpChatShared").Analytics)

return function(p0, p1, p2) --[[ line: 4 ]]
	-- upvalues: analyticsModule (ref)
	p0.Error:Connect(function(_, p3, p4) --[[ line: 5 ]]
		-- upvalues: p1 (ref), p2 (ref), analyticsModule (copy)
		if p4 == p1 or p3 and string.find(p3, "ExpChat") then
			analyticsModule.reportCounter(if p2 then "expChatErrorCountServer" else "expChatErrorCountClient")
		end
	end)
end