local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.types)

local function _(Text: string): boolean
	return typeof(Text) == "string" and string.lower(Text) == "ask_for_logs"
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

return {
	TOOL_NAME = "ask_for_logs",
	NOT_IN_GAME_MESSAGE = "The user is not in the game.",
	LOCAL_TOOL_DEFINITION = {
		name = "ask_for_logs",
		inputSchema = {
			type = "object",
			properties = { reason = { type = "string" } }
		}
	},
	toolCallLooksLikeClientLogsRequest = function(p1): boolean
		local Kind: string = p1.kind
		
		if typeof(Kind) ~= "string" or string.lower(Kind) ~= "ask_for_logs" then
			local Title: string = p1.title
			
			if typeof(Title) ~= "string" or string.lower(Title) ~= "ask_for_logs" then
				local RawInput = p1.rawInput
				
				if typeof(RawInput) ~= "table" then
					return false
				end
				local Name: string = RawInput.name
				local IsAskForLogs: boolean = typeof(Name) == "string" and string.lower(Name) == "ask_for_logs"
				
				if not IsAskForLogs then
					local ToolName: string = RawInput.toolName
					IsAskForLogs = typeof(ToolName) == "string" and string.lower(ToolName) == "ask_for_logs"
				end
				return IsAskForLogs
			end
		end
		return true
	end,
	findClientLogsRequestInTurnState = function(p1, p2)
		-- upvalues: getPersistedToolResultText (copy)
		local List = {}
		
		for toolCall in p1.toolCalls do
			table.insert(List, toolCall)
		end
		table.sort(List)
		local ToolCall = nil
		
		for _, value in List do
			if not p2 or not p2[value] then
				ToolCall = p1.toolCalls[value]
				
				if getPersistedToolResultText(ToolCall) == nil then
					local Kind: string = ToolCall.kind
					local IsAskForLogs: boolean = typeof(Kind) == "string" and string.lower(Kind) == "ask_for_logs"
					
					if not IsAskForLogs then
						local Title: string = ToolCall.title
						IsAskForLogs = typeof(Title) == "string" and string.lower(Title) == "ask_for_logs"
					end
					local IsAskForLogs1 = nil
					if IsAskForLogs then
						IsAskForLogs1 = true
					else
						local RawInput = ToolCall.rawInput
						
						if typeof(RawInput) == "table" then
							local Name: string = RawInput.name
							IsAskForLogs1 = typeof(Name) == "string" and string.lower(Name) == "ask_for_logs"
							
							if not IsAskForLogs1 then
								local ToolName: string = RawInput.toolName
								IsAskForLogs1 = typeof(ToolName) == "string" and string.lower(ToolName) == "ask_for_logs"
							end
						else
							IsAskForLogs1 = false
						end
					end
					if IsAskForLogs1 then
						return value, ToolCall.rawInput, ToolCall.turnId, ToolCall.referenceId
					end
				end
			end
		end
		return nil, nil, nil, nil
	end,
	formatLogsContent = function(ClientLogs, ServerLogs)
		-- upvalues: HttpService (copy)
		return {
			text = HttpService:JSONEncode({
				status = "ok",
				clientLogs = ClientLogs,
				serverLogs = ServerLogs
			})
		}
	end,
	formatNotInGameContent = function()
		-- upvalues: HttpService (copy)
		return {
			text = HttpService:JSONEncode({
				status = "not_in_game",
				message = "The user is not in the game."
			})
		}
	end
}