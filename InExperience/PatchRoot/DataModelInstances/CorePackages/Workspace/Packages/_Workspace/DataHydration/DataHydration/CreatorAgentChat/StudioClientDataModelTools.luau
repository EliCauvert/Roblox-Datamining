local httpService = game:GetService("HttpService")
local _ = require(script.Parent.types)
local t = {
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
}
local t_1 = {
	name = "inspect_client_instance",
	inputSchema = {
		type = "object",
		properties = { path = { type = "string" } },
		required = { "path" }
	}
}

local function _(p1, p2)
	return typeof(p1) == "string" and string.lower(p1) == p2
end

local function toolCallLooksLikeRequest(p1, p2)
	local kind = p1.kind
	
	if not (typeof(kind) == "string" and string.lower(kind) == p2) then
		kind = p1.title
		
		if typeof(kind) == "string" and string.lower(kind) == p2 then
			return true
		end
		local rawInput = p1.rawInput
		
		if typeof(rawInput) ~= "table" then
			return false
		end
		local name = rawInput.name
		kind = typeof(name) == "string" and string.lower(name) == p2
		
		if not kind then
			local toolName = rawInput.toolName
			kind = typeof(toolName) == "string" and string.lower(toolName) == p2
		end
		return kind
	end
end

local function hasPersistedToolResult(p1)
	-- upvalues: httpService (ref)
	if p1.content == nil then
		return false
	end
	for i, v in p1.content do
		if v.type == "content" and v.content ~= nil then
			local content = v.content
			
			if content.type == "text" and typeof(content.text) == "string" then
				local ok, status = pcall(httpService.JSONDecode, httpService, content.text)
				
				if ok and typeof(status) == "table" and (typeof(status.text) == "string" and status.text ~= "") then
					return true
				end
			end
		end
	end
	return false
end

local function findRequestInTurnState(p2, p3, p4)
	-- upvalues: hasPersistedToolResult (ref), toolCallLooksLikeRequest (ref)
	local t = {}
	
	for i in p2.toolCalls do
		table.insert(t, i)
	end
	table.sort(t)
	
	for i_1, v in t do
		if not p4 or not p4[v] then
			local var1 = p2.toolCalls[v]
			
			if (var1.status == nil or var1.status == "pending" or var1.status == "in_progress") and (not hasPersistedToolResult(var1) and toolCallLooksLikeRequest(var1, p3)) then
				return v, var1.rawInput, var1.turnId, var1.referenceId
			end
		end
	end
	return nil, nil, nil, nil
end

return {
	SEARCH_TOOL_NAME = "search_client_datamodel",
	INSPECT_TOOL_NAME = "inspect_client_instance",
	SEARCH_LOCAL_TOOL_DEFINITION = t,
	INSPECT_LOCAL_TOOL_DEFINITION = t_1,
	toolCallLooksLikeRequest = toolCallLooksLikeRequest,
	findSearchRequestInTurnState = function(p5, p6)
		-- upvalues: findRequestInTurnState (ref)
		return findRequestInTurnState(p5, "search_client_datamodel", p6)
	end,
	findInspectRequestInTurnState = function(p5, p6)
		-- upvalues: findRequestInTurnState (ref)
		return findRequestInTurnState(p5, "inspect_client_instance", p6)
	end,
	formatResultContent = function(p5)
		-- upvalues: httpService (ref)
		local ok, status = pcall(httpService.JSONEncode, httpService, p5)
		
		return if ok then if #status > 524288 then {
			text = httpService:JSONEncode({
				status = "result_too_large",
				message = "The client tool result exceeded the response size limit."
			})
		} else { text = status } else {
			text = httpService:JSONEncode({
				status = "serialization_failed",
				message = "The client tool result could not be serialized."
			})
		}
	end
}