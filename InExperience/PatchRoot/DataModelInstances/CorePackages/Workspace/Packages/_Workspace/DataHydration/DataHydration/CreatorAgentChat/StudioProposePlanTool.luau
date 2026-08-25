local httpService = game:GetService("HttpService")
local fFlagCreatorAgentChatFilterTerminalClientToolsModule = require(script.Parent.FFlagCreatorAgentChatFilterTerminalClientTools)
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

local function _(p0)
	-- upvalues: t (ref)
	return typeof(p0) == "string" and t[string.lower(p0)] == true
end

local function getRawInputContent(p1)
	if typeof(p1) == "string" then
		return p1, nil, nil
	elseif typeof(p1) ~= "table" then
		return nil, nil, nil
	end
	local content = p1.content
	
	if typeof(content) ~= "string" or content == "" then
		return nil, nil, nil
	end
	local var9 = if typeof(p1.title) == "string" and p1.title ~= "" then p1.title else nil
	
	if typeof(p1.summary) == "string" and p1.summary ~= "" then
		return content, var9, p1.summary
	end
	return content, var9, nil
end

local _ = function(p2)
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

local function extractPlanFromToolCall(p3)
	-- upvalues: t (ref), getRawInputContent (ref)
	local var10
	local kind = p3.kind
	
	if not (typeof(kind) == "string" and t[string.lower(kind)] == true) then
		kind = p3.title
		
		if typeof(kind) == "string" and t[string.lower(kind)] == true then
			var10 = true
		else
			local rawInput = p3.rawInput
			
			if typeof(rawInput) == "table" then
				kind = rawInput.name
				var10 = typeof(kind) == "string" and t[string.lower(kind)] == true
				
				if not var10 then
					kind = rawInput.toolName
					var10 = false
					
					if typeof(kind) == "string" then
						var10 = t[string.lower(kind)] == true
						var10 = nil
					end
				end
			else
				var10 = false
			end
		end
		if not var10 then
			return nil
		end
		var11, var12, kind = getRawInputContent(p3.rawInput)
		
		return if var11 == nil then nil else {
			title = var12 or "Proposed Plan",
			textContent = var11,
			summary = kind
		}
	end
end

local _ = function(p4)
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, p4)
	
	return if not (not ok or typeof(status) ~= "table") then if typeof(status.text) == "string" then status.text else nil else nil
end

local function getPersistedToolResultText(p5)
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
				local var14 = if ok and typeof(status) == "table" then if typeof(status.text) == "string" then status.text else nil else nil
				
				if var14 ~= nil and var14 ~= "" then
					table.insert(t, var14)
				end
			end
		end
	end
	return if #t > 0 then table.concat(t) else nil
end

local function findPlanInTurnState(p6, p7)
	-- upvalues: fFlagCreatorAgentChatFilterTerminalClientToolsModule (ref), getPersistedToolResultText (ref), t (ref), getRawInputContent (ref)
	local t_1 = {}
	
	for i in p6.toolCalls do
		table.insert(t_1, i)
	end
	table.sort(t_1)
	
	for i_1, v in t_1 do
		if not p7 or not p7[v] then
			local var16 = p6.toolCalls[v]
			
			if (not fFlagCreatorAgentChatFilterTerminalClientToolsModule or var16.status ~= "completed" and var16.status ~= "failed" and var16.status ~= "cancelled") and getPersistedToolResultText(var16) == nil then
				local var17
				local kind = var16.kind
				
				if not (typeof(kind) == "string" and t[string.lower(kind)] == true) then
					kind = var16.title
					
					if typeof(kind) == "string" and t[string.lower(kind)] == true then
						var17 = true
					else
						local rawInput = var16.rawInput
						
						if typeof(rawInput) == "table" then
							kind = rawInput.name
							var17 = typeof(kind) == "string" and t[string.lower(kind)] == true
							
							if not var17 then
								local var18
								kind = rawInput.toolName
								var17 = false
								
								if typeof(kind) == "string" then
									var17 = t[string.lower(kind)] == true
									var17 = nil
								end
							end
						else
							var17 = false
						end
					end
					if var17 then
						var17, var19, kind = getRawInputContent(var16.rawInput)
						var18 = if var17 == nil then nil else {
							title = var19 or "Proposed Plan",
							textContent = var17,
							summary = kind
						}
					else
						var18 = nil
					end
					if var18 ~= nil then
						return var18, v, var16.rawInput, var16.turnId, var16.referenceId
					end
				end
			end
		end
	end
	return nil, nil, nil, nil, nil
end

local function getToolCallOrder(p8, p9)
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

local _ = function(p10)
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, p10)
	
	return if not (not ok or typeof(status) ~= "table") then if typeof(status.accepted) == "boolean" then if status.feedbackText == nil or typeof(status.feedbackText) == "string" then status else nil else nil else nil
end

return {
	TOOL_NAME = "present_plan",
	LOCAL_TOOL_DEFINITION = t_1,
	extractPlanFromToolCall = extractPlanFromToolCall,
	findPlanInTurnState = findPlanInTurnState,
	getCompletedPlansFromTurnState = function(p11)
		-- upvalues: t (ref), getRawInputContent (ref), getPersistedToolResultText (ref), httpService (ref), getToolCallOrder (ref)
		local t_1 = {}
		local t_2 = {}
		
		for i in p11.toolCalls do
			table.insert(t_2, i)
		end
		table.sort(t_2)
		
		for i_1, v in t_2 do
			local var24
			local var23 = p11.toolCalls[v]
			local ok = var23.kind
			
			if not (typeof(ok) == "string" and t[string.lower(ok)] == true) then
				ok = var23.title
				
				if typeof(ok) == "string" and t[string.lower(ok)] == true then
					var24 = true
				else
					local rawInput = var23.rawInput
					
					if typeof(rawInput) == "table" then
						ok = rawInput.name
						var24 = typeof(ok) == "string" and t[string.lower(ok)] == true
						
						if not var24 then
							local var25
							ok = rawInput.toolName
							var24 = false
							
							if typeof(ok) == "string" then
								var24 = t[string.lower(ok)] == true
								var24 = nil
							end
						end
					else
						var24 = false
					end
				end
				if var24 then
					var24, var26, ok = getRawInputContent(var23.rawInput)
					var25 = if var24 == nil then nil else {
						title = var26 or "Proposed Plan",
						textContent = var24,
						summary = ok
					}
				else
					var25 = nil
				end
				local var28
				local var27 = getPersistedToolResultText(var23)
				
				if var27 == nil then
					var28 = nil
				else
					ok, status = pcall(httpService.JSONDecode, httpService, var27)
					var28 = if not ok or typeof(status) ~= "table" then if typeof(status.accepted) ~= "boolean" then if status.feedbackText == nil or typeof(status.feedbackText) == "string" then status else nil else nil else nil
				end
				if var25 ~= nil and var28 ~= nil then
					table.insert(t_1, {
						title = var25.title,
						textContent = var25.textContent,
						summary = var25.summary,
						toolCallId = v,
						callOrder = getToolCallOrder(p11, v),
						isAccepted = var28.accepted,
						feedbackText = var28.feedbackText
					})
				end
			end
		end
		return t_1
	end,
	formatAcceptedContent = function()
		-- upvalues: httpService (ref)
		return { text = httpService:JSONEncode({ accepted = true }) }
	end,
	formatFeedbackContent = function(p12)
		-- upvalues: httpService (ref)
		return {
			text = httpService:JSONEncode({ accepted = false, feedbackText = p12 })
		}
	end
}