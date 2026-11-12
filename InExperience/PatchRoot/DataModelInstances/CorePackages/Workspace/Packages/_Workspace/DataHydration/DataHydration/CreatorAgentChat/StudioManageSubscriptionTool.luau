local _ = require(script.Parent.types)
local MonetizationClientToolModule = require(script.Parent.monetizationClientTool)
local FFlagCreatorAgentChatMonetizationOneConsentModule = require(script.Parent.FFlagCreatorAgentChatMonetizationOneConsent)
local list = {
	"create", "list", "update", "activate", "deactivate", "delete"
}
local MAXIMUMSAFEINTEGER = MonetizationClientToolModule.MAXIMUM_SAFE_INTEGER
local List = { "consumable", "currency", "durable" }

local function _(p1): boolean
	return p1.name ~= nil and (p1.name ~= "" and (p1.productType ~= nil and p1.priceInRobux ~= nil))
end

return {
	TOOL_NAME = "manage_subscription",
	LOCAL_TOOL_DEFINITION = {
		name = "manage_subscription",
		inputSchema = {
			type = "object",
			additionalProperties = false,
			required = { "action" },
			properties = {
				action = { type = "string", enum = list },
				name = { type = "string" },
				description = { type = "string" },
				productType = { type = "string", enum = List },
				priceInRobux = {
					type = "integer",
					minimum = 49,
					maximum = MAXIMUMSAFEINTEGER
				},
				subscriptionId = { type = "string" },
				cancelRenewals = { type = "boolean" },
				imageAssetId = {
					type = "integer",
					minimum = 1,
					maximum = MAXIMUMSAFEINTEGER
				},
				createAndGoLive = if FFlagCreatorAgentChatMonetizationOneConsentModule then {
					type = "boolean",
					description = "Only for create when the creator explicitly requests creation and activation in one approval. Creation stays inactive until a supported benefit is published and verified; custom or uncertain wiring stays inactive without another approval."
				} else nil
			}
		}
	},
	findRequestInTurnState = MonetizationClientToolModule.createRequestFinder("manage_subscription"),
	parseInput = function(p1)
		-- upvalues: MonetizationClientToolModule (copy), list (copy), MAXIMUMSAFEINTEGER (copy), List (copy), FFlagCreatorAgentChatMonetizationOneConsentModule (copy)
		local ParseActionResult, ParseActionResult2 = MonetizationClientToolModule.parseAction(p1, list)
		
		if ParseActionResult == nil then
			return nil, ParseActionResult2
		end
		local CheckStringFieldsResult = MonetizationClientToolModule.checkStringFields(p1, { "name", "description", "productType", "subscriptionId" })
		
		if CheckStringFieldsResult ~= nil then
			return nil, CheckStringFieldsResult
		end
		if p1.cancelRenewals ~= nil and typeof(p1.cancelRenewals) ~= "boolean" then
			return nil, "cancelRenewals must be a boolean."
		end
		local ParsePriceResult, ParsePriceResult2 = MonetizationClientToolModule.parsePrice(p1.priceInRobux, 49, MAXIMUMSAFEINTEGER)
		
		if ParsePriceResult2 ~= nil then
			return nil, ParsePriceResult2
		end
		local Lowered = if p1.productType == nil then nil else string.lower(p1.productType)
		
		if Lowered ~= nil and not table.find(List, Lowered) then
			return nil, "productType must be consumable, currency or durable."
		end
		local config = {
			action = ParseActionResult,
			name = p1.name,
			description = p1.description,
			productType = Lowered,
			priceInRobux = ParsePriceResult,
			subscriptionId = if p1.subscriptionId == "" then nil else p1.subscriptionId,
			cancelRenewals = p1.cancelRenewals,
			imageAssetId = MonetizationClientToolModule.parsePositiveSafeInteger(p1.imageAssetId)
		}
		
		if p1.imageAssetId ~= nil and config.imageAssetId == nil then
			return nil, ("imageAssetId must be a positive integer no greater than %.0f."):format(MAXIMUMSAFEINTEGER)
		end
		if p1.createAndGoLive ~= nil and not FFlagCreatorAgentChatMonetizationOneConsentModule then
			return nil, "createAndGoLive is unavailable."
		end
		local ParseCreateAndGoLiveResult, ParseCreateAndGoLiveResult2 = MonetizationClientToolModule.parseCreateAndGoLive(p1.createAndGoLive, ParseActionResult)
		
		if ParseCreateAndGoLiveResult2 ~= nil then
			return nil, ParseCreateAndGoLiveResult2
		end
		config.createAndGoLive = ParseCreateAndGoLiveResult
		
		if (ParseActionResult == "create" or ParseActionResult == "list") and p1.subscriptionId ~= nil then
			return nil, "subscriptionId is only used to update, activate, deactivate or delete a subscription."
		elseif ParseActionResult ~= "create" and ParseActionResult ~= "update" and (p1.description ~= nil or p1.priceInRobux ~= nil or p1.imageAssetId ~= nil) then
			return nil, "Only create and update can set a subscription description, priceInRobux or imageAssetId."
		elseif ParseActionResult ~= "create" and ParseActionResult ~= "update" and (p1.name ~= nil or p1.productType ~= nil) then
			return nil, "A subscription name and productType are only used on create."
		elseif ParseActionResult ~= "deactivate" and p1.cancelRenewals ~= nil then
			return nil, "cancelRenewals is only used on deactivate."
		elseif ParseActionResult == "create" then
			if config.name == nil or (config.name == "" or (config.productType == nil or config.priceInRobux == nil)) then
				return nil, "A name, productType and priceInRobux are required to create a subscription."
			end
		elseif ParseActionResult ~= "list" and config.subscriptionId == nil then
			return nil, "A subscriptionId is required for this action."
		elseif ParseActionResult == "update" then
			if config.name ~= nil then
				return nil, "A subscription's name can't be changed after it is created."
			elseif config.productType ~= nil then
				return nil, "A subscription's product type can't be changed after it is created."
			elseif config.description == nil and config.priceInRobux == nil and config.imageAssetId == nil then
				return nil, "An update needs a description, priceInRobux or imageAssetId."
			end
		elseif ParseActionResult == "deactivate" and config.cancelRenewals == nil then
			return nil, "cancelRenewals is required: ask the creator whether current subscribers keep renewing."
		end
		return config, nil
	end,
	getActionKind = MonetizationClientToolModule.getActionKind,
	formatResultContent = MonetizationClientToolModule.formatResultContent,
	formatRejectionContent = MonetizationClientToolModule.formatRejectionContent
}