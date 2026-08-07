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

return function() --[[ line: 25 | named "launchPremiumUpsell" ]]
	-- upvalues: thunkModule (ref), list (ref), platformInterfaceModule (ref), externalSettingsModule (ref), analyticsModule (ref), purchaseCompleteRecievedModule (ref), setWindowStateModule (ref), windowStateModule (ref), getUpsellFlowModule (ref), upsellFlowModule (ref), setPromptStateModule (ref), promptStateModule (ref), hideWindowModule (ref), playersService (ref), errorOccurredModule (ref), purchaseErrorModule (ref)
	return thunkModule.new(script.Name, list, function(p0, p1) --[[ line: 26 ]]
		-- upvalues: platformInterfaceModule (copy), externalSettingsModule (copy), analyticsModule (copy), purchaseCompleteRecievedModule (copy), setWindowStateModule (copy), windowStateModule (copy), getUpsellFlowModule (copy), upsellFlowModule (copy), setPromptStateModule (copy), promptStateModule (copy), hideWindowModule (copy), playersService (copy), errorOccurredModule (copy), purchaseErrorModule (copy)
		local var16 = p1[platformInterfaceModule]
		local var17 = p1[externalSettingsModule]
		local var18 = p1[analyticsModule]
		local premiumProductInfo = p0:getState().premiumProductInfo
		
		if var17.isStudio() then
			var16.signalMockPurchasePremium()
			p0:dispatch(purchaseCompleteRecievedModule())
			
			return p0:dispatch(setWindowStateModule(windowStateModule.Hidden))
		end
		local var19 = getUpsellFlowModule(var17.getPlatform())
		var18.signalPremiumUpsellConfirmed()
		
		if var19 == upsellFlowModule.Web then
			var16.startPremiumUpsell(premiumProductInfo.productId)
			p0:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
			p0:dispatch(hideWindowModule())
			
			return
		elseif var19 ~= upsellFlowModule.Mobile then
			p0:dispatch(errorOccurredModule(purchaseErrorModule.PremiumUnavailablePlatform))
			
			return
		end
		local mobileProductId = premiumProductInfo.mobileProductId
		local localPlayer = playersService.LocalPlayer
		
		if game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
			var16.promptNativePurchaseWithLocalPlayer(mobileProductId)
		else
			var16.promptNativePurchase(localPlayer, mobileProductId)
		end
		p0:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
		p0:dispatch(hideWindowModule())
	end)
end