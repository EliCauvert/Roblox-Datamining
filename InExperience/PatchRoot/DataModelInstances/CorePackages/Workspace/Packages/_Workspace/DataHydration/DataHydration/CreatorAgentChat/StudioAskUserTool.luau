local _ = require(script.Parent.types)
local httpService = game:GetService("HttpService")
local t = {
	name = "studio_ask_user",
	inputSchema = {
		type = "array",
		items = {
			type = "object",
			required = { "question", "options" },
			properties = {
				question = { type = "string" },
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

local function _(p0) --[[ line: 63 | named "valueLooksLikeToolName" ]]
	return typeof(p0) == "string" and string.lower(p0) == "studio_ask_user"
end

local _ = function(p1) --[[ line: 67 | named "getQuestionsPayload" ]]
	return if typeof(p1) == "table" then if typeof(p1[1]) == "table" then p1 elseif typeof(p1.questions) == "table" then p1.questions elseif typeof(p1.data) == "table" then p1.data else nil else nil
end

local function toAnswerQuestions(p2) --[[ line: 87 ]]
	local var11 = if typeof(p2) ~= "table" then if typeof(p2[1]) == "table" then p2 elseif typeof(p2.questions) == "table" then p2.questions elseif typeof(p2.data) == "table" then p2.data else nil else nil
	
	if typeof(var11) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in var11 do
		if typeof(v) == "table" and typeof(v.question) == "string" then
			local t_1 = {}
			local options = v.options
			
			if typeof(options) == "table" then
				for i_1, v_1 in options do
					if typeof(v_1) == "table" and typeof(v_1.optionText) == "string" then
						table.insert(t_1, {
							id = `q{i}-o{i_1}`,
							title = v_1.optionText,
							description = if typeof(v_1.clarificationText) == "string" then v_1.clarificationText else ""
						})
					end
				end
			end
			if #t_1 > 0 then
				table.insert(t, { id = `q{i}`, question = v.question, options = t_1 })
			end
		end
	end
	return if #t > 0 then t else nil
end

local function extractQuestionsFromToolCall(p3) --[[ line: 125 ]]
	-- upvalues: toAnswerQuestions (ref)
	local var14 = toAnswerQuestions(p3.rawInput)
	
	if var14 == nil then
		return nil
	end
	local kind = p3.kind
	
	if not (typeof(kind) == "string" and string.lower(kind) == "studio_ask_user") then
		kind = p3.title
		
		if typeof(kind) == "string" and string.lower(kind) == "studio_ask_user" then
			return var14
		end
		local rawInput = p3.rawInput
		
		if typeof(rawInput) == "table" then
			local name = rawInput.name
			
			if not (typeof(name) == "string" and string.lower(name) == "studio_ask_user") then
				name = rawInput.toolName
				
				return if typeof(name) == "string" and string.lower(name) == "studio_ask_user" then var14 else var14
			end
		end
	end
end

local _ = function(p4) --[[ line: 149 | named "decodePersistedToolResultText" ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, p4)
	
	return if not (not ok or typeof(status) ~= "table") then if typeof(status.text) == "string" then status.text else nil else nil
end

local function getPersistedToolResultText(p5) --[[ line: 159 ]]
	-- upvalues: httpService (ref)
	if p5.content == nil then
		return nil
	end
	local t = {}
	
	for i, v in p5.content do
		if v.type == "content" and v.content ~= nil then
			local content = v.content
			
			if content.type == "text" and typeof(content.text) == "string" then
				local ok, status = pcall(httpService.JSONDecode, httpService, content.text)
				local var16 = if ok and typeof(status) == "table" then if typeof(status.text) == "string" then status.text else nil else nil
				
				if var16 ~= nil and var16 ~= "" then
					table.insert(t, var16)
				end
			end
		end
	end
	return if #t > 0 then table.concat(t) else nil
end

local function findQuestionsInTurnState(p6, p7) --[[ line: 187 ]]
	-- upvalues: getPersistedToolResultText (ref), extractQuestionsFromToolCall (ref)
	local t = {}
	
	for i in p6.toolCalls do
		table.insert(t, i)
	end
	table.sort(t)
	
	for i_1, v in t do
		if not p7 or not p7[v] then
			local var18 = p6.toolCalls[v]
			
			if getPersistedToolResultText(var18) == nil then
				local var19 = extractQuestionsFromToolCall(var18)
				
				if var19 ~= nil then
					return var19, v, var18.rawInput, var18.turnId, var18.referenceId
				end
			end
		end
	end
	return nil, nil, nil, nil, nil
end

local function formatToolResultText(p8) --[[ line: 214 ]]
	-- upvalues: httpService (ref)
	local t = {}
	
	for i, v in p8 do
		local option = v.option
		
		if option ~= nil then
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
	return httpService:JSONEncode({ answers = t })
end

local function formatToolResultContent(p9) --[[ line: 236 ]]
	-- upvalues: formatToolResultText (ref)
	return { text = formatToolResultText(p9) }
end

local _ = function(p10, p11) --[[ line: 242 | named "findSelectedOptionById" ]]
	if p11 == nil then
		return nil
	end
	for i, v in p10.options do
		if v.id == p11 then
			return v
		end
	end
	return nil
end

local function getAnswersByQuestionId(p12) --[[ line: 254 ]]
	-- upvalues: httpService (ref)
	local t = {}
	local ok, status = pcall(httpService.JSONDecode, httpService, p12)
	
	if not ok or typeof(status) ~= "table" then
		return t
	end
	local answers = status.answers
	
	if typeof(answers) ~= "table" then
		return t
	end
	for i, v in answers do
		if typeof(v) == "table" and typeof(v.questionId) == "string" and typeof(v.content) == "string" then
			t[v.questionId] = v
		end
	end
	return t
end

local function getPromptFromToolResult(p13, p14, p15, p16) --[[ line: 277 ]]
	if p14 == nil then
		return nil
	end
	local var22
	local selectedOptionId = p14.selectedOptionId
	
	if selectedOptionId == nil then
		var22 = nil
	else
		for i, v in p13.options do
			if v.id == selectedOptionId then
				var22 = v
			end
		end
		var22 = nil
	end
	return if p14.selectedOptionId == nil or var22 ~= nil then {
		question = p13,
		selectedOptionId = if var22 ~= nil then nil else var22.id,
		customResponseText = if var22 == nil then p14.content else nil,
		toolCallId = p15,
		callOrder = p16
	} else nil
end

local function getToolCallOrder(p17, p18) --[[ line: 301 ]]
	if p17.activityItems ~= nil then
		for i, v in p17.activityItems do
			if v.kind == "tool_call" and v.toolCallId == p18 then
				return i
			end
		end
	end
	local t = {}
	
	for v in p17.toolCalls do
		table.insert(t, v)
	end
	table.sort(t)
	
	for v, v_1 in t do
		if v_1 == p18 then
			return v
		end
	end
	return 0
end

return {
	TOOL_NAME = "studio_ask_user",
	CANCELLATION_TEXT = "User cancelled answering the question",
	LOCAL_TOOL_DEFINITION = t,
	extractQuestionsFromToolCall = extractQuestionsFromToolCall,
	findQuestionsInTurnState = findQuestionsInTurnState,
	formatToolResultText = formatToolResultText,
	formatToolResultContent = formatToolResultContent,
	getAnsweredPromptsFromTurnState = function(p19) --[[ line: 324 ]]
		-- upvalues: extractQuestionsFromToolCall (ref), getPersistedToolResultText (ref), getAnswersByQuestionId (ref), getPromptFromToolResult (ref), getToolCallOrder (ref)
		local t = {}
		local t_1 = {}
		
		for i in p19.toolCalls do
			table.insert(t_1, i)
		end
		table.sort(t_1)
		
		for i_1, v in t_1 do
			local var26 = p19.toolCalls[v]
			local var27 = extractQuestionsFromToolCall(var26)
			local var28 = getPersistedToolResultText(var26)
			
			if var27 ~= nil and var28 ~= nil then
				local var29 = getAnswersByQuestionId(var28)
				
				for i_2, v_1 in var27 do
					local var30 = getPromptFromToolResult(v_1, var29[v_1.id], v, getToolCallOrder(p19, v))
					
					if var30 ~= nil then
						table.insert(t, var30)
					end
				end
			end
		end
		return t
	end,
	formatCancellationContent = function() --[[ line: 360 ]]
		return { text = "User cancelled answering the question" }
	end
}