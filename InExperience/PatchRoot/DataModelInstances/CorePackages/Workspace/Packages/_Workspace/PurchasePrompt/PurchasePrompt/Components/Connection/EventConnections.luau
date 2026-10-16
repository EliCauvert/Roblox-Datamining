local UserInputService = game:GetService("UserInputService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Roact = require(PurchasePrompt.Parent.PurchasePromptDeps).Roact
local UpsellFlowModule = require(PurchasePrompt.Enums.UpsellFlow)
local GetUpsellFlowModule = require(PurchasePrompt.NativeUpsell.getUpsellFlow)
local MarketplaceServiceEventConnectorModule = require(script.Parent.MarketplaceServiceEventConnector)
local InputTypeManagerModule = require(script.Parent.InputTypeManager)
local BrowserPurchaseFinishedConnectorModule = require(script.Parent.BrowserPurchaseFinishedConnector)
local NativePurchaseFinishedConnectorModule = require(script.Parent.NativePurchaseFinishedConnector)

return function() --[[ Line: 20 | Named "EventConnections" ]]
	-- upvalues: GetUpsellFlowModule (copy), UserInputService (copy), UpsellFlowModule (copy), Roact (copy), BrowserPurchaseFinishedConnectorModule (copy), NativePurchaseFinishedConnectorModule (copy), MarketplaceServiceEventConnectorModule (copy), InputTypeManagerModule (copy)
	local Element = nil
	local UpsellFlowModule1 = GetUpsellFlowModule(UserInputService:GetPlatform())
	
	if UpsellFlowModule1 == UpsellFlowModule.Web then
		Element = Roact.createElement(BrowserPurchaseFinishedConnectorModule)
	elseif UpsellFlowModule1 == UpsellFlowModule.Mobile then
		Element = Roact.createElement(NativePurchaseFinishedConnectorModule)
	end
	return Roact.createElement("Folder", {}, {
		MarketPlaceServiceEventConnector = Roact.createElement(MarketplaceServiceEventConnectorModule),
		InputTypeManager = UserInputService:GetPlatform() ~= Enum.Platform.XBoxOne and Roact.createElement(InputTypeManagerModule) or nil,
		UpsellFinishedConnector = Element
	})
end