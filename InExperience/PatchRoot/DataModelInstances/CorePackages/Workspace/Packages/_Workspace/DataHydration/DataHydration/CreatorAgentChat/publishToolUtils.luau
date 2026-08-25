local httpService = game:GetService("HttpService")
local sharedFlagsModule = require(script:FindFirstAncestor("DataHydration").Parent.SharedFlags)
local debugModule = require(script.Parent.debug)
local _ = require(script.Parent.types)
local fFlagCreatorAgentChatParseDirectPublishVersion = sharedFlagsModule.FFlagCreatorAgentChatParseDirectPublishVersion
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

local function _(p0)
	return string.lower(string.gsub(p0, "[_%-%s]", ""))
end

local _ = function(p1)
	-- upvalues: t (ref)
	local lowerText = string.lower(string.gsub(p1, "[_%-%s]", ""))
	
	return if t[lowerText] then true else string.find(lowerText, "publishplace", 1, true) ~= nil
end

i = function(p2)
	-- upvalues: t (ref)
	local var11 = false
	
	if typeof(p2) == "string" then
		var11 = false
		
		if p2 ~= "" then
			local lowerText = string.lower(string.gsub(p2, "[_%-%s]", ""))
			
			if t[lowerText] then
				return true
			end
			var11 = string.find(lowerText, "publishplace", 1, true) ~= nil
		end
	end
	return var11
end

local _ = function(p3)
	-- upvalues: t_1 (ref)
	return typeof(p3) == "string" and t_1[string.lower(p3)] == true
end

local function toolCallMatchesPublishPlace(p4)
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
			local var15 = rawInput[v]
			local var16 = false
			
			if typeof(var15) == "string" then
				var16 = false
				
				if var15 ~= "" then
					local lowerText = string.lower(string.gsub(var15, "[_%-%s]", ""))
					var16 = if t[lowerText] then true else string.find(lowerText, "publishplace", 1, true) ~= nil
				end
			end
			if var16 then
				return true
			end
		end
		return false
	end
end

local function isSaveAndPublishToolCall(p5)
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
			local var18 = rawInput[v]
			
			if typeof(var18) ~= "string" and t_1[string.lower(var18)] == true then
				return true
			end
		end
		return false
	end
end

local function includesPublishPlaceTool(p6)
	-- upvalues: toolCallMatchesPublishPlace (ref)
	for i, v in p6.toolCalls do
		if v.status ~= "failed" and toolCallMatchesPublishPlace(v) then
			return true
		end
	end
	return false
end

local _ = function(p7)
	local match = string.match(p7, "^%s*Saved as version%s+(%d+)%s*%.?%s*$")
	
	return if match == nil then nil else tonumber(match)
end

local _ = function(value)
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, value)
	
	return if not (not ok or typeof(status) ~= "table") then if status.type == "text" and typeof(status.text) == "string" then status else nil else nil
end

local function getToolCallPublishedVersionNumber(p8)
	-- upvalues: httpService (ref), fFlagCreatorAgentChatParseDirectPublishVersion (ref)
	local content = p8.content
	
	if typeof(content) ~= "table" then
		return nil
	end
	for i, v in content do
		local var20 = if typeof(v.content) == "table" then v.content.text else v.text
		
		if typeof(var20) == "string" then
			local ok, status = pcall(httpService.JSONDecode, httpService, var20)
			local var21 = if not ok or typeof(status) ~= "table" then if status.type == "text" and typeof(status.text) == "string" then status else nil else nil
			ok = if var21 ~= nil then if fFlagCreatorAgentChatParseDirectPublishVersion then var20 else nil else var21.text
			
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
	getLatestSuccessfulResult = function(p9)
		-- upvalues: isSaveAndPublishToolCall (ref), getToolCallPublishedVersionNumber (ref), fFlagCreatorAgentChatParseDirectPublishVersion (ref), debugModule (ref)
		if p9 == nil then
			return nil
		end
		local t = nil
		
		for i, v in p9.toolCalls do
			if v.status == "completed" and isSaveAndPublishToolCall(v) then
				local var24 = getToolCallPublishedVersionNumber(v)
				
				if var24 ~= nil then
					t = {
						toolCallId = i,
						publishedVersionNumber = var24,
						rollbackTargetVersionNumber = if var24 > 1 then var24 - 1 else nil
					}
				elseif fFlagCreatorAgentChatParseDirectPublishVersion then
					debugModule.log("warn", "completed save_and_publish result is not parseable", {
						toolCallId = v.toolCallId,
						title = v.title,
						status = v.status,
						contentBlockCount = if typeof(v.content) == "table" then #v.content else 0,
						hasRawOutput = v.rawOutput ~= nil
					})
				end
			end
		end
		return t
	end
}