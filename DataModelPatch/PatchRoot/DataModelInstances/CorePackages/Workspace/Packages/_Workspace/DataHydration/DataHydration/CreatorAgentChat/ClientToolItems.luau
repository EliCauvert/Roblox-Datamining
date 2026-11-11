local _ = require(script.Parent.types)
local StudioAskUserToolModule = require(script.Parent.StudioAskUserTool)
local StudioProposePlanToolModule = require(script.Parent.StudioProposePlanTool)
local SubagentTasksModule = require(script.Parent.SubagentTasks)

return {
	getAskItemKey = function(p1, p2): string
		return `ask-{p1.toolCallId or p1.question.id}-{p1.question.id}-{p2}`
	end,
	getPlanItemKey = function(p1): string
		return `plan-{p1.toolCallId or p1.title}`
	end,
	getSubagentTasksItemKey = function(): string
		return "subagent-tasks"
	end,
	getSubagentTasksCallOrder = function(p1)
		-- upvalues: SubagentTasksModule (copy)
		for i, activityItem in p1.activityItems do
			if activityItem.kind == "tool_call" and activityItem.title == SubagentTasksModule.TOOL_NAME then
				return i
			end
		end
		return 0
	end,
	sortClientToolItems = function(List)
		table.sort(List, function(A, B): boolean
			return if A.callOrder == B.callOrder then A.key < B.key else A.callOrder < B.callOrder
		end)
		
		return List
	end,
	makeAskItem = function(AnswerStackPrompt, p2, IsActive, p3)
		return {
			kind = "ask_user",
			key = `ask-{AnswerStackPrompt.toolCallId or AnswerStackPrompt.question.id}-{AnswerStackPrompt.question.id}-{p2}`,
			toolCallId = AnswerStackPrompt.toolCallId,
			callOrder = (AnswerStackPrompt.callOrder or p2) * 1000 + p2,
			isActive = IsActive,
			answerStackPrompt = AnswerStackPrompt,
			onAnswerSelected = if IsActive then p3 else nil
		}
	end,
	makePlanItem = function(AskItem, IsActive, p2)
		return {
			kind = "plan",
			key = `plan-{AskItem.toolCallId or AskItem.title}`,
			toolCallId = AskItem.toolCallId,
			callOrder = (AskItem.callOrder or 0) * 1000,
			isActive = IsActive,
			planProposal = AskItem,
			onPlanAccepted = if IsActive then p2 else nil
		}
	end,
	makeSubagentTasksItem = function(SubagentTaskState, p2: number, IsActive)
		return {
			kind = "subagent_tasks",
			toolCallId = nil,
			key = "subagent-tasks",
			callOrder = p2 * 1000,
			isActive = IsActive,
			subagentTaskState = SubagentTaskState
		}
	end,
	getCompletedItemsFromTurnState = function(p2)
		-- upvalues: StudioAskUserToolModule (copy), StudioProposePlanToolModule (copy), SubagentTasksModule (copy)
		local List = {}
		
		for i, AnswerStackPrompt in StudioAskUserToolModule.getAnsweredPromptsFromTurnState(p2) do
			table.insert(List, {
				kind = "ask_user",
				isActive = false,
				onAnswerSelected = nil,
				key = `ask-{AnswerStackPrompt.toolCallId or AnswerStackPrompt.question.id}-{AnswerStackPrompt.question.id}-{i}`,
				toolCallId = AnswerStackPrompt.toolCallId,
				callOrder = (AnswerStackPrompt.callOrder or i) * 1000 + i,
				answerStackPrompt = AnswerStackPrompt
			})
		end
		for _, AskItem in StudioProposePlanToolModule.getCompletedPlansFromTurnState(p2) do
			table.insert(List, {
				kind = "plan",
				isActive = false,
				onPlanAccepted = nil,
				key = `plan-{AskItem.toolCallId or AskItem.title}`,
				toolCallId = AskItem.toolCallId,
				callOrder = (AskItem.callOrder or 0) * 1000,
				planProposal = AskItem
			})
		end
		local FromTurnStateResult = SubagentTasksModule.fromTurnState(p2)
		
		if FromTurnStateResult ~= nil then
			local v1 = 0
			
			for i1, activityItem in p2.activityItems do
				if activityItem.kind == "tool_call" and activityItem.title == SubagentTasksModule.TOOL_NAME then
					v1 = i1
					break
				end
			end
			table.insert(List, {
				kind = "subagent_tasks",
				toolCallId = nil,
				isActive = false,
				key = "subagent-tasks",
				callOrder = v1 * 1000,
				subagentTaskState = FromTurnStateResult
			})
		end
		table.sort(List, function(A, B): boolean
			return if A.callOrder == B.callOrder then A.key < B.key else A.callOrder < B.callOrder
		end)
		
		return List
	end
}