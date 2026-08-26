local parent = script.Parent.Parent
local setPromptStateModule = require(parent.Actions.SetPromptState)
local promptStateModule = require(parent.Enums.PromptState)
local purchaseWarningModule = require(parent.Enums.PurchaseWarning)
local launchRobuxUpsellModule = require(parent.Thunks.launchRobuxUpsell)
local thunkModule = require(parent.Thunk)

return function(p1)
	-- upvalues: thunkModule (ref), purchaseWarningModule (ref), setPromptStateModule (ref), promptStateModule (ref), launchRobuxUpsellModule (ref)
	return thunkModule.new(script.Name, {}, function(p2, _)
		-- upvalues: p1 (ref), purchaseWarningModule (copy), setPromptStateModule (copy), promptStateModule (copy), launchRobuxUpsellModule (copy)
		return if p1 == purchaseWarningModule.U13PaymentModal then p2:dispatch(setPromptStateModule(promptStateModule.U13PaymentModal)) elseif p1 == purchaseWarningModule.U13MonthlyThreshold1Modal then p2:dispatch(setPromptStateModule(promptStateModule.U13MonthlyThreshold1Modal)) elseif p1 == purchaseWarningModule.RequireEmailVerification then p2:dispatch(setPromptStateModule(promptStateModule.RequireEmailVerification)) elseif p1 == purchaseWarningModule.U13MonthlyThreshold2Modal then p2:dispatch(setPromptStateModule(promptStateModule.U13MonthlyThreshold2Modal)) elseif p1 == purchaseWarningModule.ParentalConsentWarningPaymentModal13To17 then p2:dispatch(setPromptStateModule(promptStateModule.ParentalConsentWarningPaymentModal13To17)) else p2:dispatch(launchRobuxUpsellModule())
	end)
end