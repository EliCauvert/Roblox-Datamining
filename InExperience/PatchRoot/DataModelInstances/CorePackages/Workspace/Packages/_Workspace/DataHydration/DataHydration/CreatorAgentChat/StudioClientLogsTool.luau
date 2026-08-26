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

local function _(p1)
	return typeof(p1) == "string" and string.lower(p1) == "ask_for_logs"
end

local function toolCallLooksLikeClientLogsRequest(p1)
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

return {
	TOOL_NAME = "ask_for_logs",
	NOT_IN_GAME_MESSAGE = "The user is not in the game.",
	STALE_LOGS_MESSAGE = "The available logs are from an older saved version. Playtest the latest version first.",
	LOCAL_TOOL_DEFINITION = t,
	toolCallLooksLikeClientLogsRequest = toolCallLooksLikeClientLogsRequest,
	findClientLogsRequestInTurnState = function(p2, p3)
		-- upvalues: fFlagCreatorAgentChatFilterTerminalClientToolsModule (ref), getPersistedToolResultText (ref)
		local t = {}
		
		for i in p2.toolCalls do
			table.insert(t, i)
		end
		table.sort(t)
		
		for i_1, v in t do
			if not p3 or not p3[v] then
				local var2 = p2.toolCalls[v]
				
				if (not fFlagCreatorAgentChatFilterTerminalClientToolsModule or var2.status ~= "completed" and var2.status ~= "failed" and var2.status ~= "cancelled") and getPersistedToolResultText(var2) == nil then
					local var3
					local kind = var2.kind
					
					if not (typeof(kind) == "string" and string.lower(kind) == "ask_for_logs") then
						kind = var2.title
						
						if typeof(kind) == "string" and string.lower(kind) == "ask_for_logs" then
							var3 = true
						else
							local rawInput = var2.rawInput
							
							if typeof(rawInput) == "table" then
								kind = rawInput.name
								var3 = typeof(kind) == "string" and string.lower(kind) == "ask_for_logs"
								
								if not var3 then
									kind = rawInput.toolName
									var3 = false
									
									if typeof(kind) == "string" then
										var3 = string.lower(kind) == "ask_for_logs"
										var3 = nil
									end
								end
							else
								var3 = false
							end
						end
						if var3 then
							return v, var2.rawInput, var2.turnId, var2.referenceId
						end
					end
				end
			end
		end
		return nil, nil, nil, nil
	end,
	formatLogsContent = function(p4, p5)
		-- upvalues: httpService (ref)
		return {
			text = httpService:JSONEncode({ status = "ok", clientLogs = p4, serverLogs = p5 })
		}
	end,
	formatNotInGameContent = function()
		-- upvalues: httpService (ref)
		return {
			text = httpService:JSONEncode({
				status = "not_in_game",
				message = "The user is not in the game."
			})
		}
	end,
	formatStaleLogsContent = function()
		-- upvalues: httpService (ref)
		return {
			text = httpService:JSONEncode({
				status = "stale",
				message = "The available logs are from an older saved version. Playtest the latest version first."
			})
		}
	end
}