local CreatorAgentChatModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.chatTypes)

local function getAnswerTexts(p1)
	local List = {}
	
	if p1.customResponseText ~= nil then
		table.insert(List, p1.customResponseText)
		
		return List
	end
	local SelectedOptionId = p1.selectedOptionId
	
	for _, option in p1.question.options do
		if if typeof(SelectedOptionId) == "table" then table.find(SelectedOptionId, option.id) ~= nil else SelectedOptionId == option.id then
			table.insert(List, option.title)
		end
	end
	return List
end

local function getAnswers(p2)
	-- upvalues: getAnswerTexts (copy)
	local List = {}
	
	if p2.isActive then
		return List
	end
	local AnsweredPrompts = if p2.answeredPrompts then if p2.answerStackPrompt == nil then p2.answeredPrompts else { p2.answerStackPrompt } elseif p2.answerStackPrompt == nil then {} else { p2.answerStackPrompt }
	for _, answeredPrompt in AnsweredPrompts do
		table.insert(List, {
			question = answeredPrompt.question.question,
			answers = getAnswerTexts(answeredPrompt)
		})
	end
	return List
end

return {
	areStepsEqual = function(List, List1): boolean
		if List == List1 then
			return true
		end
		if List == nil or List1 == nil then
			return false
		end
		for i, value in List do
			local Entry = List1[i]
			
			if Entry == nil or value.isWaiting ~= Entry.isWaiting then
				return false
			end
			local Plan = value.plan
			local Plan1 = Entry.plan
			
			if Plan ~= Plan1 and (Plan == nil or Plan1 == nil or Plan.title ~= Plan1.title or Plan.summary ~= Plan1.summary or Plan.textContent ~= Plan1.textContent or Plan.isDefaultTitle ~= Plan1.isDefaultTitle) then
				return false
			end
			local Answers = value.answers
			local Answers1 = Entry.answers
			
			if Answers == nil ~= (Answers1 == nil) then
				return false
			end
			if Answers ~= nil and Answers1 ~= nil then
				if #Answers ~= #Answers1 then
					return false
				end
				for i1, answer in Answers do
					local Answer = Answers1[i1]
					
					if answer.question ~= Answer.question or table.concat(answer.answers, "\n") ~= table.concat(Answer.answers, "\n") then
						return false
					end
				end
			end
		end
		for i2 in List1 do
			if List[i2] == nil then
				return false
			end
		end
		return true
	end,
	getPlanBody = function(p3)
		local List = {}
		
		if p3.isDefaultTitle ~= true and p3.title ~= "" then
			table.insert(List, p3.title)
		end
		if p3.summary ~= nil and p3.summary ~= "" then
			table.insert(List, p3.summary)
		end
		return {
			text = if #List > 0 then table.concat(List, "\n\n") else nil,
			markdown = if p3.textContent == "" then nil else p3.textContent
		}
	end,
	getPromptToolName = function(p3)
		-- upvalues: CreatorAgentChatModule (copy)
		return if p3 == nil then nil elseif CreatorAgentChatModule.StudioAskUserTool.toolCallLooksLikeAskUser(p3) then CreatorAgentChatModule.StudioAskUserTool.TOOL_NAME elseif CreatorAgentChatModule.StudioProposePlanTool.toolCallLooksLikeProposePlan(p3) then CreatorAgentChatModule.StudioProposePlanTool.TOOL_NAME else nil
	end,
	isStepSegments = function(List): boolean
		if #List == 0 then
			return false
		end
		for _, value in List do
			if value.devProductProposal ~= nil then
				return false
			end
		end
		return true
	end,
	fromSegments = function(List)
		-- upvalues: getAnswers (copy)
		local config = { isWaiting = false }
		local Answers = {}
		
		for _, value in List do
			if value.isActive then
				config.isWaiting = true
			end
			for _, value1 in getAnswers(value) do
				table.insert(Answers, value1)
			end
			local PlanProposal = value.planProposal
			
			if PlanProposal ~= nil and not value.isActive then
				config.plan = PlanProposal
			end
		end
		if #Answers > 0 then
			config.answers = Answers
		end
		return config
	end,
	keepsCard = function(p3): boolean
		return if p3.isActive then true else p3.planProposal ~= nil and p3.planProposal.feedbackText ~= nil
	end
}