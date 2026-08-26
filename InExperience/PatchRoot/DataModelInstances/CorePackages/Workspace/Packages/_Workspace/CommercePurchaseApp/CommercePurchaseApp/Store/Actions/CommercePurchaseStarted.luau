return require(script:FindFirstAncestor("CommercePurchaseApp").Parent.Rodux).makeActionCreator("CommercePurchaseStarted", function(p1)
	return { commerceProductId = p1 }
end)