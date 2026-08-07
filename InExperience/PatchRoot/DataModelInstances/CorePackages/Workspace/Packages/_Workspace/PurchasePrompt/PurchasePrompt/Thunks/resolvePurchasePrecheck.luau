local parent = script.Parent.Parent
local setPromptStateModule = require(parent.Actions.SetPromptState)
local promptStateModule = require(parent.Enums.PromptState)
local purchaseWarningModule = require(parent.Enums.PurchaseWarning)
local launchRobuxUpsellModule = require(parent.Thunks.launchRobuxUpsell)
local thunkModule = require(parent.Thunk)

return function(p0) --[[ line: 9 | named "resolvePurchasePrecheck" ]]
	-- upvalues: thunkModule (ref), purchaseWarningModule (ref), setPromptStateModule (ref), promptStateModule (ref), launchRobuxUpsellModule (ref)
	return thunkModule.new(script.Name, {}, function(p1, _) --[[ line: 10 ]]
		-- upvalues: p0 (ref), purchaseWarningModule (copy), setPromptStateModule (copy), promptStateModule (copy), launchRobuxUpsellModule (copy)
		return if p0 == purchaseWarningModule.U13PaymentModal then p1:dispatch(setPromptStateModule(promptStateModule.U13PaymentModal)) elseif p0 == purchaseWarningModule.U13MonthlyThreshold1Modal then p1:dispatch(setPromptStateModule(promptStateModule.U13MonthlyThreshold1Modal)) elseif p0 == purchaseWarningModule.RequireEmailVerification then p1:dispatch(setPromptStateModule(promptStateModule.RequireEmailVerification)) elseif p0 == purchaseWarningModule.U13MonthlyThreshold2Modal then p1:dispatch(setPromptStateModule(promptStateModule.U13MonthlyThreshold2Modal)) elseif p0 == purchaseWarningModule.ParentalConsentWarningPaymentModal13To17 then p1:dispatch(setPromptStateModule(promptStateModule.ParentalConsentWarningPaymentModal13To17)) else p1:dispatch(launchRobuxUpsellModule())
	end)
end