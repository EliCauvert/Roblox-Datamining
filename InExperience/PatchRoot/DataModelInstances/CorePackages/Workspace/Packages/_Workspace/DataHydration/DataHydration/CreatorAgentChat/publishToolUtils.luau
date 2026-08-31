local httpService = game:GetService("HttpService")
local debugModule = require(script.Parent.debug)
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

local function _(p1)
	return string.lower(string.gsub(p1, "[_%-%s]", ""))
end

local _ = function(p1)
	-- upvalues: t (ref)
	local lowerText = string.lower(string.gsub(p1, "[_%-%s]", ""))
	
	return if t[lowerText] then true else string.find(lowerText, "publishplace", 1, true) ~= nil
end

i = function(p1)
	-- upvalues: t (ref)
	local var1 = false
	
	if typeof(p1) == "string" then
		var1 = false
		
		if p1 ~= "" then
			local lowerText = string.lower(string.gsub(p1, "[_%-%s]", ""))
			
			if t[lowerText] then
				return true
			end
			var1 = string.find(lowerText, "publishplace", 1, true) ~= nil
		end
	end
	return var1
end

local _ = function(p1)
	-- upvalues: t_1 (ref)
	return typeof(p1) == "string" and t_1[string.lower(p1)] == true
end

local function toolCallMatchesPublishPlace(p1)
	-- upvalues: t (ref)
	local kind = p1.kind
	local rawInput = false
	
	if typeof(kind) == "string" then
		rawInput = false
		
		if kind ~= "" then
			local lowerText = string.lower(string.gsub(kind, "[_%-%s]", ""))
			rawInput = if t[lowerText] then true else string.find(lowerText, "publishplace", 1, true) ~= nil
		end
	end
	if not rawInput then
		local title = p1.title
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
		rawInput = p1.rawInput
		
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
			local var1 = rawInput[v]
			local var2 = false
			
			if typeof(var1) == "string" then
				var2 = false
				
				if var1 ~= "" then
					local lowerText = string.lower(string.gsub(var1, "[_%-%s]", ""))
					var2 = if t[lowerText] then true else string.find(lowerText, "publishplace", 1, true) ~= nil
				end
			end
			if var2 then
				return true
			end
		end
		return false
	end
end

local function isSaveAndPublishToolCall(p2)
	-- upvalues: t_1 (ref)
	local title = p2.title
	
	if not (typeof(title) ~= "string" and t_1[string.lower(title)] == true) then
		title = p2.kind
		
		if typeof(title) ~= "string" and t_1[string.lower(title)] == true then
			return true
		end
		local rawInput = p2.rawInput
		
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
			local var3 = rawInput[v]
			
			if typeof(var3) ~= "string" and t_1[string.lower(var3)] == true then
				return true
			end
		end
		return false
	end
end

local function includesPublishPlaceTool(p3)
	-- upvalues: toolCallMatchesPublishPlace (ref)
	for i, v in p3.toolCalls do
		if v.status ~= "failed" and toolCallMatchesPublishPlace(v) then
			return true
		end
	end
	return false
end

local _ = function(p4)
	local match = string.match(p4, "^%s*Saved as version%s+(%d+)%s*%.?%s*$")
	
	return if match == nil then nil else tonumber(match)
end

local _ = function(value)
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, value)
	
	return if not (not ok or typeof(status) ~= "table") then if status.type == "text" and typeof(status.text) == "string" then status else nil else nil
end

local function getToolCallPublishedVersionNumber(p4, p5)
	-- upvalues: httpService (ref)
	local content = p4.content
	
	if typeof(content) ~= "table" then
		return nil
	end
	for i, v in content do
		local var4 = if typeof(v.content) == "table" then v.content.text else v.text
		
		if typeof(var4) == "string" then
			local ok, status = pcall(httpService.JSONDecode, httpService, var4)
			local var5 = if not ok or typeof(status) ~= "table" then if status.type == "text" and typeof(status.text) == "string" then status else nil else nil
			ok = if var5 ~= nil then if p5 then var4 else nil else var5.text
			
			if ok ~= nil then
				local match = string.match(ok, "^%s*Saved as version%s+(%d+)%s*%.?%s*$")
				status = if match == nil then nil else tonumber(match)
				
				if status ~= nil then
					return status
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
	getLatestSuccessfulResult = function(p6, _)
		-- upvalues: isSaveAndPublishToolCall (ref), getToolCallPublishedVersionNumber (ref), debugModule (ref)
		if p6 == nil then
			return nil
		end
		local t = nil
		
		for i, v in p6.toolCalls do
			if v.status == "completed" and isSaveAndPublishToolCall(v) then
				local var6 = getToolCallPublishedVersionNumber(v, true)
				
				if var6 == nil then
					debugModule.log("warn", "completed save_and_publish result is not parseable", {
						toolCallId = v.toolCallId,
						title = v.title,
						status = v.status,
						contentBlockCount = if typeof(v.content) == "table" then #v.content else 0,
						hasRawOutput = v.rawOutput ~= nil
					})
				else
					t = {
						toolCallId = i,
						publishedVersionNumber = var6,
						rollbackTargetVersionNumber = if var6 > 1 then var6 - 1 else nil
					}
				end
			end
		end
		return t
	end
}