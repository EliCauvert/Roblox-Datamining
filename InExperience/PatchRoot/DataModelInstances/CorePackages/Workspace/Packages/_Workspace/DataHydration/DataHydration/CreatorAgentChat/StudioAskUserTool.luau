local FFlagCreatorAgentChatStrictAskUserToolNameModule = require(script.Parent.FFlagCreatorAgentChatStrictAskUserToolName)
local _ = require(script.Parent.types)
local HttpService = game:GetService("HttpService")
local AskUser: string = if require(script:FindFirstAncestor("DataHydration").Parent.SharedFlags).FFlagBuildExperienceClientDataModelTools then "ask_user" else "studio_ask_user"
local config = {
	single_select = "single_select",
	multi_select = "multi_select",
	free_text = "free_text"
}

local function _(Text: string): boolean
	-- upvalues: AskUser (copy)
	return typeof(Text) == "string" and string.lower(Text) == AskUser
end

local _ = function(Entry)
	return if typeof(Entry) == "table" then if typeof(Entry[1]) == "table" then Entry elseif typeof(Entry.questions) == "table" then Entry.questions elseif typeof(Entry.data) == "table" then Entry.data else nil else nil
end

local _ = function(p1, p2: number)
	-- upvalues: config (copy)
	local Entry = if typeof(p1) == "string" then config[p1] else nil
	
	return if Entry == nil then if p2 > 0 then "single_select" else "free_text" else Entry
end

local function toAnswerQuestions(Entry)
	-- upvalues: config (copy)
	local Entry1 = if typeof(Entry) == "table" then if typeof(Entry[1]) == "table" then Entry elseif typeof(Entry.questions) == "table" then Entry.questions elseif typeof(Entry.data) == "table" then Entry.data else nil else nil
	
	if typeof(Entry1) ~= "table" then
		return nil
	end
	local List = {}
	
	for i, value in Entry1 do
		if typeof(value) == "table" and typeof(value.question) == "string" then
			local Options = {}
			local Options1 = value.options
			
			if typeof(Options1) == "table" then
				for i1, value1 in Options1 do
					if typeof(value1) == "table" and typeof(value1.optionText) == "string" then
						table.insert(Options, {
							id = `q{i}-o{i1}`,
							title = value1.optionText,
							description = if typeof(value1.clarificationText) == "string" then value1.clarificationText else ""
						})
					end
				end
			end
			local ResponseType = value.responseType
			local CountOptions = #Options
			local Entry2 = if typeof(ResponseType) == "string" then config[ResponseType] else nil
			table.insert(List, {
				id = `q{i}`,
				question = value.question,
				options = Options,
				responseType = if Entry2 == nil then if CountOptions > 0 then "single_select" else "free_text" else Entry2
			})
		end
	end
	return if #List > 0 then List else nil
end

local function extractQuestionsFromToolCall(ToolCall)
	-- upvalues: toAnswerQuestions (copy), AskUser (copy), FFlagCreatorAgentChatStrictAskUserToolNameModule (copy)
	local AnswerQuestions = toAnswerQuestions(ToolCall.rawInput)
	
	if AnswerQuestions == nil then
		return nil
	end
	local Kind: string = ToolCall.kind
	
	if typeof(Kind) ~= "string" or string.lower(Kind) ~= AskUser then
		local Title: string = ToolCall.title
		
		if typeof(Title) ~= "string" or string.lower(Title) ~= AskUser then
			local RawInput = ToolCall.rawInput
			repeat
				if typeof(RawInput) ~= "table" then break end
				local Name: string = RawInput.name
				
				if typeof(Name) ~= "string" or string.lower(Name) ~= AskUser then
					local ToolName: string = RawInput.toolName
					
					if typeof(ToolName) ~= "string" or string.lower(ToolName) ~= AskUser then continue end
				end
				return AnswerQuestions
			until true
			return if FFlagCreatorAgentChatStrictAskUserToolNameModule then nil else AnswerQuestions
		end
	end
	return AnswerQuestions
end

local _ = function(p1)
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(HttpService.JSONDecode, HttpService, p1)
	
	return if Success and typeof(Result) == "table" and typeof(Result.text) == "string" then Result.text else nil
