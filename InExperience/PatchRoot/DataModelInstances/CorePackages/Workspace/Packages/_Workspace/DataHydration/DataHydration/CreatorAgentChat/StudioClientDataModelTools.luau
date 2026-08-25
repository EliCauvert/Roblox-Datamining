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

local function _(p0, p1)
	return typeof(p0) == "string" and string.lower(p0) == p1
end

local function toolCallLooksLikeRequest(p2, p3)
	local kind = p2.kind
	
	if not (typeof(kind) == "string" and string.lower(kind) == p3) then
		kind = p2.title
		
		if typeof(kind) == "string" and string.lower(kind) == p3 then
			return true
		end
		local rawInput = p2.rawInput
		
		if typeof(rawInput) ~= "table" then
			return false
		end
		local name = rawInput.name
		kind = typeof(name) == "string" and string.lower(name) == p3
		
		if not kind then
			local toolName = rawInput.toolName
			kind = typeof(toolName) == "string" and string.lower(toolName) == p3
		end
		return kind
	end
end

local function hasPersistedToolResult(p4)
	-- upvalues: httpService (ref)
	if p4.content == nil then
		return false
	end
	for i, v in p4.content do
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

local function findRequestInTurnState(p5, p6, p7)
	-- upvalues: hasPersistedToolResult (ref), toolCallLooksLikeRequest (ref)
	local t = {}
	
	for i in p5.toolCalls do
		table.insert(t, i)
	end
	table.sort(t)
	
	for i_1, v in t do
		if not p7 or not p7[v] then
			local var7 = p5.toolCalls[v]
			
			if (var7.status == nil or var7.status == "pending" or var7.status == "in_progress") and (not hasPersistedToolResult(var7) and toolCallLooksLikeRequest(var7, p6)) then
				return v, var7.rawInput, var7.turnId, var7.referenceId
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
	findSearchRequestInTurnState = function(p8, p9)
		-- upvalues: findRequestInTurnState (ref)
		return findRequestInTurnState(p8, "search_client_datamodel", p9)
	end,
	findInspectRequestInTurnState = function(p10, p11)
		-- upvalues: findRequestInTurnState (ref)
		return findRequestInTurnState(p10, "inspect_client_instance", p11)
	end,
	formatResultContent = function(p12)
		-- upvalues: httpService (ref)
		local ok, status = pcall(httpService.JSONEncode, httpService, p12)
		
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