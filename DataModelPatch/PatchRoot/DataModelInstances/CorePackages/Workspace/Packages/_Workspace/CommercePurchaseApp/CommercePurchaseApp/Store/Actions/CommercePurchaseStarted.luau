return require(script:FindFirstAncestor("CommercePurchaseApp").Parent.Rodux).makeActionCreator("CommercePurchaseStarted", function(CommerceProductId)
	return { commerceProductId = CommerceProductId }
end)