local _ = require(script.Parent.types)
local MonetizationClientToolModule = require(script.Parent.monetizationClientTool)
local FFlagCreatorAgentChatMonetizationOneConsentModule = require(script.Parent.FFlagCreatorAgentChatMonetizationOneConsent)
local StudioManageDevProductToolModule = require(script.Parent.StudioManageDevProductTool)
local TOOLNAME = StudioManageDevProductToolModule.TOOL_NAME
local MAXIMUMSAFEINTEGER = MonetizationClientToolModule.MAXIMUM_SAFE_INTEGER
local Text = "Per-kind ranges are checked on the client: developerProduct " .. (if require(script:FindFirstAncestor("DataHydration").Parent.SharedFlags).FFlagBuildExperienceRemoveDevProductPriceCap then "at least 1" else "1 through 100") .. ", gamePass 1 through 999,999,999, subscription at least 49."
local config = {
	developerproduct = "developerProduct",
	gamepass = "gamePass",
	subscription = "subscription"
}
local config1 = {
	developerProduct = "productId",
	gamePass = "gamePassId",
	subscription = "subscriptionId"
}
local config2 = {
	developerProduct = {
		"gamePassId",
		"subscriptionId",
		"productType",
		"cancelRenewals",
		"createAndGoLive"
	},
	gamePass = {
		"productId",
		"subscriptionId",
		"productType",
		"cancelRenewals",
		"imageAssetId"
	},
	subscription = { "productId", "gamePassId" }
}

local function resolveKind(p1)
	-- upvalues: config (copy)
	return if typeof(p1) == "table" and typeof(p1.kind) == "string" then config[string.lower(p1.kind)] else nil
end

local function describeKindError(p1): string
	return if typeof(p1) == "table" and p1.kind ~= nil then ("Unsupported kind '%s'. Use developerProduct, gamePass or subscription."):format((tostring(p1.kind))) else "kind is required: developerProduct, gamePass or subscription."
end

local function findCrossKindError(p1, Kind)
	-- upvalues: config2 (copy), config1 (copy)
	for _, value in config2[Kind] do
		if p1[value] ~= nil then
			local Entry = config1[Kind]
			
			return if string.sub(value, -2) == "Id" then ("%s does not apply to kind=%s. Use %s."):format(value, Kind, Entry) else ("%s does not apply to kind=%s."):format(value, Kind)
		end
	end
	return if Kind == "subscription" or typeof(p1.action) ~= "string" or string.lower(p1.action) ~= "delete" then nil else "delete is only supported for kind=subscription."
end

local config3 = {
	developerProduct = function(p2)
		-- upvalues: StudioManageDevProductToolModule (copy)
		return StudioManageDevProductToolModule.parseManageDevProductInput(p2), nil
	end,
	gamePass = require(script.Parent.StudioManageGamePassTool).parseInput,
	subscription = require(script.Parent.StudioManageSubscriptionTool).parseInput
}

local function _(Tbl)
	if typeof(Tbl) == "table" then
		local Copy = table.clone(Tbl)
		Copy.kind = "developerProduct"
		
		return Copy
	else
		return Tbl
	end
end

