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

return function(p0, p1, p2, p3) --[[ line: 28 | named "resolvePremiumPromptState" ]]
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), externalSettingsModule (ref), analyticsModule (ref), premiumInfoRecievedModule (ref), accountInfoReceivedModule (ref), balanceInfoRecievedModule (ref), completeRequestModule (ref), playersService (ref), errorOccurredModule (ref), purchaseErrorModule (ref), postPremiumImpressionModule (ref), setPromptStateModule (ref), promptStateModule (ref)
	return thunkModule.new(script.Name, list, function(p4, p5) --[[ line: 29 ]]
		-- upvalues: networkModule (copy), externalSettingsModule (copy), analyticsModule (copy), premiumInfoRecievedModule (copy), p2 (ref), accountInfoReceivedModule (copy), p0 (ref), balanceInfoRecievedModule (copy), p1 (ref), p3 (ref), completeRequestModule (copy), playersService (copy), errorOccurredModule (copy), purchaseErrorModule (copy), postPremiumImpressionModule (copy), setPromptStateModule (copy), promptStateModule (copy)
		local var15 = p5[networkModule]
		local var16 = p5[externalSettingsModule]
		local var17 = p5[analyticsModule]
		local platform = var16.getPlatform()
		p4:dispatch(premiumInfoRecievedModule(p2))
		p4:dispatch(accountInfoReceivedModule(p0))
		p4:dispatch(balanceInfoRecievedModule(p1))
		
		if p3 == false then
			var17.signalPremiumUpsellPrecheckFail()
			
			return p4:dispatch(completeRequestModule())
		elseif var16.isStudio() then
			if playersService.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
				return p4:dispatch(errorOccurredModule(purchaseErrorModule.AlreadyPremium))
			elseif platform == Enum.Platform.XBoxOne then
				var17.signalPremiumUpsellInvalidPlatform()
				
				return p4:dispatch(errorOccurredModule(purchaseErrorModule.PremiumUnavailablePlatform))
			elseif p2 == nil then
				var17.signalPremiumUpsellInvalidProducts()
				
				return p4:dispatch(errorOccurredModule(purchaseErrorModule.PremiumUnavailable))
			elseif not var16.isStudio() then
				var17.signalPremiumUpsellShownNonPremium()
				postPremiumImpressionModule(var15)
			end
			return p4:dispatch(setPromptStateModule(promptStateModule.PremiumUpsell))
		elseif p0.isPremium then
			var17.signalPremiumUpsellShownPremium()
			
			return p4:dispatch(errorOccurredModule(purchaseErrorModule.AlreadyPremium))
		end
	end)
end