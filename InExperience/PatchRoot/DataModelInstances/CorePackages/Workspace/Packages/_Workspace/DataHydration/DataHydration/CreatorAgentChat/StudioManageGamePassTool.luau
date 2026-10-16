local _ = require(script.Parent.types)
local MonetizationClientToolModule = require(script.Parent.monetizationClientTool)
local FFlagCreatorAgentChatMonetizationOneConsentModule = require(script.Parent.FFlagCreatorAgentChatMonetizationOneConsent)
local List = {
	"create",
	"list",
	"update",
	"activate",
	"deactivate"
}
local MAXIMUMSAFEINTEGER = MonetizationClientToolModule.MAXIMUM_SAFE_INTEGER

return {
	TOOL_NAME = "manage_game_pass",
	LOCAL_TOOL_DEFINITION = {
		name = "manage_game_pass",
		inputSchema = {
			type = "object",
			additionalProperties = false,
			required = { "action" },
			properties = {
				action = { type = "string", enum = List },
				name = { type = "string" },
				description = { type = "string" },
				priceInRobux = { type = "integer", minimum = 1, maximum = 999999999 },
				gamePassId = {
					type = "integer",
					minimum = 1,
					maximum = MAXIMUMSAFEINTEGER
				},
				createAndGoLive = if FFlagCreatorAgentChatMonetizationOneConsentModule then {
					type = "boolean",
					description = "Only for create when the creator explicitly requests creation and sale in one approval. Creation stays off sale until a supported benefit is published and verified; custom or uncertain wiring stays off sale without another approval."
				} else nil
			}
		}
	},
	findRequestInTurnState = function(p1, p2) --[[ Line: 118 ]]
		-- upvalues: MonetizationClientToolModule (copy)
		return MonetizationClientToolModule.findRequestInTurnState(p1, "manage_game_pass", p2)
	end,
	parseInput = function(p1) --[[ Line: 52 ]]
		-- upvalues: List (copy), MonetizationClientToolModule (copy), FFlagCreatorAgentChatMonetizationOneConsentModule (copy), MAXIMUMSAFEINTEGER (copy)
		if typeof(p1) ~= "table" or typeof(p1.action) ~= "string" then
			return nil, "An action is required."
		end
		local Lowered = string.lower(p1.action)
		
		if not table.find(List, Lowered) then
			return nil, ("Unsupported action '%s'."):format(p1.action)
		end
		if p1.name ~= nil and typeof(p1.name) ~= "string" or p1.description ~= nil and typeof(p1.description) ~= "string" then
			return nil, "name and description must be strings."
		end
		local ParsePriceResult, ParsePriceResult2 = MonetizationClientToolModule.parsePrice(p1.priceInRobux, 1, 999999999)
		
		if ParsePriceResult2 ~= nil then
			return nil, ParsePriceResult2
		end
		local config = {
			action = Lowered,
			name = p1.name,
			description = p1.description,
			priceInRobux = ParsePriceResult,
			gamePassId = MonetizationClientToolModule.parsePositiveSafeInteger(p1.gamePassId),
			createAndGoLive = FFlagCreatorAgentChatMonetizationOneConsentModule and p1.createAndGoLive == true or nil
		}
		
		if p1.gamePassId ~= nil and config.gamePassId == nil then
			return nil, ("gamePassId must be a positive integer no greater than %.0f."):format(MAXIMUMSAFEINTEGER)
		elseif p1.createAndGoLive ~= nil then
			if not FFlagCreatorAgentChatMonetizationOneConsentModule then
				return nil, "createAndGoLive is unavailable."
			elseif Lowered ~= "create" or typeof(p1.createAndGoLive) ~= "boolean" then
				return nil, "createAndGoLive must be a boolean on create."
			end
		end
		if (Lowered == "create" or Lowered == "list") and p1.gamePassId ~= nil then
			return nil, "gamePassId is only used to update, activate or deactivate a game pass."
		elseif Lowered ~= "create" and Lowered ~= "update" and (p1.name ~= nil or p1.description ~= nil or p1.priceInRobux ~= nil) then
			return nil, "Only create and update can set a game pass name, description or priceInRobux."
		elseif Lowered == "create" then
			if config.name == nil or config.name == "" or config.priceInRobux == nil then
				return nil, "A name and priceInRobux are required to create a game pass."
			end
		elseif Lowered ~= "list" and config.gamePassId == nil then
			return nil, "A gamePassId is required for this action."
		elseif Lowered == "update" and config.name == nil and config.description == nil and config.priceInRobux == nil then
			return nil, "An update needs a name, description or priceInRobux."
		elseif Lowered == "update" and config.name == "" then
			return nil, "A game pass name cannot be empty."
		end
		return config, nil
	end,
	getActionKind = MonetizationClientToolModule.getActionKind,
	formatResultContent = MonetizationClientToolModule.formatResultContent,
	formatRejectionContent = MonetizationClientToolModule.formatRejectionContent
}