local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.types)
local config = { present_plan = true, propose_plan = true }

local function _(Text: string): boolean
	-- upvalues: config (copy)
	return typeof(Text) == "string" and config[string.lower(Text)] == true
end

local function getRawInputContent(RawInput)
	if typeof(RawInput) == "string" then
		return RawInput, nil, nil
	elseif typeof(RawInput) ~= "table" then
		return nil, nil, nil
	else
		local Content = RawInput.content
		
		if typeof(Content) ~= "string" or Content == "" then
			return nil, nil, nil
		end
		local Title = if typeof(RawInput.title) == "string" and RawInput.title ~= "" then RawInput.title else nil
		
		if typeof(RawInput.summary) == "string" and RawInput.summary ~= "" then
			return Content, Title, RawInput.summary
		else
			return Content, Title, nil
		end
	end
end

local _ = function(p1): boolean
	-- upvalues: config (copy)
	local Kind: string = p1.kind
	
	if typeof(Kind) ~= "string" or config[string.lower(Kind)] ~= true then
		local Title: string = p1.title
		
		if typeof(Title) ~= "string" or config[string.lower(Title)] ~= true then
			local RawInput = p1.rawInput
			
			if typeof(RawInput) ~= "table" then
				return false
			end
			local Name: string = RawInput.name
			local IsEntry: boolean = typeof(Name) == "string" and config[string.lower(Name)] == true
			
			if not IsEntry then
				local ToolName: string = RawInput.toolName
				IsEntry = typeof(ToolName) == "string" and config[string.lower(ToolName)] == true
			end
			return IsEntry
		end
	end
	return true
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

local function getToolCallOrder(p1, ToolCallId)
	if p1.activityItems ~= nil then
		for i, activityItem in p1.activityItems do
			if activityItem.kind == "tool_call" and activityItem.toolCallId == ToolCallId then
				return i
			end
		end
	end
	local List = {}
	
	for toolCall in p1.toolCalls do
		table.insert(List, toolCall)
	end
	table.sort(List)
	
	for i1, value in List do
		if value == ToolCallId then
			return i1
		end
	end
	return 0
end

local _ = function(p2)
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(HttpService.JSONDecode, HttpService, p2)
	
	return if Success and typeof(Result) == "table" and (typeof(Result.accepted) == "boolean" and (Result.feedbackText == nil or typeof(Result.feedbackText) == "string")) then Result else nil
end

