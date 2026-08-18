local fFlagCreatorAgentChatFilterTerminalClientToolsModule = require(script.Parent.FFlagCreatorAgentChatFilterTerminalClientTools)
local _ = require(script.Parent.types)
local httpService = game:GetService("HttpService")
local t = {
	single_select = "single_select",
	multi_select = "multi_select",
	free_text = "free_text"
}
local t_1 = {
	name = "studio_ask_user",
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

local function _(p0) --[[ line: 76 | named "valueLooksLikeToolName" ]]
	return typeof(p0) == "string" and string.lower(p0) == "studio_ask_user"
end

local _ = function(p1) --[[ line: 80 | named "getQuestionsPayload" ]]
	return if typeof(p1) == "table" then if typeof(p1[1]) == "table" then p1 elseif typeof(p1.questions) == "table" then p1.questions elseif typeof(p1.data) == "table" then p1.data else nil else nil
end

local _ = function(value, p2) --[[ line: 100 | named "resolveResponseType" ]]
	-- upvalues: t (ref)
	local var15 = if typeof(value) == "string" then t[value] else nil
	
	return if var15 == nil then if p2 > 0 then "single_select" else "free_text" else var15
end

local function toAnswerQuestions(p3) --[[ line: 111 ]]
	-- upvalues: t (ref)
	local var16 = if typeof(p3) ~= "table" then if typeof(p3[1]) == "table" then p3 elseif typeof(p3.questions) == "table" then p3.questions elseif typeof(p3.data) == "table" then p3.data else nil else nil
	
	if typeof(var16) ~= "table" then
		return nil
	end
	local t_1 = {}
	
	for i, v in var16 do
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
			local var20 = if typeof(v_1) == "string" then t[v_1] else nil
			t_3.responseType = if var20 == nil then if #t_2 > 0 then "single_select" else "free_text" else var20
			table.insert(t_1, t_3)
		end
	end
	return if #t_1 > 0 then t_1 else nil
end

local function extractQuestionsFromToolCall(p4) --[[ line: 148 ]]
	-- upvalues: toAnswerQuestions (ref)
	local var21 = toAnswerQuestions(p4.rawInput)
	
	if var21 == nil then
		return nil
	end
	local kind = p4.kind
	
	if not (typeof(kind) == "string" and string.lower(kind) == "studio_ask_user") then
		kind = p4.title
		
		if typeof(kind) == "string" and string.lower(kind) == "studio_ask_user" then
			return var21
		end
		local rawInput = p4.rawInput
		
		if typeof(rawInput) == "table" then
			local name = rawInput.name
			
			if not (typeof(name) == "string" and string.lower(name) == "studio_ask_user") then
				name = rawInput.toolName
				
				return if typeof(name) == "string" and string.lower(name) == "studio_ask_user" then var21 else var21
			end
		end
	end
end

local _ = function(p5) --[[ line: 172 | named "decodePersistedToolResultText" ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, p5)
	
	return if not (not ok or typeof(status) ~= "table") then if typeof(status.text) == "string" then status.text else nil else nil
end

local function getPersistedToolResultText(p6) --[[ line: 182 ]]
	-- upvalues: httpService (ref)
	if p6.content == nil then
		return nil
	end
	local t = {}
	
	for i, v in p6.content do
		if v.type == "content" and v.content ~= nil then
			local content = v.content
			
			if content.type == "text" and typeof(content.text) == "string" then
				local ok, status = pcall(httpService.JSONDecode, httpService, content.text)
				local var23 = if ok and typeof(status) == "table" then if typeof(status.text) == "string" then status.text else nil else nil
				
				if var23 ~= nil and var23 ~= "" then
					table.insert(t, var23)
				end
			end
		end
	end
	return if #t > 0 then table.concat(t) else nil
end

local function findQuestionsInTurnState(p7, p8) --[[ line: 210 ]]
	-- upvalues: fFlagCreatorAgentChatFilterTerminalClientToolsModule (ref), getPersistedToolResultText (ref), extractQuestionsFromToolCall (ref)
	local t = {}
	
	for i in p7.toolCalls do
		table.insert(t, i)
	end
	table.sort(t)
	
	for i_1, v in t do
		if not p8 or not p8[v] then
			local var25 = p7.toolCalls[v]
			
			if (not fFlagCreatorAgentChatFilterTerminalClientToolsModule or var25.status ~= "completed" and var25.status ~= "failed" and var25.status ~= "cancelled") and getPersistedToolResultText(var25) == nil then
				local var26 = extractQuestionsFromToolCall(var25)
				
				if var26 ~= nil then
					return var26, v, var25.rawInput, var25.turnId, var25.referenceId
				end
			end
		end
	end
	return nil, nil, nil, nil, nil
end

local function formatToolResultText(p9) --[[ line: 243 ]]
	-- upvalues: httpService (ref)
	local t = {}
	
	for i, v in p9 do
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

local function formatToolResultContent(p10) --[[ line: 278 ]]
	-- upvalues: formatToolResultText (ref)
	return { text = formatToolResultText(p10) }
end

local _ = function(p11, p12) --[[ line: 284 | named "findSelectedOptionById" ]]
	if p12 == nil then
		return nil
	end
	for i, v in p11.options do
		if v.id == p12 then
			return v
		end
	end
	return nil
end

local function findSelectedOptionsByIds(p13, p14) --[[ line: 296 ]]
	local t = {}
	
	for i, v in p13.options do
		t[v.id] = v
	end
	local t_1 = {}
	
	for i_1, v_1 in p14 do
		local var32 = t[v_1]
		
		if var32 ~= nil then
			table.insert(t_1, var32)
			continue
		end
		return nil
	end
	return t_1
end

local function normalizeSelectedOptionId(p15) --[[ line: 313 ]]
	if typeof(p15) == "string" then
		return p15
	elseif typeof(p15) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in p15 do
		if typeof(v) == "string" then
			table.insert(t, v)
			continue
		end
		return nil
	end
	return if #t > 0 then t else nil
end

local function getAnswersByQuestionId(p16) --[[ line: 331 ]]
	-- upvalues: httpService (ref), normalizeSelectedOptionId (ref)
	local t = {}
	local ok, status = pcall(httpService.JSONDecode, httpService, p16)
	
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

local function getPromptFromToolResult(p17, p18, p19, p20) --[[ line: 358 ]]
	-- upvalues: findSelectedOptionsByIds (ref)
	if p18 == nil then
		return nil
	end
	local var35
	local selectedOptionId = p18.selectedOptionId
	
	if typeof(selectedOptionId) == "table" then
		return if findSelectedOptionsByIds(p17, selectedOptionId) == nil then nil else {
			question = p17,
			selectedOptionId = selectedOptionId,
			toolCallId = p19,
			callOrder = p20
		}
	elseif selectedOptionId == nil then
		var35 = nil
	else
		for i, v in p17.options do
			if v.id == selectedOptionId then
				var35 = v
			end
		end
		var35 = nil
	end
	return if selectedOptionId == nil or var35 ~= nil then {
		question = p17,
		selectedOptionId = if var35 ~= nil then nil else var35.id,
		customResponseText = if var35 == nil then p18.content else nil,
		toolCallId = p19,
		callOrder = p20
	} else nil
end

local function getToolCallOrder(p21, p22) --[[ line: 397 ]]
	if p21.activityItems ~= nil then
		for i, v in p21.activityItems do
			if v.kind == "tool_call" and v.toolCallId == p22 then
				return i
			end
		end
	end
	local t = {}
	
	for v in p21.toolCalls do
		table.insert(t, v)
	end
	table.sort(t)
	
	for v, v_1 in t do
		if v_1 == p22 then
			return v
		end
	end
	return 0
end

return {
	TOOL_NAME = "studio_ask_user",
	CANCELLATION_TEXT = "User cancelled answering the question",
	LOCAL_TOOL_DEFINITION = t_1,
	extractQuestionsFromToolCall = extractQuestionsFromToolCall,
	findQuestionsInTurnState = findQuestionsInTurnState,
	formatToolResultText = formatToolResultText,
	formatToolResultContent = formatToolResultContent,
	getAnsweredPromptsFromTurnState = function(p23) --[[ line: 420 ]]
		-- upvalues: extractQuestionsFromToolCall (ref), getPersistedToolResultText (ref), getAnswersByQuestionId (ref), getPromptFromToolResult (ref), getToolCallOrder (ref)
		local t = {}
		local t_1 = {}
		
		for i in p23.toolCalls do
			table.insert(t_1, i)
		end
		table.sort(t_1)
		
		for i_1, v in t_1 do
			local var39 = p23.toolCalls[v]
			local var40 = extractQuestionsFromToolCall(var39)
			local var41 = getPersistedToolResultText(var39)
			
			if var40 ~= nil and var41 ~= nil then
				local var42 = getAnswersByQuestionId(var41)
				
				for i_2, v_1 in var40 do
					local var43 = getPromptFromToolResult(v_1, var42[v_1.id], v, getToolCallOrder(p23, v))
					
					if var43 ~= nil then
						table.insert(t, var43)
					end
				end
			end
		end
		return t
	end,
	formatCancellationContent = function() --[[ line: 456 ]]
		return { text = "User cancelled answering the question" }
	end
}