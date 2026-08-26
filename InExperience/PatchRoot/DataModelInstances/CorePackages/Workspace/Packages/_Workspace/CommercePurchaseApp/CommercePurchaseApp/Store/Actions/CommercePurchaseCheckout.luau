return require(script:FindFirstAncestor("CommercePurchaseApp").Parent.Rodux).makeActionCreator("CommercePurchaseCheckout", function(p1)
	return { checkoutSessionId = p1 }
end)