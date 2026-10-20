local Parent = script.Parent.Parent
local RequestAvatarCreationFeePurchaseModule = require(Parent.Actions.RequestAvatarCreationFeePurchase)
local PromiseModule = require(Parent.Promise)
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local ExternalSettingsModule = require(Parent.Services.ExternalSettings)
local GetBalanceInfoModule = require(Parent.Network.getBalanceInfo)
local GetAccountInfoModule = require(Parent.Network.getAccountInfo)
local ErrorOccurredModule = require(Parent.Actions.ErrorOccurred)
local FFlagEnableUnifiedProductPurchaseFlow = require(Parent.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local GetUnifiedPurchaseFlowEligibilityModule = require(Parent.Network.getUnifiedPurchaseFlowEligibility)
local ResolvePromptStateModule = require(script.Parent.resolvePromptState)
local list = { NetworkModule, ExternalSettingsModule }

return function(p1, p2, p3, PriceInRobux)
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), ExternalSettingsModule (copy), RequestAvatarCreationFeePurchaseModule (copy), PromiseModule (copy), GetAccountInfoModule (copy), GetBalanceInfoModule (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), GetUnifiedPurchaseFlowEligibilityModule (copy), ResolvePromptStateModule (copy), ErrorOccurredModule (copy)
	return ThunkModule.new(script.Name, list, function(p4, p5)
		-- upvalues: NetworkModule (upval), ExternalSettingsModule (upval), RequestAvatarCreationFeePurchaseModule (upval), p3 (copy), p2 (copy), PromiseModule (upval), GetAccountInfoModule (upval), GetBalanceInfoModule (upval), FFlagEnableUnifiedProductPurchaseFlow (upval), GetUnifiedPurchaseFlowEligibilityModule (upval), PriceInRobux (copy), p1 (copy), ResolvePromptStateModule (upval), ErrorOccurredModule (upval)
		local v1 = p5[NetworkModule]
		local v2 = p5[ExternalSettingsModule]
		p4:dispatch(RequestAvatarCreationFeePurchaseModule(p3, p2))
		
		return PromiseModule.all({
			accountInfo = GetAccountInfoModule(v1, v2),
			balanceInfo = GetBalanceInfoModule(v1, v2, true),
			isUserEligibleForUnifiedPurchaseFlow = if FFlagEnableUnifiedProductPurchaseFlow then GetUnifiedPurchaseFlowEligibilityModule(v1) else nil
		}):andThen(function(Result)
			-- upvalues: PriceInRobux (upval), p1 (upval), p4 (copy), ResolvePromptStateModule (upval)
			p4:dispatch(ResolvePromptStateModule({
				PriceInRobux = PriceInRobux,
				Name = p1.name,
				Description = p1.description
			}, Result.accountInfo, Result.balanceInfo, false, true, PriceInRobux, Result.isUserEligibleForUnifiedPurchaseFlow))
		end):catch(function(Err)
			-- upvalues: p4 (copy), ErrorOccurredModule (upval)
			p4:dispatch(ErrorOccurredModule(Err))
		end)
	end)
end