local httpService = game:GetService("HttpService")
local _ = require(script.Parent.types)
local t = { present_plan = true, propose_plan = true }
local t_1 = {
	name = "present_plan",
	inputSchema = {
		type = "object",
		required = { "content" },
		properties = {
			content = { type = "string" },
			summary = { type = "string" },
			title = { type = "string" }
		}
	}
}

local function _(p0) --[[ line: 36 | named "valueLooksLikeToolName" ]]
	-- upvalues: t (ref)
	return typeof(p0) == "string" and t[string.lower(p0)] == true
end

local function getRawInputContent(p1) --[[ line: 40 ]]
	if typeof(p1) == "string" then
		return p1, nil, nil
	elseif typeof(p1) ~= "table" then
		return nil, nil, nil
	end
	local content = p1.content
	
	if typeof(content) ~= "string" or content == "" then
		return nil, nil, nil
	end
	local var8 = if typeof(p1.title) == "string" and p1.title ~= "" then p1.title else nil
	
	if typeof(p1.summary) == "string" and p1.summary ~= "" then
		return content, var8, p1.summary
	end
	return content, var8, nil
end

local _ = function(p2) --[[ line: 59 | named "toolCallLooksLikeProposePlan" ]]
	-- upvalues: t (ref)
	local kind = p2.kind
	
	if not (typeof(kind) == "string" and t[string.lower(kind)] == true) then
		kind = p2.title
		
		if typeof(kind) == "string" and t[string.lower(kind)] == true then
			return true
		end
		local rawInput = p2.rawInput
		
		if typeof(rawInput) ~= "table" then
			return false
		end
		local name = rawInput.name
		kind = typeof(name) == "string" and t[string.lower(name)] == true
		
		if not kind then
			local toolName = rawInput.toolName
			kind = typeof(toolName) == "string" and t[string.lower(toolName)] == true
		end
		return kind
	end
end

local function extractPlanFromToolCall(p3) --[[ line: 72 ]]
	-- upvalues: t (ref), getRawInputContent (ref)
	local var9
	local kind = p3.kind
	
	if not (typeof(kind) == "string" and t[string.lower(kind)] == true) then
		kind = p3.title
		
		if typeof(kind) == "string" and t[string.lower(kind)] == true then
			var9 = true
		else
			local rawInput = p3.rawInput
			
			if typeof(rawInput) == "table" then
				kind = rawInput.name
				var9 = typeof(kind) == "string" and t[string.lower(kind)] == true
				
				if not var9 then
					kind = rawInput.toolName
					var9 = false
					
					if typeof(kind) == "string" then
						var9 = t[string.lower(kind)] == true
						var9 = nil
					end
				end
			else
				var9 = false
			end
		end
		if not var9 then
			return nil
		end
		var10, var11, kind = getRawInputContent(p3.rawInput)
		
		return if var10 == nil then nil else {
			title = var11 or "Proposed Plan",
			textContent = var10,
			summary = kind
		}
	end
end

