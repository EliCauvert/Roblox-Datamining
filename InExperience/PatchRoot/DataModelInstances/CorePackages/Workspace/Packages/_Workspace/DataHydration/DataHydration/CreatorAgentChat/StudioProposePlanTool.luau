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

local function _(p1)
	-- upvalues: t (ref)
	return typeof(p1) == "string" and t[string.lower(p1)] == true
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
	local var1 = if typeof(p1.title) == "string" and p1.title ~= "" then p1.title else nil
	
	if typeof(p1.summary) == "string" and p1.summary ~= "" then
		return content, var1, p1.summary
	end
	return content, var1, nil
end

local _ = function(p1)
	-- upvalues: t (ref)
	local kind = p1.kind
	
	if not (typeof(kind) == "string" and t[string.lower(kind)] == true) then
		kind = p1.title
		
		if typeof(kind) == "string" and t[string.lower(kind)] == true then
			return true
		end
		local rawInput = p1.rawInput
		
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

local function extractPlanFromToolCall(p1)
	-- upvalues: t (ref), getRawInputContent (ref)
	local var1
	local kind = p1.kind
	
	if not (typeof(kind) == "string" and t[string.lower(kind)] == true) then
		kind = p1.title
		
		if typeof(kind) == "string" and t[string.lower(kind)] == true then
			var1 = true
		else
			local rawInput = p1.rawInput
			
			if typeof(rawInput) == "table" then
				kind = rawInput.name
				var1 = typeof(kind) == "string" and t[string.lower(kind)] == true
				
				if not var1 then
					kind = rawInput.toolName
					var1 = false
					
					if typeof(kind) == "string" then
						var1 = t[string.lower(kind)] == true
						var1 = nil
					end
				end
			else
				var1 = false
			end
		end
		if not var1 then
			return nil
		end
		var11, var12, kind = getRawInputContent(p1.rawInput)
		
		return if var11 == nil then nil else {
			title = var12 or "Proposed Plan",
			textContent = var11,
			summary = kind
		}
	end
end

local _ = function(p1)
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, p1)
	
	return if not (not ok or typeof(status) ~= "table") then if typeof(status.text) == "string" then status.text else nil else nil
end

local function getPersistedToolResultText(p1)
	-- upvalues: httpService (ref)
	if p1.content == nil then
		return nil
	end
	local t = {}
	
	for i, v in p1.content do
		if v.type == "content" and v.content ~= nil then
			local content = v.content
			
			if content.type == "text" and typeof(content.text) == "string" then
				local ok, status = pcall(httpService.JSONDecode, httpService, content.text)
				local var1 = if ok and typeof(status) == "table" then if typeof(status.text) == "string" then status.text else nil else nil
				
				if var1 ~= nil and var1 ~= "" then
					table.insert(t, var1)
				end
			end
		end
	end
	return if #t > 0 then table.concat(t) else nil
end

local function findPlanInTurnState(p2, p3)
	-- upvalues: fFlagCreatorAgentChatFilterTerminalClientToolsModule (ref), getPersistedToolResultText (ref), t (ref), getRawInputContent (ref)
	local t_1 = {}
	
	for i in p2.toolCalls do
		table.insert(t_1, i)
	end
	table.sort(t_1)
	
	for i_1, v in t_1 do
		if not p3 or not p3[v] then
			local var2 = p2.toolCalls[v]
			
			if (not fFlagCreatorAgentChatFilterTerminalClientToolsModule or var2.status ~= "completed" and var2.status ~= "failed" and var2.status ~= "cancelled") and getPersistedToolResultText(var2) == nil then
				local var3
				local kind = var2.kind
				
				if not (typeof(kind) == "string" and t[string.lower(kind)] == true) then
					kind = var2.title
					
					if typeof(kind) == "string" and t[string.lower(kind)] == true then
						var3 = true
					else
						local rawInput = var2.rawInput
						
						if typeof(rawInput) == "table" then
							kind = rawInput.name
							var3 = typeof(kind) == "string" and t[string.lower(kind)] == true
							
							if not var3 then
								local var4
								kind = rawInput.toolName
								var3 = false
								
								if typeof(kind) == "string" then
									var3 = t[string.lower(kind)] == true
									var3 = nil
								end
							end
						else
							var3 = false
						end
					end
					if var3 then
						var3, var19, kind = getRawInputContent(var2.rawInput)
						var4 = if var3 == nil then nil else {
							title = var19 or "Proposed Plan",
							textContent = var3,
							summary = kind
						}
					else
						var4 = nil
					end
					if var4 ~= nil then
						return var4, v, var2.rawInput, var2.turnId, var2.referenceId
					end
				end
			end
		end
	end
	return nil, nil, nil, nil, nil
