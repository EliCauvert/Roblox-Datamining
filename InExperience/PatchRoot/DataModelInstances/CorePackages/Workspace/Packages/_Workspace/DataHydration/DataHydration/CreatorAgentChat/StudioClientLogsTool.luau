local httpService = game:GetService("HttpService")
local _ = require(script.Parent.types)
local t = {
	name = "ask_for_logs",
	inputSchema = {
		type = "object",
		properties = { reason = { type = "string" } }
	}
}

local function _(p0) --[[ line: 34 | named "valueLooksLikeToolName" ]]
	return typeof(p0) == "string" and string.lower(p0) == "ask_for_logs"
end

local function toolCallLooksLikeClientLogsRequest(p1) --[[ line: 38 ]]
	local kind = p1.kind
	
	if not (typeof(kind) == "string" and string.lower(kind) == "ask_for_logs") then
		kind = p1.title
		
		if typeof(kind) == "string" and string.lower(kind) == "ask_for_logs" then
			return true
		end
		local rawInput = p1.rawInput
		
		if typeof(rawInput) ~= "table" then
			return false
		end
		local name = rawInput.name
		kind = typeof(name) == "string" and string.lower(name) == "ask_for_logs"
		
		if not kind then
			local toolName = rawInput.toolName
			kind = typeof(toolName) == "string" and string.lower(toolName) == "ask_for_logs"
		end
		return kind
	end
end

local _ = function(p2) --[[ line: 55 | named "decodePersistedToolResultText" ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, p2)
	
	return if not (not ok or typeof(status) ~= "table") then if typeof(status.text) == "string" then status.text else nil else nil
end

local function getPersistedToolResultText(p3) --[[ line: 65 ]]
	-- upvalues: httpService (ref)
	if p3.content == nil then
		return nil
	end
	local t = {}
	
	for i, v in p3.content do
		if v.type == "content" and v.content ~= nil then
			local content = v.content
			
			if content.type == "text" and typeof(content.text) == "string" then
				local ok, status = pcall(httpService.JSONDecode, httpService, content.text)
				local var5 = if ok and typeof(status) == "table" then if typeof(status.text) == "string" then status.text else nil else nil
				
				if var5 ~= nil and var5 ~= "" then
					table.insert(t, var5)
				end
			end
		end
	end
	return if #t > 0 then table.concat(t) else nil
end

return {
	TOOL_NAME = "ask_for_logs",
	NOT_IN_GAME_MESSAGE = "The user is not in the game.",
	LOCAL_TOOL_DEFINITION = t,
	toolCallLooksLikeClientLogsRequest = toolCallLooksLikeClientLogsRequest,
	findClientLogsRequestInTurnState = function(p4, p5) --[[ line: 88 ]]
		-- upvalues: getPersistedToolResultText (ref)
		local t = {}
		
		for i in p4.toolCalls do
			table.insert(t, i)
		end
		table.sort(t)
		
		for i_1, v in t do
			if not p5 or not p5[v] then
				local var7 = p4.toolCalls[v]
				
				if getPersistedToolResultText(var7) == nil then
					local var8
					local kind = var7.kind
					
					if not (typeof(kind) == "string" and string.lower(kind) == "ask_for_logs") then
						kind = var7.title
						
						if typeof(kind) == "string" and string.lower(kind) == "ask_for_logs" then
							var8 = true
						else
							local rawInput = var7.rawInput
							
							if typeof(rawInput) == "table" then
								kind = rawInput.name
								var8 = typeof(kind) == "string" and string.lower(kind) == "ask_for_logs"
								
								if not var8 then
									kind = rawInput.toolName
									var8 = false
									
									if typeof(kind) == "string" then
										var8 = string.lower(kind) == "ask_for_logs"
										var8 = nil
									end
								end
							else
								var8 = false
							end
						end
						if var8 then
							return v, var7.rawInput, var7.turnId, var7.referenceId
						end
					end
				end
			end
		end
		return nil, nil, nil, nil
	end,
	formatLogsContent = function(p6, p7) --[[ line: 114 ]]
		-- upvalues: httpService (ref)
		return {
			text = httpService:JSONEncode({ status = "ok", clientLogs = p6, serverLogs = p7 })
		}
	end,
	formatNotInGameContent = function() --[[ line: 124 ]]
		-- upvalues: httpService (ref)
		return {
			text = httpService:JSONEncode({
				status = "not_in_game",
				message = "The user is not in the game."
			})
		}
	end
}