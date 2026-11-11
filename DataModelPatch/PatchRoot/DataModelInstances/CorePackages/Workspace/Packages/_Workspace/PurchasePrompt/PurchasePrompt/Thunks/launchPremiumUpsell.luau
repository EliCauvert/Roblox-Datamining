local Parent = script.Parent.Parent
local Players = game:GetService("Players")
local ErrorOccurredModule = require(Parent.Actions.ErrorOccurred)
local PurchaseCompleteRecievedModule = require(Parent.Actions.PurchaseCompleteRecieved)
local SetPromptStateModule = require(Parent.Actions.SetPromptState)
local SetWindowStateModule = require(Parent.Actions.SetWindowState)
local UpsellFlowModule = require(Parent.Enums.UpsellFlow)
local PromptStateModule = require(Parent.Enums.PromptState)
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local WindowStateModule = require(Parent.Enums.WindowState)
local GetUpsellFlowModule = require(Parent.NativeUpsell.getUpsellFlow)
local AnalyticsModule = require(Parent.Services.Analytics)
local PlatformInterfaceModule = require(Parent.Services.PlatformInterface)
local ExternalSettingsModule = require(Parent.Services.ExternalSettings)
local HideWindowModule = require(Parent.Thunks.hideWindow)
local ThunkModule = require(Parent.Thunk)
local list = {
	AnalyticsModule,
	PlatformInterfaceModule,
	ExternalSettingsModule
}

return function()
	-- upvalues: ThunkModule (copy), list (copy), PlatformInterfaceModule (copy), ExternalSettingsModule (copy), AnalyticsModule (copy), PurchaseCompleteRecievedModule (copy), SetWindowStateModule (copy), WindowStateModule (copy), GetUpsellFlowModule (copy), UpsellFlowModule (copy), SetPromptStateModule (copy), PromptStateModule (copy), HideWindowModule (copy), Players (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy)
	return ThunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: PlatformInterfaceModule (upval), ExternalSettingsModule (upval), AnalyticsModule (upval), PurchaseCompleteRecievedModule (upval), SetWindowStateModule (upval), WindowStateModule (upval), GetUpsellFlowModule (upval), UpsellFlowModule (upval), SetPromptStateModule (upval), PromptStateModule (upval), HideWindowModule (upval), Players (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval)
		local v1 = p2[PlatformInterfaceModule]
		local v2 = p2[ExternalSettingsModule]
		local v3 = p2[AnalyticsModule]
		local PremiumProductInfo = p1:getState().premiumProductInfo
		
		if v2.isStudio() then
			v1.signalMockPurchasePremium()
			p1:dispatch(PurchaseCompleteRecievedModule())
			
			return p1:dispatch(SetWindowStateModule(WindowStateModule.Hidden))
		end
		local UpsellFlowModule1 = GetUpsellFlowModule(v2.getPlatform())
		v3.signalPremiumUpsellConfirmed()
		
		if UpsellFlowModule1 == UpsellFlowModule.Web then
			v1.startPremiumUpsell(PremiumProductInfo.productId)
			p1:dispatch(SetPromptStateModule(PromptStateModule.UpsellInProgress))
			p1:dispatch(HideWindowModule())
			
			return
		end
		if UpsellFlowModule1 ~= UpsellFlowModule.Mobile then
			p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.PremiumUnavailablePlatform))
			
			return
		end
		local MobileProductId = PremiumProductInfo.mobileProductId
		local LocalPlayer = Players.LocalPlayer
		
		if game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
			v1.promptNativePurchaseWithLocalPlayer(MobileProductId)
		else
			v1.promptNativePurchase(LocalPlayer, MobileProductId)
		end
		p1:dispatch(SetPromptStateModule(PromptStateModule.UpsellInProgress))
		p1:dispatch(HideWindowModule())
	end)
end