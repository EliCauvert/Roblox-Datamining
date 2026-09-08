local httpService = game:GetService("HttpService")
local _ = require(script.Parent.types)
local t = {
	create = true,
	list = true,
	update = true,
	activate = true,
	deactivate = true
}
local t_1 = {
	name = "manage_developer_product",
	inputSchema = {
		type = "object",
		additionalProperties = false,
		required = { "action" },
		properties = {
			action = {
				type = "string",
				enum = {
					"create",
					"list",
					"update",
					"activate",
					"deactivate"
				}
			},
			name = { type = "string" },
			description = { type = "string" },
			priceInRobux = { type = "integer" },
			productId = { type = "integer" }
		}
	}
}

local function _(p1)
	return typeof(p1) == "string" and string.lower(p1) == "manage_developer_product"
end

local function toolCallLooksLikeRequest(p1)
	local kind = p1.kind
	
	if not (typeof(kind) == "string" and string.lower(kind) == "manage_developer_product") then
		kind = p1.title
		
		if typeof(kind) == "string" and string.lower(kind) == "manage_developer_product" then
			return true
		end
		local rawInput = p1.rawInput
		
		if typeof(rawInput) ~= "table" then
			return false
		end
		local name = rawInput.name
		kind = typeof(name) == "string" and string.lower(name) == "manage_developer_product"
		
		if not kind then
			local toolName = rawInput.toolName
			kind = typeof(toolName) == "string" and string.lower(toolName) == "manage_developer_product"
		end
		return kind
	end
end

local _ = function(p1)
	local var1 = tonumber(p1)
	
	return if var1 == nil or var1 % 1 ~= 0 then nil else var1
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

return {
	TOOL_NAME = "manage_developer_product",
	LOCAL_TOOL_DEFINITION = t_1,
	toolCallLooksLikeRequest = toolCallLooksLikeRequest,
	findManageDevProductRequestInTurnState = function(p2, p3)
		-- upvalues: hasPersistedToolResult (ref)
		local t = {}
		
		for i in p2.toolCalls do
			table.insert(t, i)
		end
		table.sort(t)
		
		for i_1, v in t do
			if not p3 or not p3[v] then
				local var1 = p2.toolCalls[v]
				
				if (var1.status == nil or var1.status == "pending" or var1.status == "in_progress") and not hasPersistedToolResult(var1) then
					local var2
					local kind = var1.kind
					
					if not (typeof(kind) == "string" and string.lower(kind) == "manage_developer_product") then
						kind = var1.title
						
						if typeof(kind) == "string" and string.lower(kind) == "manage_developer_product" then
							var2 = true
						else
							local rawInput = var1.rawInput
							
							if typeof(rawInput) == "table" then
								kind = rawInput.name
								var2 = typeof(kind) == "string" and string.lower(kind) == "manage_developer_product"
								
								if not var2 then
									kind = rawInput.toolName
									var2 = false
									
									if typeof(kind) == "string" then
										var2 = string.lower(kind) == "manage_developer_product"
										var2 = nil
									end
								end
							else
								var2 = false
							end
						end
						if var2 then
							return v, var1.rawInput, var1.turnId, var1.referenceId
						end
					end
				end
			end
		end
		return nil, nil, nil, nil
	end,
	parseManageDevProductInput = function(p4)
		-- upvalues: t (ref)
		if typeof(p4) ~= "table" then
			return nil
		end
		local action = p4.action
		
		if typeof(action) ~= "string" then
			return nil
		end
		local lowerText = string.lower(action)
		
		if not t[lowerText] then
			return nil
		end
		local t_1 = { action = lowerText }
		
		if typeof(p4.name) == "string" then
			t_1.name = p4.name
		end
		if typeof(p4.description) == "string" then
			t_1.description = p4.description
		end
		local var3 = tonumber(p4.priceInRobux)
		local var4 = if var3 == nil or var3 % 1 ~= 0 then nil else var3
		
		if var4 ~= nil then
			t_1.priceInRobux = var4
		end
		local var5 = tonumber(p4.productId)
		local var6 = if var5 == nil or var5 % 1 ~= 0 then nil else var5
		
		if var6 ~= nil then
			t_1.productId = var6
		end
		if lowerText == "create" then
			if t_1.name == nil or t_1.name == "" or t_1.priceInRobux == nil then
				return nil
			end
		elseif lowerText == "update" then
			if t_1.productId == nil or t_1.name == nil and t_1.description == nil and t_1.priceInRobux == nil then
				return nil
			end
		else
			return if (lowerText == "activate" or lowerText == "deactivate") and t_1.productId == nil then nil else t_1
		end
	end,
	getActionKind = function(p4)
		return if p4 == "list" then "read" else "mutation"
	end,
	formatResultContent = function(p4)
		-- upvalues: httpService (ref)
		local var3 = if typeof(p4) == "table" and typeof(p4.action) == "string" then p4.action else "unknown"
		local ok, status = pcall(httpService.JSONEncode, httpService, p4)
		
		if not ok then
			return {
				text = httpService:JSONEncode({
					status = "error",
					detailCode = "result_serialization_failed",
					message = "The client tool result could not be serialized.",
					action = var3
				})
			}, true
		elseif #status > 524288 then
			return {
				text = httpService:JSONEncode({
					status = "error",
					detailCode = "result_too_large",
					message = "The client tool result exceeded the response size limit.",
					action = var3
				})
			}, true
		end
		return { text = status }, false
	end,
	formatRejectionContent = function(p4, p5)
		-- upvalues: httpService (ref)
		return {
			text = httpService:JSONEncode({
				status = "cancelled",
				accepted = false,
				message = "The creator declined the change.",
				action = p4,
				feedbackText = p5
			})
		}
	end
}