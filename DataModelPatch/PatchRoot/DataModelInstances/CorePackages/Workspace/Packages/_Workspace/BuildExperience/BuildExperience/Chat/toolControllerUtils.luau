local _ = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)

return {
	awaitRequestState = function(Callback, p1)
		while Callback(false).status == "pending" do
			if p1 <= os.clock() then
				return Callback(false)
			end
			task.wait()
		end
		return Callback(false)
	end,
	getToolCallOrder = function(p2, ToolCallId)
		for i, activityItem in p2.activityItems do
			if activityItem.kind == "tool_call" and activityItem.toolCallId == ToolCallId then
				return i
			end
		end
		local List = {}
		
		for toolCall in p2.toolCalls do
			table.insert(List, toolCall)
		end
		table.sort(List)
		
		for i1, value in List do
			if value == ToolCallId then
				return i1
			end
		end
		return 0
	end
}