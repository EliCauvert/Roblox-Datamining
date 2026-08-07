local parent = script.Parent.Parent
local requestAvatarCreationFeePurchaseModule = require(parent.Actions.RequestAvatarCreationFeePurchase)
local promiseModule = require(parent.Promise)
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local externalSettingsModule = require(parent.Services.ExternalSettings)
local getBalanceInfoModule = require(parent.Network.getBalanceInfo)
local getAccountInfoModule = require(parent.Network.getAccountInfo)
local errorOccurredModule = require(parent.Actions.ErrorOccurred)
local fFlagEnableUnifiedProductPurchaseFlow = require(parent.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local getUnifiedPurchaseFlowEligibilityModule = require(parent.Network.getUnifiedPurchaseFlowEligibility)
local resolvePromptStateModule = require(script.Parent.resolvePromptState)
local list = { networkModule, externalSettingsModule }

return function(p0, p1, p2, p3) --[[ line: 25 | named "initiateAvatarCreationFeePurchase" ]]
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), externalSettingsModule (ref), requestAvatarCreationFeePurchaseModule (ref), promiseModule (ref), getAccountInfoModule (ref), getBalanceInfoModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), getUnifiedPurchaseFlowEligibilityModule (ref), resolvePromptStateModule (ref), errorOccurredModule (ref)
	return thunkModule.new(script.Name, list, function(p4, p5) --[[ line: 26 ]]
		-- upvalues: networkModule (copy), externalSettingsModule (copy), requestAvatarCreationFeePurchaseModule (copy), p2 (ref), p1 (ref), promiseModule (copy), getAccountInfoModule (copy), getBalanceInfoModule (copy), fFlagEnableUnifiedProductPurchaseFlow (copy), getUnifiedPurchaseFlowEligibilityModule (copy), p3 (ref), p0 (ref), resolvePromptStateModule (copy), errorOccurredModule (copy)
		local var11 = p5[networkModule]
		local var12 = p5[externalSettingsModule]
		p4:dispatch(requestAvatarCreationFeePurchaseModule(p2, p1))
		
		return promiseModule.all({
			accountInfo = getAccountInfoModule(var11, var12),
			balanceInfo = getBalanceInfoModule(var11, var12, true),
			isUserEligibleForUnifiedPurchaseFlow = if fFlagEnableUnifiedProductPurchaseFlow then getUnifiedPurchaseFlowEligibilityModule(var11) else nil
		}):andThen(function(p7) --[[ line: 39 ]]
			-- upvalues: p3 (copy), p0 (copy), p4 (ref), resolvePromptStateModule (copy)
			p4:dispatch(resolvePromptStateModule({
				PriceInRobux = p3,
				Name = p0.name,
				Description = p0.description
			}, p7.accountInfo, p7.balanceInfo, false, true, p3, p7.isUserEligibleForUnifiedPurchaseFlow))
		end):catch(function(p6) --[[ line: 57 ]]
			-- upvalues: p4 (ref), errorOccurredModule (copy)
			p4:dispatch(errorOccurredModule(p6))
		end)
	end)
end