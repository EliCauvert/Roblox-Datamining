local Parent = script.Parent.Parent
local Players = game:GetService("Players")
local SetPromptStateModule = require(Parent.Actions.SetPromptState)
local ErrorOccurredModule = require(Parent.Actions.ErrorOccurred)
local PremiumInfoRecievedModule = require(Parent.Actions.PremiumInfoRecieved)
local AccountInfoReceivedModule = require(Parent.Actions.AccountInfoReceived)
local BalanceInfoRecievedModule = require(Parent.Actions.BalanceInfoRecieved)
local PromptStateModule = require(Parent.Enums.PromptState)
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local AnalyticsModule = require(Parent.Services.Analytics)
local ExternalSettingsModule = require(Parent.Services.ExternalSettings)
local NetworkModule = require(Parent.Services.Network)
local PostPremiumImpressionModule = require(Parent.Network.postPremiumImpression)
local CompleteRequestModule = require(Parent.Thunks.completeRequest)
local ThunkModule = require(Parent.Thunk)
local list = { NetworkModule, ExternalSettingsModule, AnalyticsModule }

return function(p1, p2, p3, Enabled) --[[ Line: 28 | Named "resolvePremiumPromptState" ]]
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), ExternalSettingsModule (copy), AnalyticsModule (copy), PremiumInfoRecievedModule (copy), AccountInfoReceivedModule (copy), BalanceInfoRecievedModule (copy), CompleteRequestModule (copy), Players (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), PostPremiumImpressionModule (copy), SetPromptStateModule (copy), PromptStateModule (copy)
	return ThunkModule.new(script.Name, list, function(p4, p5) --[[ Line: 29 ]]
		-- upvalues: NetworkModule (upval), ExternalSettingsModule (upval), AnalyticsModule (upval), PremiumInfoRecievedModule (upval), p3 (copy), AccountInfoReceivedModule (upval), p1 (copy), BalanceInfoRecievedModule (upval), p2 (copy), Enabled (copy), CompleteRequestModule (upval), Players (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), PostPremiumImpressionModule (upval), SetPromptStateModule (upval), PromptStateModule (upval)
		local v1 = p5[NetworkModule]
		local v2 = p5[ExternalSettingsModule]
		local v3 = p5[AnalyticsModule]
		local Platform = v2.getPlatform()
		p4:dispatch(PremiumInfoRecievedModule(p3))
		p4:dispatch(AccountInfoReceivedModule(p1))
		p4:dispatch(BalanceInfoRecievedModule(p2))
		
		if Enabled == false then
			v3.signalPremiumUpsellPrecheckFail()
			
			return p4:dispatch(CompleteRequestModule())
		end
		if v2.isStudio() then
			if Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
				return p4:dispatch(ErrorOccurredModule(PurchaseErrorModule.AlreadyPremium))
			end
		elseif p1.isPremium then
			v3.signalPremiumUpsellShownPremium()
			
			return p4:dispatch(ErrorOccurredModule(PurchaseErrorModule.AlreadyPremium))
		end
		if Platform == Enum.Platform.XBoxOne then
			v3.signalPremiumUpsellInvalidPlatform()
			
			return p4:dispatch(ErrorOccurredModule(PurchaseErrorModule.PremiumUnavailablePlatform))
		end
		if p3 == nil then
			v3.signalPremiumUpsellInvalidProducts()
			
			return p4:dispatch(ErrorOccurredModule(PurchaseErrorModule.PremiumUnavailable))
		end
		if not v2.isStudio() then
			v3.signalPremiumUpsellShownNonPremium()
			PostPremiumImpressionModule(v1)
		end
		return p4:dispatch(SetPromptStateModule(PromptStateModule.PremiumUpsell))
	end)
end