return {
	TOOL_NAME = "manage_monetization",
	KINDS = { "developerProduct", "gamePass", "subscription" },
	resolveKind = resolveKind,
	createLocalToolDefinition = function(List)
		-- upvalues: MAXIMUMSAFEINTEGER (copy), Text (copy), FFlagCreatorAgentChatMonetizationOneConsentModule (copy)
		local t = {}
		
		for _, value in List do
			t[value] = true
		end
		local IsGamePass: boolean = t.gamePass == true or t.subscription == true
		local List1 = {
			"create",
			"list",
			"update",
			"activate",
			"deactivate"
		}
		
		if t.subscription then
			table.insert(List1, "delete")
		end
		return {
			name = "manage_monetization",
			inputSchema = {
				type = "object",
				additionalProperties = false,
				required = { "kind", "action" },
				properties = {
					kind = { type = "string", enum = List },
					action = { type = "string", enum = List1 },
					name = { type = "string" },
					description = { type = "string" },
					priceInRobux = {
						type = "integer",
						minimum = 1,
						maximum = MAXIMUMSAFEINTEGER,
						description = Text
					},
					productId = if t.developerProduct then { type = "integer" } else nil,
					gamePassId = if t.gamePass then {
						type = "integer",
						minimum = 1,
						maximum = MAXIMUMSAFEINTEGER
					} else nil,
					subscriptionId = if t.subscription then { type = "string" } else nil,
					productType = if t.subscription then {
						type = "string",
						enum = { "consumable", "currency", "durable" }
					} else nil,
					cancelRenewals = if t.subscription then { type = "boolean" } else nil,
					imageAssetId = {
						type = "integer",
						minimum = 1,
						maximum = MAXIMUMSAFEINTEGER
					},
					createAndGoLive = if FFlagCreatorAgentChatMonetizationOneConsentModule and IsGamePass then {
						type = "boolean",
						description = "Only for create of a gamePass or subscription when the creator explicitly requests creation and going live in one approval. Creation stays off sale or inactive until a supported benefit is published and verified; custom or uncertain wiring stays off without another approval."
					} else nil
				}
			}
		}
	end,
	forKind = function(Kind, p2)
		-- upvalues: config (copy), MonetizationClientToolModule (copy), TOOLNAME (copy), describeKindError (copy), findCrossKindError (copy), config3 (copy), resolveKind (copy)
		local function _(p3): boolean
			-- upvalues: p2 (copy)
			return p3 == "developerProduct" or (p2 == nil or p2[p3] == true)
		end
		
		local _ = function(p3): boolean
			-- upvalues: config (upval), Kind (copy), p2 (copy)
			local Entry = if typeof(p3) == "table" and typeof(p3.kind) == "string" then config[string.lower(p3.kind)] else nil
			
			return if Entry == nil then Kind == "developerProduct" else Entry == Kind or Kind == "developerProduct" and not (Entry == "developerProduct" or (p2 == nil or p2[Entry] == true))
		end
		
		local function findRequestInTurnState(p3, Tbl)
			-- upvalues: MonetizationClientToolModule (upval), Kind (copy), TOOLNAME (upval), config (upval), p2 (copy)
			local T = if Tbl == nil then {} else table.clone(Tbl)
			local ManageMonetization = nil
			local ManageMonetization2 = nil
			local ManageMonetization3 = nil
			local ManageMonetization4 = nil
			while true do
				ManageMonetization, ManageMonetization2, ManageMonetization3, ManageMonetization4 = MonetizationClientToolModule.findRequestInTurnState(p3, "manage_monetization", T)
				if ManageMonetization == nil then
					if Kind ~= "developerProduct" then
						return nil, nil, nil, nil
					end
					local RequestInTurnState, RequestInTurnState2, RequestInTurnState3, RequestInTurnState4 = MonetizationClientToolModule.findRequestInTurnState(p3, TOOLNAME, T)
					
					if RequestInTurnState == nil then
						return nil, nil, nil, nil
					end
					local RequestInTurnState1 = nil
					if typeof(RequestInTurnState2) == "table" then
						local Copy = table.clone(RequestInTurnState2)
						Copy.kind = "developerProduct"
						RequestInTurnState1 = Copy
					else
						RequestInTurnState1 = RequestInTurnState2
					end
					return RequestInTurnState, RequestInTurnState1, RequestInTurnState3, RequestInTurnState4
				else
					local Entry = if typeof(ManageMonetization2) == "table" and typeof(ManageMonetization2.kind) == "string" then config[string.lower(ManageMonetization2.kind)] else nil
					
					if if Entry == nil then Kind == "developerProduct" else Entry == Kind or Kind == "developerProduct" and not (Entry == "developerProduct" or (p2 == nil or p2[Entry] == true)) then
						return ManageMonetization, ManageMonetization2, ManageMonetization3, ManageMonetization4
					end
					T[ManageMonetization] = true
				end
			end
		end
		
		local function parseInput(Tbl)
			-- upvalues: config (upval), describeKindError (upval), Kind (copy), findCrossKindError (upval), config3 (upval)
			local Entry = if typeof(Tbl) == "table" and typeof(Tbl.kind) == "string" then config[string.lower(Tbl.kind)] else nil
			
			if Entry == nil then
				return nil, describeKindError(Tbl)
			elseif Entry ~= Kind then
				return nil, ("kind=%s is not available in this session."):format(Entry), "kind_unavailable"
			else
				local CrossKindError = findCrossKindError(Tbl, Kind)
				
				if CrossKindError == nil then
					local Copy = table.clone(Tbl)
					Copy.kind = nil
					
					return config3[Kind](Copy)
				else
					return nil, CrossKindError
				end
			end
		end
		
		return {
			TOOL_NAME = "manage_monetization",
			KIND = Kind,
			findRequestInTurnState = findRequestInTurnState,
			parseInput = parseInput,
			getActionKind = MonetizationClientToolModule.getActionKind,
			formatResultContent = function(Tbl)
				-- upvalues: Kind (copy), MonetizationClientToolModule (upval)
				if typeof(Tbl) == "table" and Tbl.kind == nil then
					Tbl = table.clone(Tbl)
					Tbl.kind = Kind
				end
				return MonetizationClientToolModule.formatResultContent(Tbl)
			end,
			formatRejectionContent = function(p4, p5)
				-- upvalues: MonetizationClientToolModule (upval), Kind (copy)
				return MonetizationClientToolModule.formatRejectionContent(p4, p5, Kind)
			end,
			findManageDevProductRequestInTurnState = findRequestInTurnState,
			parseManageDevProductInput = parseInput,
			resolveRequestKind = resolveKind
		}
	end
}