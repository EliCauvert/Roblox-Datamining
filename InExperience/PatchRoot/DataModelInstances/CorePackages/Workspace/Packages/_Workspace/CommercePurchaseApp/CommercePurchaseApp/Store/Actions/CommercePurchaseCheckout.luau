return require(script:FindFirstAncestor("CommercePurchaseApp").Parent.Rodux).makeActionCreator("CommercePurchaseCheckout", function(p0)
	return { checkoutSessionId = p0 }
end)