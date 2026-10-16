return require(script:FindFirstAncestor("CommercePurchaseApp").Parent.Rodux).makeActionCreator("CommercePurchaseCheckout", function(CheckoutSessionId) --[[ Line: 10 ]]
	return { checkoutSessionId = CheckoutSessionId }
end)