local HttpService = game:GetService("HttpService")
local FFlagBuildExperienceRemoveDevProductPriceCap = require(script:FindFirstAncestor("DataHydration").Parent.SharedFlags).FFlagBuildExperienceRemoveDevProductPriceCap
local _ = require(script.Parent.types)
local FFlagCreatorAgentChatMonetizationToolHelpersModule = require(script.Parent.FFlagCreatorAgentChatMonetizationToolHelpers)
local MonetizationClientToolModule = if FFlagCreatorAgentChatMonetizationToolHelpersModule then require(script.Parent.monetizationClientTool) else nil
local config = {
	create = true,
	list = true,
	update = true,
	activate = true,
	deactivate = true
}

local function _(Text: string): boolean
	return typeof(Text) == "string" and string.lower(Text) == "manage_developer_product"
end

local function toolCallLooksLikeRequest(ToolCall)
	-- upvalues: FFlagCreatorAgentChatMonetizationToolHelpersModule (copy), MonetizationClientToolModule (copy)
	if FFlagCreatorAgentChatMonetizationToolHelpersModule then
		return MonetizationClientToolModule.toolCallLooksLikeRequest(ToolCall, "manage_developer_product")
	end
	local Kind: string = ToolCall.kind
	
	if typeof(Kind) ~= "string" or string.lower(Kind) ~= "manage_developer_product" then
		local Title: string = ToolCall.title
		
		if typeof(Title) ~= "string" or string.lower(Title) ~= "manage_developer_product" then
			local RawInput = ToolCall.rawInput
			
			if typeof(RawInput) ~= "table" then
				return false
			end
			local Name: string = RawInput.name
			local IsManageDeveloperProduct: boolean = typeof(Name) == "string" and string.lower(Name) == "manage_developer_product"
			
			if not IsManageDeveloperProduct then
				local ToolName: string = RawInput.toolName
				IsManageDeveloperProduct = typeof(ToolName) == "string" and string.lower(ToolName) == "manage_developer_product"
			end
			return IsManageDeveloperProduct
		end
	end
	return true
end

local _ = function(p1)
	local Number: number? = tonumber(p1)
	
	return if Number == nil or Number % 1 ~= 0 then nil else Number
end

local function hasPersistedToolResult(ToolCall): boolean
	-- upvalues: HttpService (copy)
	if ToolCall.content == nil then
		return false
	end
	for _, value in ToolCall.content do
		if value.type == "content" and value.content ~= nil then
			local Content = value.content
			
			if Content.type == "text" and typeof(Content.text) == "string" then
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, Content.text)
				
				if Success and typeof(Result) == "table" and typeof(Result.text) == "string" and Result.text ~= "" then
					return true
				end
			end
		end
	end
	return false
end