return {
	TOOL_NAME = "present_plan",
	LOCAL_TOOL_DEFINITION = {
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
	},
	extractPlanFromToolCall = function(p2)
		-- upvalues: config (copy), getRawInputContent (copy)
		local Kind: string = p2.kind
		local Flag = nil
		repeat
			if typeof(Kind) ~= "string" or config[string.lower(Kind)] ~= true then
				local Title: string = p2.title
				
				if typeof(Title) ~= "string" or config[string.lower(Title)] ~= true then
					local RawInput = p2.rawInput
					
					if typeof(RawInput) == "table" then
						local Name: string = RawInput.name
						Flag = typeof(Name) == "string" and config[string.lower(Name)] == true
						
						if Flag then break end
						local ToolName: string = RawInput.toolName
						Flag = typeof(ToolName) == "string" and config[string.lower(ToolName)] == true
						break
					end
					Flag = false
				end
			end
			Flag = true
			break
		until true
		if Flag then
			local RawInputContent, RawInputContent2, RawInputContent3 = getRawInputContent(p2.rawInput)
			
			return if RawInputContent == nil then nil else {
				title = RawInputContent2 or "Proposed Plan",
				textContent = RawInputContent,
				summary = RawInputContent3
			}
		else
			return nil
		end
	end,
	findPlanInTurnState = function(p2, p3)
		-- upvalues: getPersistedToolResultText (copy), config (copy), getRawInputContent (copy)
		local List = {}
		
		for toolCall in p2.toolCalls do
			table.insert(List, toolCall)
		end
		table.sort(List)
		local v1 = nil
		local ToolCall = nil
		
		for _, value in List do
			local IsCompleted = p3 and p3[value]
			
			if not IsCompleted then
				ToolCall = p2.toolCalls[value]
				IsCompleted = ToolCall.status == "completed" or ToolCall.status == "failed" or ToolCall.status == "cancelled" or getPersistedToolResultText(ToolCall) ~= nil
			end
			if not IsCompleted then
				local Kind: string = ToolCall.kind
				local IsEntry: boolean = typeof(Kind) == "string" and config[string.lower(Kind)] == true
				
				if not IsEntry then
					local Title: string = ToolCall.title
					IsEntry = typeof(Title) == "string" and config[string.lower(Title)] == true
				end
				local Flag = nil
				if IsEntry then
					Flag = true
				else
					local RawInput = ToolCall.rawInput
					
					if typeof(RawInput) == "table" then
						local Name: string = RawInput.name
						Flag = typeof(Name) == "string" and config[string.lower(Name)] == true
						
						if not Flag then
							local ToolName: string = RawInput.toolName
							Flag = typeof(ToolName) == "string" and config[string.lower(ToolName)] == true
						end
					else
						Flag = false
					end
				end
				if Flag then
					local RawInputContent, RawInputContent2, RawInputContent3 = getRawInputContent(ToolCall.rawInput)
					v1 = if RawInputContent == nil then nil else {
						title = RawInputContent2 or "Proposed Plan",
						textContent = RawInputContent,
						summary = RawInputContent3
					}
				else
					v1 = nil
				end
				if v1 ~= nil then
					return v1, value, ToolCall.rawInput, ToolCall.turnId, ToolCall.referenceId
				end
			end
		end
		return nil, nil, nil, nil, nil
	end,
	getCompletedPlansFromTurnState = function(p4)
		-- upvalues: config (copy), getRawInputContent (copy), getPersistedToolResultText (copy), HttpService (copy), getToolCallOrder (copy)
		local List = {}
		local List1 = {}
		
		for toolCall in p4.toolCalls do
			table.insert(List1, toolCall)
		end
		table.sort(List1)
		
		for _, ToolCallId in List1 do
			local ToolCall = p4.toolCalls[ToolCallId]
			local Kind: string = ToolCall.kind
			local IsEntry: boolean = typeof(Kind) == "string" and config[string.lower(Kind)] == true
			
			if not IsEntry then
				local Title: string = ToolCall.title
				IsEntry = typeof(Title) == "string" and config[string.lower(Title)] == true
			end
			local Flag = nil
			if IsEntry then
				Flag = true
			else
				local RawInput = ToolCall.rawInput
				
				if typeof(RawInput) == "table" then
					local Name: string = RawInput.name
					Flag = typeof(Name) == "string" and config[string.lower(Name)] == true
					
					if not Flag then
						local ToolName: string = RawInput.toolName
						Flag = typeof(ToolName) == "string" and config[string.lower(ToolName)] == true
					end
				else
					Flag = false
				end
			end
			local v2 = nil
			if Flag then
				local RawInputContent, RawInputContent2, RawInputContent3 = getRawInputContent(ToolCall.rawInput)
				v2 = if RawInputContent == nil then nil else {
					title = RawInputContent2 or "Proposed Plan",
					textContent = RawInputContent,
					summary = RawInputContent3
				}
			else
				v2 = nil
			end
			local PersistedToolResultText = getPersistedToolResultText(ToolCall)
			local Result1 = nil
			
			if PersistedToolResultText == nil then
				Result1 = nil
			else
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, PersistedToolResultText)
				Result1 = if Success and typeof(Result) == "table" and (typeof(Result.accepted) == "boolean" and (Result.feedbackText == nil or typeof(Result.feedbackText) == "string")) then Result else nil
			end
			if v2 ~= nil and Result1 ~= nil then
				table.insert(List, {
					title = v2.title,
					textContent = v2.textContent,
					summary = v2.summary,
					toolCallId = ToolCallId,
					callOrder = getToolCallOrder(p4, ToolCallId),
					isAccepted = Result1.accepted,
					feedbackText = Result1.feedbackText
				})
			end
		end
		return List
	end,
	formatAcceptedContent = function()
		-- upvalues: HttpService (copy)
		return { text = HttpService:JSONEncode({ accepted = true }) }
	end,
	formatFeedbackContent = function(FeedbackText)
		-- upvalues: HttpService (copy)
		return {
			text = HttpService:JSONEncode({ accepted = false, feedbackText = FeedbackText })
		}
	end
}