end

local function getPersistedToolResultText(ToolCall)
	-- upvalues: HttpService (copy)
	if ToolCall.content == nil then
		return nil
	end
	local List = {}
	
	for _, value in ToolCall.content do
		if value.type == "content" and value.content ~= nil then
			local Content = value.content
			
			if Content.type == "text" and typeof(Content.text) == "string" then
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, Content.text)
				local Text = if Success and typeof(Result) == "table" and typeof(Result.text) == "string" then Result.text else nil
				
				if Text ~= nil and Text ~= "" then
					table.insert(List, Text)
				end
			end
		end
	end
	return if #List > 0 then table.concat(List) else nil
end

local function formatToolResultText(List)
	-- upvalues: HttpService (copy)
	local List1 = {}
	
	for _, value in List do
		local Options = value.options
		
		if Options ~= nil and #Options > 0 then
			local SelectedOptionId = {}
			local List2 = {}
			
			for _, option in Options do
				table.insert(SelectedOptionId, option.id)
				table.insert(List2, option.title)
			end
			table.insert(List1, {
				questionId = value.question.id,
				selectedOptionId = SelectedOptionId,
				content = table.concat(List2, ", ")
			})
		elseif value.option ~= nil then
			local Option = value.option
			table.insert(List1, {
				questionId = value.question.id,
				selectedOptionId = Option.id,
				content = Option.title
			})
		elseif value.customResponseText ~= nil then
			table.insert(List1, {
				questionId = value.question.id,
				content = value.customResponseText
			})
		end
	end
	return HttpService:JSONEncode({ answers = List1 })
end

local _ = function(p1, Id)
	if Id == nil then
		return nil
	end
	for _, option in p1.options do
		if option.id == Id then
			return option
		end
	end
	return nil
end

local function findSelectedOptionsByIds(Question, SelectedOptionId)
	local t = {}
	
	for _, option in Question.options do
		t[option.id] = option
	end
	local List = {}
	
	for _, value in SelectedOptionId do
		local Entry = t[value]
		
		if Entry == nil then
			return nil
		end
		table.insert(List, Entry)
	end
	return List
end

local function normalizeSelectedOptionId(SelectedOptionId)
	if typeof(SelectedOptionId) == "string" then
		return SelectedOptionId
	end
	if typeof(SelectedOptionId) ~= "table" then
		return nil
	end
	local List = {}
	
	for _, value in SelectedOptionId do
		if typeof(value) ~= "string" then
			return nil
		end
		table.insert(List, value)
	end
	return if #List > 0 then List else nil
end

local function getAnswersByQuestionId(p2)
	-- upvalues: HttpService (copy), normalizeSelectedOptionId (copy)
	local t = {}
	local Success, Result = pcall(HttpService.JSONDecode, HttpService, p2)
	
	if not Success or typeof(Result) ~= "table" then
		return t
	end
	local Answers = Result.answers
	
	if typeof(Answers) ~= "table" then
		return t
	end
	for _, answer in Answers do
		if typeof(answer) == "table" and typeof(answer.questionId) == "string" and typeof(answer.content) == "string" then
			t[answer.questionId] = {
				questionId = answer.questionId,
				selectedOptionId = normalizeSelectedOptionId(answer.selectedOptionId),
				content = answer.content
			}
		end
	end
	return t
end

local function getPromptFromToolResult(Question, p3, ToolCallId, CallOrder)
	-- upvalues: findSelectedOptionsByIds (copy)
	if p3 == nil then
		return nil
	end
	local SelectedOptionId = p3.selectedOptionId
	
	if typeof(SelectedOptionId) == "table" then
		return if findSelectedOptionsByIds(Question, SelectedOptionId) == nil then nil else {
			question = Question,
			selectedOptionId = SelectedOptionId,
			toolCallId = ToolCallId,
			callOrder = CallOrder
		}
	end
	local v1 = nil
	if SelectedOptionId == nil then
		v1 = nil
	else
		v1 = nil
		
		for _, option in Question.options do
			if option.id == SelectedOptionId then
				v1 = option
				break
			end
		end
	end
	return if SelectedOptionId == nil or v1 ~= nil then {
		question = Question,
		selectedOptionId = if v1 == nil then nil else v1.id,
		customResponseText = if v1 == nil then p3.content else nil,
		toolCallId = ToolCallId,
		callOrder = CallOrder
	} else nil
