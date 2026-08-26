local parent = script.Parent.Parent
local playersService = game:GetService("Players")
local errorOccurredModule = require(parent.Actions.ErrorOccurred)
local purchaseCompleteRecievedModule = require(parent.Actions.PurchaseCompleteRecieved)
local setPromptStateModule = require(parent.Actions.SetPromptState)
local setWindowStateModule = require(parent.Actions.SetWindowState)
local upsellFlowModule = require(parent.Enums.UpsellFlow)
local promptStateModule = require(parent.Enums.PromptState)
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local windowStateModule = require(parent.Enums.WindowState)
local getUpsellFlowModule = require(parent.NativeUpsell.getUpsellFlow)
local analyticsModule = require(parent.Services.Analytics)
local platformInterfaceModule = require(parent.Services.PlatformInterface)
local externalSettingsModule = require(parent.Services.ExternalSettings)
local hideWindowModule = require(parent.Thunks.hideWindow)
local thunkModule = require(parent.Thunk)
local list = {
	analyticsModule,
	platformInterfaceModule,
	externalSettingsModule
}

return function()
	-- upvalues: thunkModule (ref), list (ref), platformInterfaceModule (ref), externalSettingsModule (ref), analyticsModule (ref), purchaseCompleteRecievedModule (ref), setWindowStateModule (ref), windowStateModule (ref), getUpsellFlowModule (ref), upsellFlowModule (ref), setPromptStateModule (ref), promptStateModule (ref), hideWindowModule (ref), playersService (ref), errorOccurredModule (ref), purchaseErrorModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: platformInterfaceModule (copy), externalSettingsModule (copy), analyticsModule (copy), purchaseCompleteRecievedModule (copy), setWindowStateModule (copy), windowStateModule (copy), getUpsellFlowModule (copy), upsellFlowModule (copy), setPromptStateModule (copy), promptStateModule (copy), hideWindowModule (copy), playersService (copy), errorOccurredModule (copy), purchaseErrorModule (copy)
		local var1 = p2[platformInterfaceModule]
		local var2 = p2[externalSettingsModule]
		local var3 = p2[analyticsModule]
		local premiumProductInfo = p1:getState().premiumProductInfo
		
		if var2.isStudio() then
			var1.signalMockPurchasePremium()
			p1:dispatch(purchaseCompleteRecievedModule())
			
			return p1:dispatch(setWindowStateModule(windowStateModule.Hidden))
		end
		local var4 = getUpsellFlowModule(var2.getPlatform())
		var3.signalPremiumUpsellConfirmed()
		
		if var4 == upsellFlowModule.Web then
			var1.startPremiumUpsell(premiumProductInfo.productId)
			p1:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
			p1:dispatch(hideWindowModule())
			
			return
		elseif var4 ~= upsellFlowModule.Mobile then
			p1:dispatch(errorOccurredModule(purchaseErrorModule.PremiumUnavailablePlatform))
			
			return
		end
		local mobileProductId = premiumProductInfo.mobileProductId
		local localPlayer = playersService.LocalPlayer
		
		if game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
			var1.promptNativePurchaseWithLocalPlayer(mobileProductId)
		else
			var1.promptNativePurchase(localPlayer, mobileProductId)
		end
		p1:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
		p1:dispatch(hideWindowModule())
	end)
end