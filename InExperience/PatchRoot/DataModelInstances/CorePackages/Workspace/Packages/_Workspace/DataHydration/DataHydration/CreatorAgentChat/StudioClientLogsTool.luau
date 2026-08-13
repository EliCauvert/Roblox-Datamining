local httpService = game:GetService("HttpService")
local fFlagCreatorAgentChatFilterTerminalClientToolsModule = require(script.Parent.FFlagCreatorAgentChatFilterTerminalClientTools)
local _ = require(script.Parent.types)
local t = {
	name = "ask_for_logs",
	inputSchema = {
		type = "object",
		properties = { reason = { type = "string" } }
	}
}

local function _(p0) --[[ line: 42 | named "valueLooksLikeToolName" ]]
	return typeof(p0) == "string" and string.lower(p0) == "ask_for_logs"
end

local function toolCallLooksLikeClientLogsRequest(p1) --[[ line: 46 ]]
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

local _ = function(p2) --[[ line: 63 | named "decodePersistedToolResultText" ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, p2)
	
	return if not (not ok or typeof(status) ~= "table") then if typeof(status.text) == "string" then status.text else nil else nil
end

local function getPersistedToolResultText(p3) --[[ line: 73 ]]
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
				local var6 = if ok and typeof(status) == "table" then if typeof(status.text) == "string" then status.text else nil else nil
				
				if var6 ~= nil and var6 ~= "" then
					table.insert(t, var6)
				end
			end
		end
	end
	return if #t > 0 then table.concat(t) else nil
end

return {
	TOOL_NAME = "ask_for_logs",
	NOT_IN_GAME_MESSAGE = "The user is not in the game.",
	STALE_LOGS_MESSAGE = "The available logs are from an older saved version. Playtest the latest version first.",
	LOCAL_TOOL_DEFINITION = t,
	toolCallLooksLikeClientLogsRequest = toolCallLooksLikeClientLogsRequest,
	findClientLogsRequestInTurnState = function(p4, p5) --[[ line: 96 ]]
		-- upvalues: fFlagCreatorAgentChatFilterTerminalClientToolsModule (ref), getPersistedToolResultText (ref)
		local t = {}
		
		for i in p4.toolCalls do
			table.insert(t, i)
		end
		table.sort(t)
		
		for i_1, v in t do
			if not p5 or not p5[v] then
				local var8 = p4.toolCalls[v]
				
				if (not fFlagCreatorAgentChatFilterTerminalClientToolsModule or var8.status ~= "completed" and var8.status ~= "failed" and var8.status ~= "cancelled") and getPersistedToolResultText(var8) == nil then
					local var9
					local kind = var8.kind
					
					if not (typeof(kind) == "string" and string.lower(kind) == "ask_for_logs") then
						kind = var8.title
						
						if typeof(kind) == "string" and string.lower(kind) == "ask_for_logs" then
							var9 = true
						else
							local rawInput = var8.rawInput
							
							if typeof(rawInput) == "table" then
								kind = rawInput.name
								var9 = typeof(kind) == "string" and string.lower(kind) == "ask_for_logs"
								
								if not var9 then
									kind = rawInput.toolName
									var9 = false
									
									if typeof(kind) == "string" then
										var9 = string.lower(kind) == "ask_for_logs"
										var9 = nil
									end
								end
							else
								var9 = false
							end
						end
						if var9 then
							return v, var8.rawInput, var8.turnId, var8.referenceId
						end
					end
				end
			end
		end
		return nil, nil, nil, nil
	end,
	formatLogsContent = function(p6, p7) --[[ line: 128 ]]
		-- upvalues: httpService (ref)
		return {
			text = httpService:JSONEncode({ status = "ok", clientLogs = p6, serverLogs = p7 })
		}
	end,
	formatNotInGameContent = function() --[[ line: 138 ]]
		-- upvalues: httpService (ref)
		return {
			text = httpService:JSONEncode({
				status = "not_in_game",
				message = "The user is not in the game."
			})
		}
	end,
	formatStaleLogsContent = function() --[[ line: 147 ]]
		-- upvalues: httpService (ref)
		return {
			text = httpService:JSONEncode({
				status = "stale",
				message = "The available logs are from an older saved version. Playtest the latest version first."
			})
		}
	end
}