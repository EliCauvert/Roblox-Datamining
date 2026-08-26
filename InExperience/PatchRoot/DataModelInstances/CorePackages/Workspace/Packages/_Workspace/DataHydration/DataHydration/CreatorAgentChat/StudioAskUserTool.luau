local parent = script:FindFirstAncestor("DataHydration").Parent
local fFlagCreatorAgentChatFilterTerminalClientToolsModule = require(script.Parent.FFlagCreatorAgentChatFilterTerminalClientTools)
local fFlagCreatorAgentChatStrictAskUserToolNameModule = require(script.Parent.FFlagCreatorAgentChatStrictAskUserToolName)
local fFlagBuildExperienceClientDataModelTools = require(parent.SharedFlags).FFlagBuildExperienceClientDataModelTools
local _ = require(script.Parent.types)
local httpService = game:GetService("HttpService")
local var1 = if fFlagBuildExperienceClientDataModelTools then "ask_user" else "studio_ask_user"
local t = {
	single_select = "single_select",
	multi_select = "multi_select",
	free_text = "free_text"
}
local t_1 = {
	name = var1,
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
}

local function _(p1)
	-- upvalues: var1 (ref)
	return typeof(p1) == "string" and string.lower(p1) == var1
end

local _ = function(p1)
	return if typeof(p1) == "table" then if typeof(p1[1]) == "table" then p1 elseif typeof(p1.questions) == "table" then p1.questions elseif typeof(p1.data) == "table" then p1.data else nil else nil
end

local _ = function(value, p1)
	-- upvalues: t (ref)
	local var2 = if typeof(value) == "string" then t[value] else nil
	
	return if var2 == nil then if p1 > 0 then "single_select" else "free_text" else var2
end

local function toAnswerQuestions(p1)
	-- upvalues: t (ref)
	local var2 = if typeof(p1) ~= "table" then if typeof(p1[1]) == "table" then p1 elseif typeof(p1.questions) == "table" then p1.questions elseif typeof(p1.data) == "table" then p1.data else nil else nil
	
	if typeof(var2) ~= "table" then
		return nil
	end
	local t_1 = {}
	
	for i, v in var2 do
		if typeof(v) == "table" and typeof(v.question) == "string" then
			local v_1
			local t_2 = {}
			local options = v.options
			
			if typeof(options) == "table" then
				for i_1, v_1 in options do
					if typeof(v_1) == "table" and typeof(v_1.optionText) == "string" then
						table.insert(t_2, {
							id = `q{i}-o{i_1}`,
							title = v_1.optionText,
							description = if typeof(v_1.clarificationText) == "string" then v_1.clarificationText else ""
						})
					end
				end
			end
			local t_3 = { id = `q{i}`, question = v.question, options = t_2 }
			v_1 = v.responseType
			local var3 = if typeof(v_1) == "string" then t[v_1] else nil
			t_3.responseType = if var3 == nil then if #t_2 > 0 then "single_select" else "free_text" else var3
			table.insert(t_1, t_3)
		end
	end
	return if #t_1 > 0 then t_1 else nil
end

local function extractQuestionsFromToolCall(p2)
	-- upvalues: toAnswerQuestions (ref), var1 (ref), fFlagCreatorAgentChatStrictAskUserToolNameModule (ref)
	local var4 = toAnswerQuestions(p2.rawInput)
	
	if var4 == nil then
		return nil
	end
	local kind = p2.kind
	
	if not (typeof(kind) == "string" and string.lower(kind) == var1) then
		kind = p2.title
		
		if typeof(kind) == "string" and string.lower(kind) == var1 then
			return var4
		end
		local rawInput = p2.rawInput
		
		if typeof(rawInput) == "table" then
			local name = rawInput.name
			
			if not (typeof(name) == "string" and string.lower(name) == var1) then
				name = rawInput.toolName
				
				return if typeof(name) == "string" and string.lower(name) == var1 then var4 elseif fFlagCreatorAgentChatStrictAskUserToolNameModule then nil else var4
			end
		end
	end
end

local _ = function(p2)
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, p2)
	
	return if not (not ok or typeof(status) ~= "table") then if typeof(status.text) == "string" then status.text else nil else nil
end

local function getPersistedToolResultText(p2)
	-- upvalues: httpService (ref)
	if p2.content == nil then
		return nil
	end
	local t = {}
	
	for i, v in p2.content do
		if v.type == "content" and v.content ~= nil then
			local content = v.content
			
			if content.type == "text" and typeof(content.text) == "string" then
				local ok, status = pcall(httpService.JSONDecode, httpService, content.text)
				local var4 = if ok and typeof(status) == "table" then if typeof(status.text) == "string" then status.text else nil else nil
				
				if var4 ~= nil and var4 ~= "" then
					table.insert(t, var4)
				end
			end
		end
	end
	return if #t > 0 then table.concat(t) else nil
end

local function findQuestionsInTurnState(p3, p4)
	-- upvalues: fFlagCreatorAgentChatFilterTerminalClientToolsModule (ref), getPersistedToolResultText (ref), extractQuestionsFromToolCall (ref)
	local t = {}
	
	for i in p3.toolCalls do
		table.insert(t, i)
	end
	table.sort(t)
	
	for i_1, v in t do
		if not p4 or not p4[v] then
			local var5 = p3.toolCalls[v]
			
			if (not fFlagCreatorAgentChatFilterTerminalClientToolsModule or var5.status ~= "completed" and var5.status ~= "failed" and var5.status ~= "cancelled") and getPersistedToolResultText(var5) == nil then
				local var6 = extractQuestionsFromToolCall(var5)
				
				if var6 ~= nil then
					return var6, v, var5.rawInput, var5.turnId, var5.referenceId
				end
			end
		end
	end
	return nil, nil, nil, nil, nil
