local _ = require(script.Parent.types)
local studioAskUserToolModule = require(script.Parent.StudioAskUserTool)
local studioProposePlanToolModule = require(script.Parent.StudioProposePlanTool)
local subagentTasksModule = require(script.Parent.SubagentTasks)

return {
	getAskItemKey = function(p0, p1) --[[ line: 14 ]]
		return `ask-{p0.toolCallId or p0.question.id}-{p0.question.id}-{p1}`
	end,
	getPlanItemKey = function(p2) --[[ line: 18 ]]
		return `plan-{p2.toolCallId or p2.title}`
	end,
	getSubagentTasksItemKey = function() --[[ line: 22 ]]
		return "subagent-tasks"
	end,
	getSubagentTasksCallOrder = function(p3) --[[ line: 26 ]]
		-- upvalues: subagentTasksModule (ref)
		for i, v in p3.activityItems do
			if v.kind == "tool_call" and v.title == subagentTasksModule.TOOL_NAME then
				return i
			end
		end
		return 0
	end,
	sortClientToolItems = function(p4) --[[ line: 35 ]]
		table.sort(p4, function(p5, p6) --[[ line: 36 ]]
			return if p5.callOrder == p6.callOrder then p5.key < p6.key else p5.callOrder < p6.callOrder
		end)
		
		return p4
	end,
	makeAskItem = function(p7, p8, p9, p10) --[[ line: 45 ]]
		return {
			kind = "ask_user",
			key = `ask-{p7.toolCallId or p7.question.id}-{p7.question.id}-{p8}`,
			toolCallId = p7.toolCallId,
			callOrder = (p7.callOrder or p8) * 1000 + p8,
			isActive = p9,
			answerStackPrompt = p7,
			onAnswerSelected = if p9 then p10 else nil
		}
	end,
	makePlanItem = function(p11, p12, p13) --[[ line: 62 ]]
		return {
			kind = "plan",
			key = `plan-{p11.toolCallId or p11.title}`,
			toolCallId = p11.toolCallId,
			callOrder = (p11.callOrder or 0) * 1000,
			isActive = p12,
			planProposal = p11,
			onPlanAccepted = if p12 then p13 else nil
		}
	end,
	makeSubagentTasksItem = function(p14, p15, p16) --[[ line: 74 ]]
		return {
			kind = "subagent_tasks",
			toolCallId = nil,
			key = "subagent-tasks",
			callOrder = p15 * 1000,
			isActive = p16,
			subagentTaskState = p14
		}
	end,
	getCompletedItemsFromTurnState = function(p17) --[[ line: 85 ]]
		-- upvalues: studioAskUserToolModule (ref), studioProposePlanToolModule (ref), subagentTasksModule (ref)
		local t = {}
		
		for i, v in studioAskUserToolModule.getAnsweredPromptsFromTurnState(p17) do
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
		for i_1, v_1 in studioProposePlanToolModule.getCompletedPlansFromTurnState(p17) do
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
		local var4 = subagentTasksModule.fromTurnState(p17)
		
		if var4 ~= nil then
			local var5
			for i_2, v_2 in p17.activityItems do
				if v_2.kind == "tool_call" and v_2.title == subagentTasksModule.TOOL_NAME then
					var5 = i_2
					table.insert(t, {
						kind = "subagent_tasks",
						toolCallId = nil,
						isActive = false,
						key = "subagent-tasks",
						callOrder = var5 * 1000,
						subagentTaskState = var4
					})
				end
			end
			var5 = 0
		end
		table.sort(t, function(p18, p19) --[[ line: 36 ]]
			return if p18.callOrder == p19.callOrder then p18.key < p19.key else p18.callOrder < p19.callOrder
		end)
		
		return t
	end
}