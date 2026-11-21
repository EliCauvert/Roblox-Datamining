local BuildExperience = script:FindFirstAncestor("BuildExperience")
local CreatorAgentChatModule = require(BuildExperience.Parent.DataHydration.CreatorAgentChat)
local _ = require(script.Parent.chatTypes)
local FFlagBuildExperienceDevProductRecoveryModule = require(BuildExperience.Flags.FFlagBuildExperienceDevProductRecovery)

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

local function areFieldsEqual(DevProduct, DevProduct1): boolean
	if DevProduct == DevProduct1 then
		return true
	end
	if DevProduct == nil or DevProduct1 == nil then
		return false
	end
	for i, value in DevProduct do
		if DevProduct1[i] ~= value then
			return false
		end
	end
	for i1 in DevProduct1 do
		if DevProduct[i1] == nil then
			return false
		end
	end
	return true
end

local config = {
	manage_developer_product = "manage_developer_product",
	manage_game_pass = "manage_game_pass",
	manage_subscription = "manage_subscription",
	manage_monetization = "manage_monetization"
}

local function getProductToolName(p3)
	-- upvalues: config (copy)
	local RawInput = p3.rawInput
	local List = { p3.title, p3.kind }
	
	if typeof(RawInput) == "table" then
		table.insert(List, RawInput.name)
		table.insert(List, RawInput.toolName)
	end
	for _, Text in List do
		if typeof(Text) == "string" and config[string.lower(Text)] ~= nil then
			return config[string.lower(Text)]
		end
	end
	return nil
end

return {
	areStepsEqual = function(List, List1): boolean
		-- upvalues: areFieldsEqual (copy)
		if List == List1 then
			return true
		end
		if List == nil or List1 == nil then
			return false
		end
		for i, value in List do
			local Entry = List1[i]
			
			if Entry == nil or value.isWaiting ~= Entry.isWaiting or value.isFailed ~= Entry.isFailed then
				return false
			end
			if not areFieldsEqual(value.devProduct, Entry.devProduct) then
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
	getPlanBody = function(p4)
		local List = {}
		
		if p4.isDefaultTitle ~= true and p4.title ~= "" then
			table.insert(List, p4.title)
		end
		if p4.summary ~= nil and p4.summary ~= "" then
			table.insert(List, p4.summary)
		end
		return {
			text = if #List > 0 then table.concat(List, "\n\n") else nil,
			markdown = if p4.textContent == "" then nil else p4.textContent
		}
	end,
	getPromptToolName = function(p4)
		-- upvalues: CreatorAgentChatModule (copy)
		return if p4 == nil then nil elseif CreatorAgentChatModule.StudioAskUserTool.toolCallLooksLikeAskUser(p4) then CreatorAgentChatModule.StudioAskUserTool.TOOL_NAME elseif CreatorAgentChatModule.StudioProposePlanTool.toolCallLooksLikeProposePlan(p4) then CreatorAgentChatModule.StudioProposePlanTool.TOOL_NAME else nil
	end,
	getDevProductToolName = function(p4)
		-- upvalues: getProductToolName (copy)
		local ProductToolName = if p4 == nil then nil else getProductToolName(p4)
		
		if ProductToolName == nil or p4 == nil or typeof(p4.rawInput) ~= "table" then
			return nil
		else
			local Action: string = p4.rawInput.action
			
			return if typeof(Action) == "string" and string.lower(Action) ~= "list" then ProductToolName else nil
		end
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
	fromDevProduct = function(DevProduct, p4, p5, p6)
		-- upvalues: FFlagBuildExperienceDevProductRecoveryModule (copy)
		local DevProductProposal = if p4 == nil then nil else p4.devProductProposal
		
		if p4 == nil or DevProductProposal == nil then
			local NoP7: boolean = p5 and not p6
			
			return {
				isWaiting = NoP7,
				devProduct = if NoP7 then nil else DevProduct
			}
		elseif p4.isActive then
			return { isWaiting = true }
		else
			local IsIsPending: boolean = DevProductProposal.isApproved == true and (if FFlagBuildExperienceDevProductRecoveryModule then DevProductProposal.isPending == true else not p6)
			local IsHasError: boolean = not IsIsPending and DevProductProposal.hasError == true
			
			return {
				isWaiting = IsIsPending,
				devProduct = DevProduct,
				isFailed = if IsHasError then true else nil
			}
		end
	end,
	keepsCard = function(p4): boolean
		return if p4.isActive then true else p4.planProposal ~= nil and p4.planProposal.feedbackText ~= nil
	end
}