return {
	TOOL_NAME = "manage_developer_product",
	LOCAL_TOOL_DEFINITION = {
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
				priceInRobux = {
					type = "integer",
					minimum = 1,
					maximum = if FFlagBuildExperienceRemoveDevProductPriceCap then nil else 100
				},
				productId = { type = "integer" },
				imageAssetId = { type = "integer", minimum = 1 }
			}
		}
	},
	toolCallLooksLikeRequest = toolCallLooksLikeRequest,
	findManageDevProductRequestInTurnState = function(p1, p2)
		-- upvalues: FFlagCreatorAgentChatMonetizationToolHelpersModule (copy), MonetizationClientToolModule (copy), hasPersistedToolResult (copy), toolCallLooksLikeRequest (copy)
		if FFlagCreatorAgentChatMonetizationToolHelpersModule then
			return MonetizationClientToolModule.findRequestInTurnState(p1, "manage_developer_product", p2)
		end
		local List = {}
		
		for toolCall in p1.toolCalls do
			table.insert(List, toolCall)
		end
		table.sort(List)
		local ToolCall = nil
		
		for _, value in List do
			if not p2 or not p2[value] then
				ToolCall = p1.toolCalls[value]
				
				if (ToolCall.status == nil or ToolCall.status == "pending" or ToolCall.status == "in_progress") and not hasPersistedToolResult(ToolCall) and toolCallLooksLikeRequest(ToolCall) then
					return value, ToolCall.rawInput, ToolCall.turnId, ToolCall.referenceId
				end
			end
		end
		return nil, nil, nil, nil
	end,
	parseManageDevProductInput = function(p3)
		-- upvalues: config (copy), FFlagBuildExperienceRemoveDevProductPriceCap (copy)
		if typeof(p3) ~= "table" then
			return nil
		end
		local Action: string = p3.action
		
		if typeof(Action) ~= "string" then
			return nil
		end
		local Lowered = string.lower(Action)
		
		if not config[Lowered] then
			return nil
		end
		local config1 = { action = Lowered }
		
		if typeof(p3.name) == "string" then
			config1.name = p3.name
		end
		if typeof(p3.description) == "string" then
			config1.description = p3.description
		end
		if p3.priceInRobux ~= nil then
			local Number: number? = tonumber(p3.priceInRobux)
			local Number1 = if Number == nil or Number % 1 ~= 0 then nil else Number
			
			if Number1 == nil or Number1 < 1 or not FFlagBuildExperienceRemoveDevProductPriceCap and Number1 > 100 then
				return nil
			end
			config1.priceInRobux = Number1
		end
		local Number: number? = tonumber(p3.productId)
		local Number2 = if Number == nil or Number % 1 ~= 0 then nil else Number
		
		if Number2 ~= nil then
			config1.productId = Number2
		end
		if p3.imageAssetId ~= nil then
			local Number3: number? = tonumber(p3.imageAssetId)
			local Number31 = if Number3 == nil or Number3 % 1 ~= 0 then nil else Number3
			
			if Number31 == nil or Number31 < 1 or Lowered ~= "create" then
				return nil
			end
			config1.imageAssetId = Number31
		end
		if Lowered == "create" then
			if config1.name == nil or config1.name == "" or config1.priceInRobux == nil then
				return nil
			end
		elseif Lowered == "update" then
			if config1.productId == nil or config1.name == nil and config1.description == nil and config1.priceInRobux == nil then
				return nil
			end
		elseif (Lowered == "activate" or Lowered == "deactivate") and config1.productId == nil then
			return nil
		end
		return config1
	end,
	getActionKind = function(p3)
		-- upvalues: FFlagCreatorAgentChatMonetizationToolHelpersModule (copy), MonetizationClientToolModule (copy)
		return if FFlagCreatorAgentChatMonetizationToolHelpersModule then MonetizationClientToolModule.getActionKind(p3) elseif p3 == "list" then "read" else "mutation"
	end,
	formatResultContent = function(p3)
		-- upvalues: FFlagCreatorAgentChatMonetizationToolHelpersModule (copy), MonetizationClientToolModule (copy), HttpService (copy)
		if FFlagCreatorAgentChatMonetizationToolHelpersModule then
			return MonetizationClientToolModule.formatResultContent(p3)
		end
		local Action = if typeof(p3) == "table" and typeof(p3.action) == "string" then p3.action else "unknown"
		local Success, Result = pcall(HttpService.JSONEncode, HttpService, p3)
		
		if not Success then
			return {
				text = HttpService:JSONEncode({
					status = "error",
					detailCode = "result_serialization_failed",
					message = "The client tool result could not be serialized.",
					action = Action
				})
			}, true
		elseif #Result > 524288 then
			return {
				text = HttpService:JSONEncode({
					status = "error",
					detailCode = "result_too_large",
					message = "The client tool result exceeded the response size limit.",
					action = Action
				})
			}, true
		else
			return { text = Result }, false
		end
	end,
	formatRejectionContent = function(Action, FeedbackText)
		-- upvalues: FFlagCreatorAgentChatMonetizationToolHelpersModule (copy), MonetizationClientToolModule (copy), HttpService (copy)
		return if FFlagCreatorAgentChatMonetizationToolHelpersModule then MonetizationClientToolModule.formatRejectionContent(Action, FeedbackText) else {
			text = HttpService:JSONEncode({
				status = "cancelled",
				accepted = false,
				message = "The creator declined the change.",
				action = Action,
				feedbackText = FeedbackText
			})
		}
	end
}