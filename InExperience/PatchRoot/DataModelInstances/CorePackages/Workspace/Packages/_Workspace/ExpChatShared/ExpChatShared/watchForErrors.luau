local analyticsModule = require(script:FindFirstAncestor("ExpChatShared").Analytics)

return function(p1, p2, p3)
	-- upvalues: analyticsModule (ref)
	p1.Error:Connect(function(_, p4, p5)
		-- upvalues: p2 (ref), p3 (ref), analyticsModule (copy)
		if p5 == p2 or p4 and string.find(p4, "ExpChat") then
			analyticsModule.reportCounter(if p3 then "expChatErrorCountServer" else "expChatErrorCountClient")
		end
	end)
end