local _ = require(script.Parent.types)
local MonetizationClientToolModule = require(script.Parent.monetizationClientTool)
local FFlagCreatorAgentChatMonetizationOneConsentModule = require(script.Parent.FFlagCreatorAgentChatMonetizationOneConsent)
local list = {
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
				action = { type = "string", enum = list },
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
	findRequestInTurnState = MonetizationClientToolModule.createRequestFinder("manage_game_pass"),
	parseInput = function(p1)
		-- upvalues: MonetizationClientToolModule (copy), list (copy), MAXIMUMSAFEINTEGER (copy), FFlagCreatorAgentChatMonetizationOneConsentModule (copy)
		local ParseActionResult, ParseActionResult2 = MonetizationClientToolModule.parseAction(p1, list)
		
		if ParseActionResult == nil then
			return nil, ParseActionResult2
		end
		local CheckStringFieldsResult = MonetizationClientToolModule.checkStringFields(p1, { "name", "description" })
		
		if CheckStringFieldsResult ~= nil then
			return nil, CheckStringFieldsResult
		end
		local ParsePriceResult, ParsePriceResult2 = MonetizationClientToolModule.parsePrice(p1.priceInRobux, 1, 999999999)
		
		if ParsePriceResult2 ~= nil then
			return nil, ParsePriceResult2
		end
		local config = {
			action = ParseActionResult,
			name = p1.name,
			description = p1.description,
			priceInRobux = ParsePriceResult,
			gamePassId = MonetizationClientToolModule.parsePositiveSafeInteger(p1.gamePassId)
		}
		
		if p1.gamePassId ~= nil and config.gamePassId == nil then
			return nil, ("gamePassId must be a positive integer no greater than %.0f."):format(MAXIMUMSAFEINTEGER)
		end
		if p1.createAndGoLive ~= nil and not FFlagCreatorAgentChatMonetizationOneConsentModule then
			return nil, "createAndGoLive is unavailable."
		end
		local ParseCreateAndGoLiveResult, ParseCreateAndGoLiveResult2 = MonetizationClientToolModule.parseCreateAndGoLive(p1.createAndGoLive, ParseActionResult)
		
		if ParseCreateAndGoLiveResult2 ~= nil then
			return nil, ParseCreateAndGoLiveResult2
		end
		config.createAndGoLive = ParseCreateAndGoLiveResult
		
		if (ParseActionResult == "create" or ParseActionResult == "list") and p1.gamePassId ~= nil then
			return nil, "gamePassId is only used to update, activate or deactivate a game pass."
		elseif ParseActionResult ~= "create" and ParseActionResult ~= "update" and (p1.name ~= nil or p1.description ~= nil or p1.priceInRobux ~= nil) then
			return nil, "Only create and update can set a game pass name, description or priceInRobux."
		elseif ParseActionResult == "create" then
			if config.name == nil or config.name == "" or config.priceInRobux == nil then
				return nil, "A name and priceInRobux are required to create a game pass."
			end
		elseif ParseActionResult ~= "list" and config.gamePassId == nil then
			return nil, "A gamePassId is required for this action."
		elseif ParseActionResult == "update" and config.name == nil and config.description == nil and config.priceInRobux == nil then
			return nil, "An update needs a name, description or priceInRobux."
		elseif ParseActionResult == "update" and config.name == "" then
			return nil, "A game pass name cannot be empty."
		end
		return config, nil
	end,
	getActionKind = MonetizationClientToolModule.getActionKind,
	formatResultContent = MonetizationClientToolModule.formatResultContent,
	formatRejectionContent = MonetizationClientToolModule.formatRejectionContent
}