local _ = function(p4) --[[ line: 93 | named "decodePersistedToolResultText" ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, p4)
	
	return if not (not ok or typeof(status) ~= "table") then if typeof(status.text) == "string" then status.text else nil else nil
end

local function getPersistedToolResultText(p5) --[[ line: 103 ]]
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
				local var13 = if ok and typeof(status) == "table" then if typeof(status.text) == "string" then status.text else nil else nil
				
				if var13 ~= nil and var13 ~= "" then
					table.insert(t, var13)
				end
			end
		end
	end
	return if #t > 0 then table.concat(t) else nil
end

local function findPlanInTurnState(p6, p7) --[[ line: 126 ]]
	-- upvalues: getPersistedToolResultText (ref), t (ref), getRawInputContent (ref)
	local t_1 = {}
	
	for i in p6.toolCalls do
		table.insert(t_1, i)
	end
	table.sort(t_1)
	
	for i_1, v in t_1 do
		if not p7 or not p7[v] then
			local var15 = p6.toolCalls[v]
			
			if getPersistedToolResultText(var15) == nil then
				local var16
				local kind = var15.kind
				
				if not (typeof(kind) == "string" and t[string.lower(kind)] == true) then
					kind = var15.title
					
					if typeof(kind) == "string" and t[string.lower(kind)] == true then
						var16 = true
					else
						local rawInput = var15.rawInput
						
						if typeof(rawInput) == "table" then
							kind = rawInput.name
							var16 = typeof(kind) == "string" and t[string.lower(kind)] == true
							
							if not var16 then
								local var17
								kind = rawInput.toolName
								var16 = false
								
								if typeof(kind) == "string" then
									var16 = t[string.lower(kind)] == true
									var16 = nil
								end
							end
						else
							var16 = false
						end
					end
					if var16 then
						var16, var18, kind = getRawInputContent(var15.rawInput)
						var17 = if var16 == nil then nil else {
							title = var18 or "Proposed Plan",
							textContent = var16,
							summary = kind
						}
					else
						var17 = nil
					end
					if var17 ~= nil then
						return var17, v, var15.rawInput, var15.turnId, var15.referenceId
					end
				end
			end
		end
	end
	return nil, nil, nil, nil, nil
end

local function getToolCallOrder(p8, p9) --[[ line: 153 ]]
	if p8.activityItems ~= nil then
		for i, v in p8.activityItems do
			if v.kind == "tool_call" and v.toolCallId == p9 then
				return i
			end
		end
	end
	local t = {}
	
	for v in p8.toolCalls do
		table.insert(t, v)
	end
	table.sort(t)
	
	for v, v_1 in t do
		if v_1 == p9 then
			return v
		end
	end
	return 0
end

local _ = function(p10) --[[ line: 176 | named "decodePlanResult" ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, p10)
	
	return if not (not ok or typeof(status) ~= "table") then if typeof(status.accepted) == "boolean" then if status.feedbackText == nil or typeof(status.feedbackText) == "string" then status else nil else nil else nil
end

return {
	TOOL_NAME = "present_plan",
	LOCAL_TOOL_DEFINITION = t_1,
	extractPlanFromToolCall = extractPlanFromToolCall,
	findPlanInTurnState = findPlanInTurnState,
	getCompletedPlansFromTurnState = function(p11) --[[ line: 192 ]]
		-- upvalues: t (ref), getRawInputContent (ref), getPersistedToolResultText (ref), httpService (ref), getToolCallOrder (ref)
		local t_1 = {}
		local t_2 = {}
		
		for i in p11.toolCalls do
			table.insert(t_2, i)
		end
		table.sort(t_2)
		
		for i_1, v in t_2 do
			local var23
			local var22 = p11.toolCalls[v]
			local ok = var22.kind
			
			if not (typeof(ok) == "string" and t[string.lower(ok)] == true) then
				ok = var22.title
				
				if typeof(ok) == "string" and t[string.lower(ok)] == true then
					var23 = true
				else
					local rawInput = var22.rawInput
					
					if typeof(rawInput) == "table" then
						ok = rawInput.name
						var23 = typeof(ok) == "string" and t[string.lower(ok)] == true
						
						if not var23 then
							local var24
							ok = rawInput.toolName
							var23 = false
							
							if typeof(ok) == "string" then
								var23 = t[string.lower(ok)] == true
								var23 = nil
							end
						end
					else
						var23 = false
					end
				end
				if var23 then
					var23, var25, ok = getRawInputContent(var22.rawInput)
					var24 = if var23 == nil then nil else {
						title = var25 or "Proposed Plan",
						textContent = var23,
						summary = ok
					}
				else
					var24 = nil
				end
				local var27
				local var26 = getPersistedToolResultText(var22)
				
				if var26 == nil then
					var27 = nil
				else
					ok, status = pcall(httpService.JSONDecode, httpService, var26)
					var27 = if not ok or typeof(status) ~= "table" then if typeof(status.accepted) ~= "boolean" then if status.feedbackText == nil or typeof(status.feedbackText) == "string" then status else nil else nil else nil
				end
				if var24 ~= nil and var27 ~= nil then
					table.insert(t_1, {
						title = var24.title,
						textContent = var24.textContent,
						summary = var24.summary,
						toolCallId = v,
						callOrder = getToolCallOrder(p11, v),
						isAccepted = var27.accepted,
						feedbackText = var27.feedbackText
					})
				end
			end
		end
		return t_1
	end,
	formatAcceptedContent = function() --[[ line: 221 ]]
		-- upvalues: httpService (ref)
		return { text = httpService:JSONEncode({ accepted = true }) }
	end,
	formatFeedbackContent = function(p12) --[[ line: 229 ]]
		-- upvalues: httpService (ref)
		return {
			text = httpService:JSONEncode({ accepted = false, feedbackText = p12 })
		}
	end
}