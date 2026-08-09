local httpService = game:GetService("HttpService")
local _ = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local t = {
	save_and_publish = true,
	cas_save_and_publish = true,
	studio_save_and_publish = true
}

local function _(p0) --[[ line: 30 | named "isSaveAndPublishValue" ]]
	-- upvalues: t (ref)
	return typeof(p0) == "string" and t[string.lower(p0)] == true
end

local function isSaveAndPublishToolCall(p1) --[[ line: 37 ]]
	-- upvalues: t (ref)
	local title = p1.title
	
	if not (typeof(title) ~= "string" and t[string.lower(title)] == true) then
		title = p1.kind
		
		if typeof(title) ~= "string" and t[string.lower(title)] == true then
			return true
		end
		local rawInput = p1.rawInput
		
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
			local var4 = rawInput[v]
			
			if typeof(var4) ~= "string" and t[string.lower(var4)] == true then
				return true
			end
		end
		return false
	end
end

local _ = function(p2) --[[ line: 54 | named "parsePublishedVersionNumber" ]]
	local match = string.match(p2, "^%s*Saved as version%s+(%d+)%s*%.?%s*$")
	
	return if match == nil then nil else tonumber(match)
end

local _ = function(value) --[[ line: 62 | named "parseTextResult" ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(httpService.JSONDecode, httpService, value)
	
	return if not (not ok or typeof(status) ~= "table") then if status.type == "text" and typeof(status.text) == "string" then status else nil else nil
end

local function getToolCallPublishedVersionNumber(p3) --[[ line: 73 ]]
	-- upvalues: httpService (ref)
	local content = p3.content
	
	if typeof(content) ~= "table" then
		return nil
	end
	for i, v in content do
		local var6 = if typeof(v.content) == "table" then v.content.text else v.text
		
		if typeof(var6) == "string" then
			local ok, status = pcall(httpService.JSONDecode, httpService, var6)
			local var7 = if not ok or typeof(status) ~= "table" then if status.type == "text" and typeof(status.text) == "string" then status else nil else nil
			
			if var7 ~= nil then
				local match = string.match(var7.text, "^%s*Saved as version%s+(%d+)%s*%.?%s*$")
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
	getLatestSuccessfulResult = function(p4) --[[ line: 101 ]]
		-- upvalues: isSaveAndPublishToolCall (ref), getToolCallPublishedVersionNumber (ref)
		if p4 == nil then
			return nil
		end
		local t = nil
		
		for i, v in p4.toolCalls do
			if v.status == "completed" and isSaveAndPublishToolCall(v) then
				local var10 = getToolCallPublishedVersionNumber(v)
				
				if var10 ~= nil then
					t = {
						toolCallId = i,
						publishedVersionNumber = var10,
						rollbackTargetVersionNumber = if var10 > 1 then var10 - 1 else nil
					}
				end
			end
		end
		return t
	end
}