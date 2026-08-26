local parent = script.Parent.Parent
local playersService = game:GetService("Players")
local setPromptStateModule = require(parent.Actions.SetPromptState)
local errorOccurredModule = require(parent.Actions.ErrorOccurred)
local premiumInfoRecievedModule = require(parent.Actions.PremiumInfoRecieved)
local accountInfoReceivedModule = require(parent.Actions.AccountInfoReceived)
local balanceInfoRecievedModule = require(parent.Actions.BalanceInfoRecieved)
local promptStateModule = require(parent.Enums.PromptState)
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local analyticsModule = require(parent.Services.Analytics)
local externalSettingsModule = require(parent.Services.ExternalSettings)
local networkModule = require(parent.Services.Network)
local postPremiumImpressionModule = require(parent.Network.postPremiumImpression)
local completeRequestModule = require(parent.Thunks.completeRequest)
local thunkModule = require(parent.Thunk)
local list = { networkModule, externalSettingsModule, analyticsModule }

return function(p1, p2, p3, p4)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), externalSettingsModule (ref), analyticsModule (ref), premiumInfoRecievedModule (ref), accountInfoReceivedModule (ref), balanceInfoRecievedModule (ref), completeRequestModule (ref), playersService (ref), errorOccurredModule (ref), purchaseErrorModule (ref), postPremiumImpressionModule (ref), setPromptStateModule (ref), promptStateModule (ref)
	return thunkModule.new(script.Name, list, function(p5, p6)
		-- upvalues: networkModule (copy), externalSettingsModule (copy), analyticsModule (copy), premiumInfoRecievedModule (copy), p3 (ref), accountInfoReceivedModule (copy), p1 (ref), balanceInfoRecievedModule (copy), p2 (ref), p4 (ref), completeRequestModule (copy), playersService (copy), errorOccurredModule (copy), purchaseErrorModule (copy), postPremiumImpressionModule (copy), setPromptStateModule (copy), promptStateModule (copy)
		local var1 = p6[networkModule]
		local var2 = p6[externalSettingsModule]
		local var3 = p6[analyticsModule]
		local platform = var2.getPlatform()
		p5:dispatch(premiumInfoRecievedModule(p3))
		p5:dispatch(accountInfoReceivedModule(p1))
		p5:dispatch(balanceInfoRecievedModule(p2))
		
		if p4 == false then
			var3.signalPremiumUpsellPrecheckFail()
			
			return p5:dispatch(completeRequestModule())
		elseif var2.isStudio() then
			if playersService.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
				return p5:dispatch(errorOccurredModule(purchaseErrorModule.AlreadyPremium))
			elseif platform == Enum.Platform.XBoxOne then
				var3.signalPremiumUpsellInvalidPlatform()
				
				return p5:dispatch(errorOccurredModule(purchaseErrorModule.PremiumUnavailablePlatform))
			elseif p3 == nil then
				var3.signalPremiumUpsellInvalidProducts()
				
				return p5:dispatch(errorOccurredModule(purchaseErrorModule.PremiumUnavailable))
			elseif not var2.isStudio() then
				var3.signalPremiumUpsellShownNonPremium()
				postPremiumImpressionModule(var1)
			end
			return p5:dispatch(setPromptStateModule(promptStateModule.PremiumUpsell))
		elseif p1.isPremium then
			var3.signalPremiumUpsellShownPremium()
			
			return p5:dispatch(errorOccurredModule(purchaseErrorModule.AlreadyPremium))
		end
	end)
end