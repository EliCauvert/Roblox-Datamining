local httpService = game:GetService("HttpService")
local _ = require(script.Parent.types)
local list = {
	"studio_save_and_publish",
	"cas_save_and_publish",
	"save_and_publish"
}
local t = {}

for i, v in list do
	t[string.lower(string.gsub(v, "[_%-%s]", ""))] = true
end
local t_1 = {
	save_and_publish = true,
	cas_save_and_publish = true,
	studio_save_and_publish = true
}

local function _(p0) --[[ line: 39 | named "normalizeToolIdentifier" ]]
	return string.lower(string.gsub(p0, "[_%-%s]", ""))
end

local _ = function(p1) --[[ line: 44 | named "identifierMatchesPublish" ]]
	-- upvalues: t (ref)
	local lowerText = string.lower(string.gsub(p1, "[_%-%s]", ""))
	
	return if t[lowerText] then true else string.find(lowerText, "publishplace", 1, true) ~= nil
end

i = function(p2) --[[ line: 52 | named "valueLooksLikePublishTool" ]]
	-- upvalues: t (ref)
	local var9 = false
	
	if typeof(p2) == "string" then
		var9 = false
		
		if p2 ~= "" then
			local lowerText = string.lower(string.gsub(p2, "[_%-%s]", ""))
			
			if t[lowerText] then
				return true
			end
			var9 = string.find(lowerText, "publishplace", 1, true) ~= nil
		end
	end
	return var9
end

local _ = function(p3) --[[ line: 56 | named "isSaveAndPublishValue" ]]
	-- upvalues: t_1 (ref)
	return typeof(p3) == "string" and t_1[string.lower(p3)] == true
end

local function toolCallMatchesPublishPlace(p4) --[[ line: 63 ]]
	-- upvalues: t (ref)
	local kind = p4.kind
	local rawInput = false
	
	if typeof(kind) == "string" then
		rawInput = false
		
		if kind ~= "" then
			local lowerText = string.lower(string.gsub(kind, "[_%-%s]", ""))
			rawInput = if t[lowerText] then true else string.find(lowerText, "publishplace", 1, true) ~= nil
		end
	end
	if not rawInput then
		local title = p4.title
		rawInput = false
		
		if typeof(title) == "string" then
			rawInput = false
			
			if title ~= "" then
				local lowerText = string.lower(string.gsub(title, "[_%-%s]", ""))
				rawInput = if t[lowerText] then true else string.find(lowerText, "publishplace", 1, true) ~= nil
			end
		end
		if rawInput then
			return true
		end
		rawInput = p4.rawInput
		
		if typeof(rawInput) ~= "table" then
			return false
		end
		for i, v in {
			"tool",
			"name",
			"action",
			"command",
			"toolName"
		} do
			local var13 = rawInput[v]
			local var14 = false
			
			if typeof(var13) == "string" then
				var14 = false
				
				if var13 ~= "" then
					local lowerText = string.lower(string.gsub(var13, "[_%-%s]", ""))
					var14 = if t[lowerText] then true else string.find(lowerText, "publishplace", 1, true) ~= nil
				end
			end
			if var14 then
				return true
			end
		end
		return false
	end
end

local function isSaveAndPublishToolCall(p5) --[[ line: 82 ]]
	-- upvalues: t_1 (ref)
	local title = p5.title
	
	if not (typeof(title) ~= "string" and t_1[string.lower(title)] == true) then
		title = p5.kind
		
		if typeof(title) ~= "string" and t_1[string.lower(title)] == true then
			return true
		end
		local rawInput = p5.rawInput
		
		if typeof(rawInput) ~= "table" then
			return false
		end
		for i, v in {
			"tool",
			"name",
			"action",
			"command",
			"toolName"
		} do
			local var16 = rawInput[v]
			
			if typeof(var16) ~= "string" and t_1[string.lower(var16)] == true then
				return true
			end
		end
		return false
	end
end

local function includesPublishPlaceTool(p6) --[[ line: 99 ]]
	-- upvalues: toolCallMatchesPublishPlace (ref)
	for i, v in p6.toolCalls do
		if v.status ~= "failed" and toolCallMatchesPublishPlace(v) then
			return true
		end
	end
	return false
end

local _ = function(p7) --[[ line: 111 | named "parsePublishedVersionNumber" ]]
	local match = string.match(p7, "^%s*Saved as version%s+(%d+)%s*%.?%s*$")
	
	return if match == nil then nil else tonumber(match)
end

local _ = function(value) --[[ line: 119 | named "parseTextResult" ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, value)
	
	return if not (not ok or typeof(status) ~= "table") then if status.type == "text" and typeof(status.text) == "string" then status else nil else nil
end

local function getToolCallPublishedVersionNumber(p8) --[[ line: 130 ]]
	-- upvalues: httpService (ref)
	local content = p8.content
	
	if typeof(content) ~= "table" then
		return nil
	end
	for i, v in content do
		local var18 = if typeof(v.content) == "table" then v.content.text else v.text
		
		if typeof(var18) == "string" then
			local ok, status = pcall(httpService.JSONDecode, httpService, var18)
			local var19 = if not ok or typeof(status) ~= "table" then if status.type == "text" and typeof(status.text) == "string" then status else nil else nil
			
			if var19 ~= nil then
				local match = string.match(var19.text, "^%s*Saved as version%s+(%d+)%s*%.?%s*$")
				ok = if match == nil then nil else tonumber(match)
				
				if ok ~= nil then
					return ok
				end
			end
		end
	end
	return nil
end

return {
	PUBLISH_PLACE_TOOL_IDENTIFIERS = list,
	includesPublishPlaceTool = includesPublishPlaceTool,
	toolCallMatchesPublishPlace = toolCallMatchesPublishPlace,
	getLatestSuccessfulResult = function(p9) --[[ line: 158 ]]
		-- upvalues: isSaveAndPublishToolCall (ref), getToolCallPublishedVersionNumber (ref)
		if p9 == nil then
			return nil
		end
		local t = nil
		
		for i, v in p9.toolCalls do
			if v.status == "completed" and isSaveAndPublishToolCall(v) then
				local var22 = getToolCallPublishedVersionNumber(v)
				
				if var22 ~= nil then
					t = {
						toolCallId = i,
						publishedVersionNumber = var22,
						rollbackTargetVersionNumber = if var22 > 1 then var22 - 1 else nil
					}
				end
			end
		end
		return t
	end
}