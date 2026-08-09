local _ = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.CreatorAgentChat)
local list = {
	"studio_save_and_publish",
	"cas_save_and_publish",
	"save_and_publish"
}
local t = {}

for i, v in list do
	t[string.lower(string.gsub(v, "[_%-%s]", ""))] = true
end
local function _(p0) --[[ line: 30 | named "normalizeToolIdentifier" ]]
	return string.lower(string.gsub(p0, "[_%-%s]", ""))
end

local _ = function(p1) --[[ line: 35 | named "identifierMatchesPublish" ]]
	-- upvalues: t (ref)
	local lowerText = string.lower(string.gsub(p1, "[_%-%s]", ""))
	
	return if t[lowerText] then true else string.find(lowerText, "publishplace", 1, true) ~= nil
end

local _ = function(p2) --[[ line: 43 | named "valueLooksLikePublishTool" ]]
	-- upvalues: t (ref)
	local var4 = false
	
	if typeof(p2) == "string" then
		var4 = false
		
		if p2 ~= "" then
			local lowerText = string.lower(string.gsub(p2, "[_%-%s]", ""))
			
			if t[lowerText] then
				return true
			end
			var4 = string.find(lowerText, "publishplace", 1, true) ~= nil
		end
	end
	return var4
end

local function toolCallMatchesPublishPlace(p3) --[[ line: 47 ]]
	-- upvalues: t (ref)
	local kind = p3.kind
	local rawInput = false
	
	if typeof(kind) == "string" then
		rawInput = false
		
		if kind ~= "" then
			local lowerText = string.lower(string.gsub(kind, "[_%-%s]", ""))
			rawInput = if t[lowerText] then true else string.find(lowerText, "publishplace", 1, true) ~= nil
		end
	end
	if not rawInput then
		local title = p3.title
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
		rawInput = p3.rawInput
		
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
			local var8 = rawInput[v]
			local var9 = false
			
			if typeof(var8) == "string" then
				var9 = false
				
				if var8 ~= "" then
					local lowerText = string.lower(string.gsub(var8, "[_%-%s]", ""))
					var9 = if t[lowerText] then true else string.find(lowerText, "publishplace", 1, true) ~= nil
				end
			end
			if var9 then
				return true
			end
		end
		return false
	end
end

return {
	PUBLISH_PLACE_TOOL_IDENTIFIERS = list,
	includesPublishPlaceTool = function(p4) --[[ line: 66 ]]
		-- upvalues: toolCallMatchesPublishPlace (ref)
		for i, v in p4.toolCalls do
			if v.status ~= "failed" and toolCallMatchesPublishPlace(v) then
				return true
			end
		end
		return false
	end,
	toolCallMatchesPublishPlace = toolCallMatchesPublishPlace
}