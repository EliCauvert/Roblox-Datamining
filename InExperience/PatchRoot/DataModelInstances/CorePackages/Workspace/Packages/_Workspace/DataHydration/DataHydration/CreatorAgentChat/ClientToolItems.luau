local _ = require(script.Parent.types)
local studioAskUserToolModule = require(script.Parent.StudioAskUserTool)
local studioProposePlanToolModule = require(script.Parent.StudioProposePlanTool)
local subagentTasksModule = require(script.Parent.SubagentTasks)

return {
	getAskItemKey = function(p1, p2)
		return `ask-{p1.toolCallId or p1.question.id}-{p1.question.id}-{p2}`
	end,
	getPlanItemKey = function(p1)
		return `plan-{p1.toolCallId or p1.title}`
	end,
	getSubagentTasksItemKey = function()
		return "subagent-tasks"
	end,
	getSubagentTasksCallOrder = function(p1)
		-- upvalues: subagentTasksModule (ref)
		for i, v in p1.activityItems do
			if v.kind == "tool_call" and v.title == subagentTasksModule.TOOL_NAME then
				return i
			end
		end
		return 0
	end,
	sortClientToolItems = function(p2)
		table.sort(p2, function(p3, p4)
			return if p3.callOrder == p4.callOrder then p3.key < p4.key else p3.callOrder < p4.callOrder
		end)
		
		return p2
	end,
	makeAskItem = function(p2, p3, p4, p5)
		return {
			kind = "ask_user",
			key = `ask-{p2.toolCallId or p2.question.id}-{p2.question.id}-{p3}`,
			toolCallId = p2.toolCallId,
			callOrder = (p2.callOrder or p3) * 1000 + p3,
			isActive = p4,
			answerStackPrompt = p2,
			onAnswerSelected = if p4 then p5 else nil
		}
	end,
	makePlanItem = function(p2, p3, p4)
		return {
			kind = "plan",
			key = `plan-{p2.toolCallId or p2.title}`,
			toolCallId = p2.toolCallId,
			callOrder = (p2.callOrder or 0) * 1000,
			isActive = p3,
			planProposal = p2,
			onPlanAccepted = if p3 then p4 else nil
		}
	end,
	makeSubagentTasksItem = function(p2, p3, p4)
		return {
			kind = "subagent_tasks",
			toolCallId = nil,
			key = "subagent-tasks",
			callOrder = p3 * 1000,
			isActive = p4,
			subagentTaskState = p2
		}
	end,
	getCompletedItemsFromTurnState = function(p2)
		-- upvalues: studioAskUserToolModule (ref), studioProposePlanToolModule (ref), subagentTasksModule (ref)
		local t = {}
		
		for i, v in studioAskUserToolModule.getAnsweredPromptsFromTurnState(p2) do
			table.insert(t, {
				kind = "ask_user",
				isActive = false,
				onAnswerSelected = nil,
				key = `ask-{v.toolCallId or v.question.id}-{v.question.id}-{i}`,
				toolCallId = v.toolCallId,
				callOrder = (v.callOrder or i) * 1000 + i,
				answerStackPrompt = v
			})
		end
		for i_1, v_1 in studioProposePlanToolModule.getCompletedPlansFromTurnState(p2) do
			table.insert(t, {
				kind = "plan",
				isActive = false,
				onPlanAccepted = nil,
				key = `plan-{v_1.toolCallId or v_1.title}`,
				toolCallId = v_1.toolCallId,
				callOrder = (v_1.callOrder or 0) * 1000,
				planProposal = v_1
			})
		end
		local var1 = subagentTasksModule.fromTurnState(p2)
		
		if var1 ~= nil then
			local var2
			for i_2, v_2 in p2.activityItems do
				if v_2.kind == "tool_call" and v_2.title == subagentTasksModule.TOOL_NAME then
					var2 = i_2
					table.insert(t, {
						kind = "subagent_tasks",
						toolCallId = nil,
						isActive = false,
						key = "subagent-tasks",
						callOrder = var2 * 1000,
						subagentTaskState = var1
					})
				end
			end
			var2 = 0
		end
		table.sort(t, function(p3, p4)
			return if p3.callOrder == p4.callOrder then p3.key < p4.key else p3.callOrder < p4.callOrder
		end)
		
		return t
	end
}