end

local function getToolCallOrder(p4, ToolCallId)
	if p4.activityItems ~= nil then
		for i, activityItem in p4.activityItems do
			if activityItem.kind == "tool_call" and activityItem.toolCallId == ToolCallId then
				return i
			end
		end
	end
	local List = {}
	
	for toolCall in p4.toolCalls do
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

return {
	CANCELLATION_TEXT = "User cancelled answering the question",
	TOOL_NAME = AskUser,
	LOCAL_TOOL_DEFINITION = {
		name = AskUser,
		inputSchema = {
			type = "array",
			items = {
				type = "object",
				required = { "question", "options" },
				properties = {
					question = { type = "string" },
					responseType = {
						type = "string",
						enum = { "single_select", "multi_select", "free_text" }
					},
					options = {
						type = "array",
						items = {
							type = "object",
							required = { "optionText" },
							properties = {
								optionText = { type = "string" },
								clarificationText = { type = "string" }
							}
						}
					}
				}
			}
		}
	},
	extractQuestionsFromToolCall = extractQuestionsFromToolCall,
	findQuestionsInTurnState = function(p5, p6)
		-- upvalues: getPersistedToolResultText (copy), extractQuestionsFromToolCall (copy)
		local List = {}
		
		for toolCall in p5.toolCalls do
			table.insert(List, toolCall)
		end
		table.sort(List)
		local ToolCall = nil
		local ExtractQuestionsFromToolCallResult = nil
		
		for _, value in List do
			local IsCompleted = p6 and p6[value]
			
			if not IsCompleted then
				ToolCall = p5.toolCalls[value]
				IsCompleted = ToolCall.status == "completed" or ToolCall.status == "failed" or ToolCall.status == "cancelled" or getPersistedToolResultText(ToolCall) ~= nil
			end
			local NoExtractQuestionsFromToolCallResult: boolean = IsCompleted
			
			if not NoExtractQuestionsFromToolCallResult then
				ExtractQuestionsFromToolCallResult = extractQuestionsFromToolCall(ToolCall)
				NoExtractQuestionsFromToolCallResult = ExtractQuestionsFromToolCallResult == nil
			end
			if not NoExtractQuestionsFromToolCallResult then
				return ExtractQuestionsFromToolCallResult, value, ToolCall.rawInput, ToolCall.turnId, ToolCall.referenceId
			end
		end
		return nil, nil, nil, nil, nil
	end,
	formatToolResultText = formatToolResultText,
	formatToolResultContent = function(p7)
		-- upvalues: formatToolResultText (copy)
		return { text = formatToolResultText(p7) }
	end,
	getAnsweredPromptsFromTurnState = function(p7)
		-- upvalues: extractQuestionsFromToolCall (copy), getPersistedToolResultText (copy), getAnswersByQuestionId (copy), getPromptFromToolResult (copy), getToolCallOrder (copy)
		local List = {}
		local List1 = {}
		
		for toolCall in p7.toolCalls do
			table.insert(List1, toolCall)
		end
		table.sort(List1)
		
		for _, ToolCallId in List1 do
			local ToolCall = p7.toolCalls[ToolCallId]
			local ExtractQuestionsFromToolCallResult = extractQuestionsFromToolCall(ToolCall)
			local PersistedToolResultText = getPersistedToolResultText(ToolCall)
			
			if ExtractQuestionsFromToolCallResult ~= nil and PersistedToolResultText ~= nil then
				local AnswersByQuestionId = getAnswersByQuestionId(PersistedToolResultText)
				
				for _, value in ExtractQuestionsFromToolCallResult do
					local PromptFromToolResult = getPromptFromToolResult(value, AnswersByQuestionId[value.id], ToolCallId, (getToolCallOrder(p7, ToolCallId)))
					
					if PromptFromToolResult ~= nil then
						table.insert(List, PromptFromToolResult)
					end
				end
			end
		end
		return List
	end,
	formatCancellationContent = function()
		return { text = "User cancelled answering the question" }
	end
}