end

local function formatToolResultText(p5)
	-- upvalues: httpService (ref)
	local t = {}
	
	for i, v in p5 do
		local options = v.options
		
		if options == nil or #options <= 0 then
			if v.option ~= nil then
				local option = v.option
				table.insert(t, {
					questionId = v.question.id,
					selectedOptionId = option.id,
					content = option.title
				})
			elseif v.customResponseText ~= nil then
				table.insert(t, {
					questionId = v.question.id,
					content = v.customResponseText
				})
			end
		end
		local t_1 = {}
		local t_2 = {}
		
		for i_1, v_1 in options do
			table.insert(t_1, v_1.id)
			table.insert(t_2, v_1.title)
		end
		table.insert(t, {
			questionId = v.question.id,
			selectedOptionId = t_1,
			content = table.concat(t_2, ", ")
		})
	end
	return httpService:JSONEncode({ answers = t })
end

local function formatToolResultContent(p6)
	-- upvalues: formatToolResultText (ref)
	return { text = formatToolResultText(p6) }
end

local _ = function(p6, p7)
	if p7 == nil then
		return nil
	end
	for i, v in p6.options do
		if v.id == p7 then
			return v
		end
	end
	return nil
end

local function findSelectedOptionsByIds(p8, p9)
	local t = {}
	
	for i, v in p8.options do
		t[v.id] = v
	end
	local t_1 = {}
	
	for i_1, v_1 in p9 do
		local var7 = t[v_1]
		
		if var7 ~= nil then
			table.insert(t_1, var7)
			continue
		end
		return nil
	end
	return t_1
end

local function normalizeSelectedOptionId(p10)
	if typeof(p10) == "string" then
		return p10
	elseif typeof(p10) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in p10 do
		if typeof(v) == "string" then
			table.insert(t, v)
			continue
		end
		return nil
	end
	return if #t > 0 then t else nil
end

local function getAnswersByQuestionId(p11)
	-- upvalues: httpService (ref), normalizeSelectedOptionId (ref)
	local t = {}
	local ok, status = pcall(httpService.JSONDecode, httpService, p11)
	
	if not ok or typeof(status) ~= "table" then
		return t
	end
	local answers = status.answers
	
	if typeof(answers) ~= "table" then
		return t
	end
	for i, v in answers do
		if typeof(v) == "table" and typeof(v.questionId) == "string" and typeof(v.content) == "string" then
			t[v.questionId] = {
				questionId = v.questionId,
				selectedOptionId = normalizeSelectedOptionId(v.selectedOptionId),
				content = v.content
			}
		end
	end
	return t
end

local function getPromptFromToolResult(p12, p13, p14, p15)
	-- upvalues: findSelectedOptionsByIds (ref)
	if p13 == nil then
		return nil
	end
	local var8
	local selectedOptionId = p13.selectedOptionId
	
	if typeof(selectedOptionId) == "table" then
		return if findSelectedOptionsByIds(p12, selectedOptionId) == nil then nil else {
			question = p12,
			selectedOptionId = selectedOptionId,
			toolCallId = p14,
			callOrder = p15
		}
	elseif selectedOptionId == nil then
		var8 = nil
	else
		for i, v in p12.options do
			if v.id == selectedOptionId then
				var8 = v
			end
		end
		var8 = nil
	end
	return if selectedOptionId == nil or var8 ~= nil then {
		question = p12,
		selectedOptionId = if var8 ~= nil then nil else var8.id,
		customResponseText = if var8 == nil then p13.content else nil,
		toolCallId = p14,
		callOrder = p15
	} else nil
end

local function getToolCallOrder(p16, p17)
	if p16.activityItems ~= nil then
		for i, v in p16.activityItems do
			if v.kind == "tool_call" and v.toolCallId == p17 then
				return i
			end
		end
	end
	local t = {}
	
	for v in p16.toolCalls do
		table.insert(t, v)
	end
	table.sort(t)
	
	for v, v_1 in t do
		if v_1 == p17 then
			return v
		end
	end
	return 0
end

return {
	CANCELLATION_TEXT = "User cancelled answering the question",
	TOOL_NAME = var1,
	LOCAL_TOOL_DEFINITION = t_1,
	extractQuestionsFromToolCall = extractQuestionsFromToolCall,
	findQuestionsInTurnState = findQuestionsInTurnState,
	formatToolResultText = formatToolResultText,
	formatToolResultContent = formatToolResultContent,
	getAnsweredPromptsFromTurnState = function(p18)
		-- upvalues: extractQuestionsFromToolCall (ref), getPersistedToolResultText (ref), getAnswersByQuestionId (ref), getPromptFromToolResult (ref), getToolCallOrder (ref)
		local t = {}
		local t_1 = {}
		
		for i in p18.toolCalls do
			table.insert(t_1, i)
		end
		table.sort(t_1)
		
		for i_1, v in t_1 do
			local var9 = p18.toolCalls[v]
			local var10 = extractQuestionsFromToolCall(var9)
			local var11 = getPersistedToolResultText(var9)
			
			if var10 ~= nil and var11 ~= nil then
				local var12 = getAnswersByQuestionId(var11)
				
				for i_2, v_1 in var10 do
					local var13 = getPromptFromToolResult(v_1, var12[v_1.id], v, getToolCallOrder(p18, v))
					
					if var13 ~= nil then
						table.insert(t, var13)
					end
				end
			end
		end
		return t
	end,
	formatCancellationContent = function()
		return { text = "User cancelled answering the question" }
	end
}