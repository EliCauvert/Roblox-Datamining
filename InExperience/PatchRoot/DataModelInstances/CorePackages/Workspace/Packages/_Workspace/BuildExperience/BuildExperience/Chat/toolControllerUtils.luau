local _ = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)

return {
	awaitRequestState = function(p0, p1)
		while p0(false).status == "pending" do
			if p1 > os.clock() then
				task.wait()
				continue
			end
			return p0(false)
		end
		return p0(false)
	end,
	getToolCallOrder = function(p2, p3)
		for i, v in p2.activityItems do
			if v.kind == "tool_call" and v.toolCallId == p3 then
				return i
			end
		end
		local t = {}
		
		for v in p2.toolCalls do
			table.insert(t, v)
		end
		table.sort(t)
		
		for v, v_1 in t do
			if v_1 == p3 then
				return v
			end
		end
		return 0
	end
}