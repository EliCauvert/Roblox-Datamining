local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.types)

local function _(Text: string, Lowered): boolean --[[ Line: 13 | Named "valueIs" ]]
	return typeof(Text) == "string" and string.lower(Text) == Lowered
end

local function toolCallLooksLikeRequest(ToolCall, Lowered): boolean --[[ Line: 17 ]]
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

local function hasPersistedToolResult(ToolCall): boolean --[[ Line: 28 ]]
	-- upvalues: HttpService (copy)
	if ToolCall.content == nil then
		return false
	end
	for _, value in ToolCall.content do
		local Content = value.content
		
		if value.type == "content" and Content ~= nil and Content.type == "text" and typeof(Content.text) == "string" then
			local Success, Result = pcall(HttpService.JSONDecode, HttpService, Content.text)
			
			if Success and typeof(Result) == "table" and typeof(Result.text) == "string" and Result.text ~= "" then
				return true
			end
		end
	end
	return false
end

return {
	MAXIMUM_SAFE_INTEGER = 9007199254740991,
	toolCallLooksLikeRequest = toolCallLooksLikeRequest,
	findRequestInTurnState = function(p1, Lowered, p2) --[[ Line: 48 ]]
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
	end,
	parseInteger = function(p3) --[[ Line: 74 ]]
		local Number: number? = tonumber(p3)
		
		return if Number == nil or Number % 1 ~= 0 then nil else Number
	end,
	parsePositiveSafeInteger = function(p3) --[[ Line: 82 ]]
		local Number: number? = tonumber(p3)
		local Number1 = if Number == nil or Number % 1 ~= 0 then nil else Number
		
		return if Number1 == nil or Number1 < 1 or Number1 > 9007199254740991 then nil else Number1
	end,
	parsePrice = function(p3, p4, p5) --[[ Line: 90 ]]
		if p3 == nil then
			return nil, nil
		end
		local Number: number? = tonumber(p3)
		local Number1 = if Number == nil or Number % 1 ~= 0 then nil else Number
		
		if Number1 == nil or Number1 < p4 or p5 < Number1 then
			return nil, ("priceInRobux must be a whole number from %.0f through %.0f."):format(p4, p5)
		else
			return Number1, nil
		end
	end,
	formatResultContent = function(p3) --[[ Line: 101 ]]
		-- upvalues: HttpService (copy)
		local Action = if typeof(p3) == "table" and typeof(p3.action) == "string" then p3.action else "unknown"
		local Success, Result = pcall(HttpService.JSONEncode, HttpService, p3)
		
		if Success and #Result <= 524288 then
			return { text = Result }, false
		else
			return {
				text = HttpService:JSONEncode({
					status = "error",
					action = Action,
					detailCode = if Success then "result_too_large" else "result_serialization_failed",
					message = if Success then "The client tool result exceeded the response size limit." else "The client tool result could not be serialized."
				})
			}, true
		end
	end,
	formatRejectionContent = function(Action, FeedbackText) --[[ Line: 122 ]]
		-- upvalues: HttpService (copy)
		return {
			text = HttpService:JSONEncode({
				status = "cancelled",
				accepted = false,
				message = "The creator declined the change.",
				action = Action,
				feedbackText = FeedbackText
			})
		}
	end,
	getActionKind = function(p3): string --[[ Line: 134 ]]
		return if p3 == "list" then "read" else "mutation"
	end
}