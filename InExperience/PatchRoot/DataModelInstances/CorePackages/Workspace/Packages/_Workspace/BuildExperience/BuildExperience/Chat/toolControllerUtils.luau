local _ = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)

return {
	awaitRequestState = function(p1, p2)
		while p1(false).status == "pending" do
			if p2 > os.clock() then
				task.wait()
				continue
			end
			return p1(false)
		end
		return p1(false)
	end,
	getToolCallOrder = function(p3, p4)
		for i, v in p3.activityItems do
			if v.kind == "tool_call" and v.toolCallId == p4 then
				return i
			end
		end
		local t = {}
		
		for v in p3.toolCalls do
			table.insert(t, v)
		end
		table.sort(t)
		
		for v, v_1 in t do
			if v_1 == p4 then
				return v
			end
		end
		return 0
	end
}