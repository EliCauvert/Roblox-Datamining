local userInputService = game:GetService("UserInputService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local roact = require(purchasePrompt.Parent.PurchasePromptDeps).Roact
local upsellFlowModule = require(purchasePrompt.Enums.UpsellFlow)
local getUpsellFlowModule = require(purchasePrompt.NativeUpsell.getUpsellFlow)
local marketplaceServiceEventConnectorModule = require(script.Parent.MarketplaceServiceEventConnector)
local inputTypeManagerModule = require(script.Parent.InputTypeManager)
local browserPurchaseFinishedConnectorModule = require(script.Parent.BrowserPurchaseFinishedConnector)
local nativePurchaseFinishedConnectorModule = require(script.Parent.NativePurchaseFinishedConnector)

return function()
	-- upvalues: getUpsellFlowModule (ref), userInputService (ref), upsellFlowModule (ref), roact (ref), browserPurchaseFinishedConnectorModule (ref), nativePurchaseFinishedConnectorModule (ref), marketplaceServiceEventConnectorModule (ref), inputTypeManagerModule (ref)
	local var8 = nil
	local var9 = getUpsellFlowModule(userInputService:GetPlatform())
	
	if var9 == upsellFlowModule.Web then
		var8 = roact.createElement(browserPurchaseFinishedConnectorModule)
	elseif var9 == upsellFlowModule.Mobile then
		var8 = roact.createElement(nativePurchaseFinishedConnectorModule)
	end
	return roact.createElement("Folder", {}, {
		MarketPlaceServiceEventConnector = roact.createElement(marketplaceServiceEventConnectorModule),
		InputTypeManager = userInputService:GetPlatform() ~= Enum.Platform.XBoxOne and roact.createElement(inputTypeManagerModule) or nil,
		UpsellFinishedConnector = var8
	})
end