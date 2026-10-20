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

local _ = function(p3)
	local Number: number? = tonumber(p3)
	
	return if Number == nil or Number % 1 ~= 0 then nil else Number
end

return {
	MAXIMUM_SAFE_INTEGER = 9007199254740991,
	toolCallLooksLikeRequest = toolCallLooksLikeRequest,
	findRequestInTurnState = findRequestInTurnState,
	parsePositiveSafeInteger = function(p3)
		local Number: number? = tonumber(p3)
		local Number1 = if Number == nil or Number % 1 ~= 0 then nil else Number
		
		return if Number1 == nil or Number1 < 1 or Number1 > 9007199254740991 then nil else Number1
	end,
	parsePrice = function(p3, p4, p5)
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
	parseCreateAndGoLive = function(p3, p4)
		if p3 == nil then
			return nil, nil
		elseif p4 == "create" and typeof(p3) == "boolean" then
			return if p3 then true else nil, nil
		else
			return nil, "createAndGoLive must be a boolean on create."
		end
	end,
	parseAction = function(p3, List)
		if typeof(p3) ~= "table" or typeof(p3.action) ~= "string" then
			return nil, "An action is required."
		end
		local Lowered = string.lower(p3.action)
		
		if table.find(List, Lowered) then
			return Lowered, nil
		else
			return nil, ("Unsupported action '%s'."):format(p3.action)
		end
	end,
	checkStringFields = function(p3, List): string?
		for _, value in List do
			if p3[value] ~= nil and typeof(p3[value]) ~= "string" then
				return ("%s must be a string."):format(value)
			end
		end
		return nil
	end,
	createRequestFinder = function(p4)
		-- upvalues: findRequestInTurnState (copy)
		return function(p5, p6)
			-- upvalues: findRequestInTurnState (upval), p4 (copy)
			return findRequestInTurnState(p5, p4, p6)
		end
	end,
	formatResultContent = function(p4)
		-- upvalues: HttpService (copy)
		local Action = if typeof(p4) == "table" and typeof(p4.action) == "string" then p4.action else "unknown"
		local Success, Result = pcall(HttpService.JSONEncode, HttpService, p4)
		
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
	formatRejectionContent = function(Action, FeedbackText)
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
	getActionKind = function(p4): string
		return if p4 == "list" then "read" else "mutation"
	end
}