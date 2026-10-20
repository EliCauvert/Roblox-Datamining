local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.types)

local function _(Text: string, Lowered): boolean
	return typeof(Text) == "string" and string.lower(Text) == Lowered
end

local function toolCallLooksLikeRequest(ToolCall, Lowered): boolean
	local Kind: string = ToolCall.kind
	
	if typeof(Kind) ~= "string" or string.lower(Kind) ~= Lowered then
		local Title: string = ToolCall.title
		
		if typeof(Title) ~= "string" or string.lower(Title) ~= Lowered then
			local RawInput = ToolCall.rawInput
			
			if typeof(RawInput) ~= "table" then
				return false
			end
			local Name: string = RawInput.name
			local IsLoweredMatch: boolean = typeof(Name) == "string" and string.lower(Name) == Lowered
			
			if not IsLoweredMatch then
				local ToolName: string = RawInput.toolName
				IsLoweredMatch = typeof(ToolName) == "string" and string.lower(ToolName) == Lowered
			end
			return IsLoweredMatch
		end
	end
	return true
end

local function hasPersistedToolResult(ToolCall): boolean
	-- upvalues: HttpService (copy)
	if ToolCall.content == nil then
		return false
	end
	for _, value in ToolCall.content do
		if value.type == "content" and value.content ~= nil then
			local Content = value.content
			
			if Content.type == "text" and typeof(Content.text) == "string" then
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, Content.text)
				
				if Success and typeof(Result) == "table" and typeof(Result.text) == "string" and Result.text ~= "" then
					return true
				end
			end
		end
	end
	return false
end

local function findRequestInTurnState(p1, Lowered, p2)
	-- upvalues: hasPersistedToolResult (copy), toolCallLooksLikeRequest (copy)
	local List = {}
	
	for toolCall in p1.toolCalls do
		table.insert(List, toolCall)
	end
	table.sort(List)
	local ToolCall = nil
	
	for _, value in List do
		if not p2 or not p2[value] then
			ToolCall = p1.toolCalls[value]
			
			if (ToolCall.status == nil or ToolCall.status == "pending" or ToolCall.status == "in_progress") and not hasPersistedToolResult(ToolCall) and toolCallLooksLikeRequest(ToolCall, Lowered) then
				return value, ToolCall.rawInput, ToolCall.turnId, ToolCall.referenceId
			end
		end
	end
	return nil, nil, nil, nil
end

return {
	SEARCH_TOOL_NAME = "search_client_datamodel",
	INSPECT_TOOL_NAME = "inspect_client_instance",
	SEARCH_LOCAL_TOOL_DEFINITION = {
		name = "search_client_datamodel",
		inputSchema = {
			type = "object",
			properties = {
				path = { type = "string" },
				instance_type = { type = "string" },
				keywords = { type = "string" },
				max_depth = { type = "integer" },
				head_limit = { type = "integer" }
			}
		}
	},
	INSPECT_LOCAL_TOOL_DEFINITION = {
		name = "inspect_client_instance",
		inputSchema = {
			type = "object",
			properties = { path = { type = "string" } },
			required = { "path" }
		}
	},
	toolCallLooksLikeRequest = toolCallLooksLikeRequest,
	findSearchRequestInTurnState = function(p3, p4)
		-- upvalues: findRequestInTurnState (copy)
		return findRequestInTurnState(p3, "search_client_datamodel", p4)
	end,
	findInspectRequestInTurnState = function(p3, p4)
		-- upvalues: findRequestInTurnState (copy)
		return findRequestInTurnState(p3, "inspect_client_instance", p4)
	end,
	formatResultContent = function(p3)
		-- upvalues: HttpService (copy)
		local Success, Result = pcall(HttpService.JSONEncode, HttpService, p3)
		
		return if Success then if #Result > 524288 then {
			text = HttpService:JSONEncode({
				status = "result_too_large",
				message = "The client tool result exceeded the response size limit."
			})
		} else { text = Result } else {
			text = HttpService:JSONEncode({
				status = "serialization_failed",
				message = "The client tool result could not be serialized."
			})
		}
	end
}