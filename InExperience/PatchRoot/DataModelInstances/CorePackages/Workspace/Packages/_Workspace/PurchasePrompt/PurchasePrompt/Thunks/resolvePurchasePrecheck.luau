local Parent = script.Parent.Parent
local SetPromptStateModule = require(Parent.Actions.SetPromptState)
local PromptStateModule = require(Parent.Enums.PromptState)
local PurchaseWarningModule = require(Parent.Enums.PurchaseWarning)
local LaunchRobuxUpsellModule = require(Parent.Thunks.launchRobuxUpsell)
local ThunkModule = require(Parent.Thunk)

return function(ParentalConsentWarningPaymentModal13To) --[[ Line: 9 | Named "resolvePurchasePrecheck" ]]
	-- upvalues: ThunkModule (copy), PurchaseWarningModule (copy), SetPromptStateModule (copy), PromptStateModule (copy), LaunchRobuxUpsellModule (copy)
	return ThunkModule.new(script.Name, {}, function(p1, _) --[[ Line: 10 ]]
		-- upvalues: ParentalConsentWarningPaymentModal13To (copy), PurchaseWarningModule (upval), SetPromptStateModule (upval), PromptStateModule (upval), LaunchRobuxUpsellModule (upval)
		return if ParentalConsentWarningPaymentModal13To == PurchaseWarningModule.U13PaymentModal then p1:dispatch(SetPromptStateModule(PromptStateModule.U13PaymentModal)) elseif ParentalConsentWarningPaymentModal13To == PurchaseWarningModule.U13MonthlyThreshold1Modal then p1:dispatch(SetPromptStateModule(PromptStateModule.U13MonthlyThreshold1Modal)) elseif ParentalConsentWarningPaymentModal13To == PurchaseWarningModule.RequireEmailVerification then p1:dispatch(SetPromptStateModule(PromptStateModule.RequireEmailVerification)) elseif ParentalConsentWarningPaymentModal13To == PurchaseWarningModule.U13MonthlyThreshold2Modal then p1:dispatch(SetPromptStateModule(PromptStateModule.U13MonthlyThreshold2Modal)) elseif ParentalConsentWarningPaymentModal13To == PurchaseWarningModule.ParentalConsentWarningPaymentModal13To17 then p1:dispatch(SetPromptStateModule(PromptStateModule.ParentalConsentWarningPaymentModal13To17)) else p1:dispatch(LaunchRobuxUpsellModule())
	end)
end