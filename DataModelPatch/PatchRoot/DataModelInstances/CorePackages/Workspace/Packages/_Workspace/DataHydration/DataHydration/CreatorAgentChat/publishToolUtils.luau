local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.types)
local list = {
	"studio_save_and_publish",
	"cas_save_and_publish",
	"save_and_publish"
}
local t = {}

for _, value in list do
	t[string.lower((string.gsub(value, "[_%-%s]", "")))] = true
end
local config = {
	save_and_publish = true,
	cas_save_and_publish = true,
	studio_save_and_publish = true
}

local function _(Text: string): string
	return string.lower((string.gsub(Text, "[_%-%s]", "")))
end

local _ = function(Text: string): boolean
	-- upvalues: t (copy)
	local Lowered = string.lower((string.gsub(Text, "[_%-%s]", "")))
	
	return if t[Lowered] then true else string.find(Lowered, "publishplace", 1, true) ~= nil
end

local _ = function(Text: string): boolean
	-- upvalues: t (copy)
	local HasFoundAt = false
	
	if typeof(Text) == "string" then
		HasFoundAt = false
		
		if Text ~= "" then
			local Lowered = string.lower((string.gsub(Text, "[_%-%s]", "")))
			
			if t[Lowered] then
				return true
			end
			HasFoundAt = string.find(Lowered, "publishplace", 1, true) ~= nil
		end
	end
	return HasFoundAt
end

local _ = function(Text: string): boolean
	-- upvalues: config (copy)
	return typeof(Text) == "string" and config[string.lower(Text)] == true
end

local function toolCallMatchesPublishPlace(p1): boolean
	-- upvalues: t (copy)
	local Kind: string = p1.kind
	local HasFoundAt = false
	
	if typeof(Kind) == "string" then
		HasFoundAt = false
		
		if Kind ~= "" then
			local Lowered = string.lower((string.gsub(Kind, "[_%-%s]", "")))
			HasFoundAt = if t[Lowered] then true else string.find(Lowered, "publishplace", 1, true) ~= nil
		end
	end
	if not HasFoundAt then
		local Title: string = p1.title
		local HasFoundAt1 = false
		
		if typeof(Title) == "string" then
			HasFoundAt1 = false
			
			if Title ~= "" then
				local Lowered = string.lower((string.gsub(Title, "[_%-%s]", "")))
				HasFoundAt1 = if t[Lowered] then true else string.find(Lowered, "publishplace", 1, true) ~= nil
			end
		end
		if not HasFoundAt1 then
			local RawInput = p1.rawInput
			
			if typeof(RawInput) ~= "table" then
				return false
			end
			for _, value in {
				"tool",
				"name",
				"action",
				"command",
				"toolName"
			} do
				local Text: string = RawInput[value]
				local HasFoundAt2 = false
				
				if typeof(Text) == "string" then
					HasFoundAt2 = false
					
					if Text ~= "" then
						local Lowered = string.lower((string.gsub(Text, "[_%-%s]", "")))
						HasFoundAt2 = if t[Lowered] then true else string.find(Lowered, "publishplace", 1, true) ~= nil
					end
				end
				if HasFoundAt2 then
					return true
				end
			end
			return false
		end
	end
	return true
end

local function isSaveAndPublishToolCall(p2): boolean
	-- upvalues: config (copy)
	local Title: string = p2.title
	
	if typeof(Title) ~= "string" or config[string.lower(Title)] ~= true then
		local Kind: string = p2.kind
		
		if typeof(Kind) ~= "string" or config[string.lower(Kind)] ~= true then
			local RawInput = p2.rawInput
			
			if typeof(RawInput) ~= "table" then
				return false
			end
			for _, value in {
				"tool",
				"name",
				"action",
				"command",
				"toolName"
			} do
				local Text: string = RawInput[value]
				
				if typeof(Text) == "string" and config[string.lower(Text)] == true then
					return true
				end
			end
			return false
		end
	end
	return true
end

local _ = function(Text: string)
	local Match: string? = string.match(Text, "^%s*Saved as version%s+(%d+)%s*%.?%s*$")
	
	return if Match == nil then nil else tonumber(Match)
end

local _ = function(p3)
	-- upvalues: HttpService (copy)
	local Success, Result = pcall(HttpService.JSONDecode, HttpService, p3)
	
	return if Success and typeof(Result) == "table" and (Result.type == "text" and typeof(Result.text) == "string") then Result else nil
end

local function getToolCallPublishedVersionNumber(p3)
	-- upvalues: HttpService (copy)
	local Content = p3.content
	
	if typeof(Content) ~= "table" then
		return nil
	end
	local Number = nil
	for _, value in Content do
		local Text = if typeof(value.content) == "table" then value.content.text else value.text
		
		if typeof(Text) == "string" then
			local Success, Result = pcall(HttpService.JSONDecode, HttpService, Text)
			local Result1 = if Success and typeof(Result) == "table" and (Result.type == "text" and typeof(Result.text) == "string") then Result else nil
			local NoResult = Result1 == nil
			
			if not NoResult then
				local Match: string? = string.match(Result1.text, "^%s*Saved as version%s+(%d+)%s*%.?%s*$")
				Number = if Match == nil then nil else tonumber(Match)
				NoResult = Number == nil
			end
			if not NoResult then
				return Number
			end
		end
	end
	return nil
end

return {
	PUBLISH_PLACE_TOOL_IDENTIFIERS = list,
	includesPublishPlaceTool = function(p4): boolean
		-- upvalues: toolCallMatchesPublishPlace (copy)
		for _, toolCall in p4.toolCalls do
			if toolCall.status ~= "failed" and toolCallMatchesPublishPlace(toolCall) then
				return true
			end
		end
		return false
	end,
	toolCallMatchesPublishPlace = toolCallMatchesPublishPlace,
	getLatestSuccessfulResult = function(p5)
		-- upvalues: isSaveAndPublishToolCall (copy), getToolCallPublishedVersionNumber (copy)
		if p5 == nil then
			return nil
		end
		local v1 = nil
		
		for ToolCallId, toolCall in p5.toolCalls do
			if toolCall.status == "completed" and isSaveAndPublishToolCall(toolCall) then
				local ToolCallPublishedVersionNumber: number = getToolCallPublishedVersionNumber(toolCall)
				
				if ToolCallPublishedVersionNumber ~= nil then
					v1 = {
						toolCallId = ToolCallId,
						publishedVersionNumber = ToolCallPublishedVersionNumber,
						rollbackTargetVersionNumber = if ToolCallPublishedVersionNumber > 1 then ToolCallPublishedVersionNumber - 1 else nil
					}
				end
			end
		end
		return v1
	end
}