end

local function getToolCallOrder(p4, p5)
	if p4.activityItems ~= nil then
		for i, v in p4.activityItems do
			if v.kind == "tool_call" and v.toolCallId == p5 then
				return i
			end
		end
	end
	local t = {}
	
	for v in p4.toolCalls do
		table.insert(t, v)
	end
	table.sort(t)
	
	for v, v_1 in t do
		if v_1 == p5 then
			return v
		end
	end
	return 0
end

local _ = function(p6)
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, p6)
	
	return if not (not ok or typeof(status) ~= "table") then if typeof(status.accepted) == "boolean" then if status.feedbackText == nil or typeof(status.feedbackText) == "string" then status else nil else nil else nil
end

return {
	TOOL_NAME = "present_plan",
	LOCAL_TOOL_DEFINITION = t_1,
	extractPlanFromToolCall = extractPlanFromToolCall,
	findPlanInTurnState = findPlanInTurnState,
	getCompletedPlansFromTurnState = function(p6)
		-- upvalues: t (ref), getRawInputContent (ref), getPersistedToolResultText (ref), httpService (ref), getToolCallOrder (ref)
		local t_1 = {}
		local t_2 = {}
		
		for i in p6.toolCalls do
			table.insert(t_2, i)
		end
		table.sort(t_2)
		
		for i_1, v in t_2 do
			local var5
			local var6 = p6.toolCalls[v]
			local ok = var6.kind
			
			if not (typeof(ok) == "string" and t[string.lower(ok)] == true) then
				ok = var6.title
				
				if typeof(ok) == "string" and t[string.lower(ok)] == true then
					var5 = true
				else
					local rawInput = var6.rawInput
					
					if typeof(rawInput) == "table" then
						ok = rawInput.name
						var5 = typeof(ok) == "string" and t[string.lower(ok)] == true
						
						if not var5 then
							local var7
							ok = rawInput.toolName
							var5 = false
							
							if typeof(ok) == "string" then
								var5 = t[string.lower(ok)] == true
								var5 = nil
							end
						end
					else
						var5 = false
					end
				end
				if var5 then
					var5, var26, ok = getRawInputContent(var6.rawInput)
					var7 = if var5 == nil then nil else {
						title = var26 or "Proposed Plan",
						textContent = var5,
						summary = ok
					}
				else
					var7 = nil
				end
				local var8
				local var9 = getPersistedToolResultText(var6)
				
				if var9 == nil then
					var8 = nil
				else
					ok, status = pcall(httpService.JSONDecode, httpService, var9)
					var8 = if not ok or typeof(status) ~= "table" then if typeof(status.accepted) ~= "boolean" then if status.feedbackText == nil or typeof(status.feedbackText) == "string" then status else nil else nil else nil
				end
				if var7 ~= nil and var8 ~= nil then
					table.insert(t_1, {
						title = var7.title,
						textContent = var7.textContent,
						summary = var7.summary,
						toolCallId = v,
						callOrder = getToolCallOrder(p6, v),
						isAccepted = var8.accepted,
						feedbackText = var8.feedbackText
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
	formatFeedbackContent = function(p7)
		-- upvalues: httpService (ref)
		return {
			text = httpService:JSONEncode({ accepted = false, feedbackText = p7 })
		}
	end
}