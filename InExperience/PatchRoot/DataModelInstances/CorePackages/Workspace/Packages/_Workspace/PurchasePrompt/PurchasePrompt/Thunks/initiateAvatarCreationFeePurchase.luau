local parent = script.Parent.Parent
local requestAvatarCreationFeePurchaseModule = require(parent.Actions.RequestAvatarCreationFeePurchase)
local promiseModule = require(parent.Promise)
local thunkModule = require(parent.Thunk)
local networkModule = require(parent.Services.Network)
local externalSettingsModule = require(parent.Services.ExternalSettings)
local getBalanceInfoModule = require(parent.Network.getBalanceInfo)
local getAccountInfoModule = require(parent.Network.getAccountInfo)
local errorOccurredModule = require(parent.Actions.ErrorOccurred)
local getUnifiedPurchaseFlowEligibilityModule = require(parent.Network.getUnifiedPurchaseFlowEligibility)
local resolvePromptStateModule = require(script.Parent.resolvePromptState)
local list = { networkModule, externalSettingsModule }

return function(p1, p2, p3, p4)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), externalSettingsModule (ref), requestAvatarCreationFeePurchaseModule (ref), promiseModule (ref), getAccountInfoModule (ref), getBalanceInfoModule (ref), getUnifiedPurchaseFlowEligibilityModule (ref), resolvePromptStateModule (ref), errorOccurredModule (ref)
	return thunkModule.new(script.Name, list, function(p5, p6)
		-- upvalues: networkModule (copy), externalSettingsModule (copy), requestAvatarCreationFeePurchaseModule (copy), p3 (ref), p2 (ref), promiseModule (copy), getAccountInfoModule (copy), getBalanceInfoModule (copy), getUnifiedPurchaseFlowEligibilityModule (copy), p4 (ref), p1 (ref), resolvePromptStateModule (copy), errorOccurredModule (copy)
		local var1 = p6[networkModule]
		local var2 = p6[externalSettingsModule]
		p5:dispatch(requestAvatarCreationFeePurchaseModule(p3, p2))
		
		return promiseModule.all({
			accountInfo = getAccountInfoModule(var1, var2),
			balanceInfo = getBalanceInfoModule(var1, var2, true),
			isUserEligibleForUnifiedPurchaseFlow = getUnifiedPurchaseFlowEligibilityModule(var1)
		}):andThen(function(p7)
			-- upvalues: p4 (copy), p1 (copy), p5 (ref), resolvePromptStateModule (copy)
			p5:dispatch(resolvePromptStateModule({
				PriceInRobux = p4,
				Name = p1.name,
				Description = p1.description
			}, p7.accountInfo, p7.balanceInfo, false, true, p4, p7.isUserEligibleForUnifiedPurchaseFlow))
		end):catch(function(p7)
			-- upvalues: p5 (ref), errorOccurredModule (copy)
			p5:dispatch(errorOccurredModule(p7))
		end)
	end)
end