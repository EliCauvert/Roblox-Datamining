return require(script:FindFirstAncestor("CommercePurchaseApp").Parent.Rodux).makeActionCreator("CommercePurchaseStarted", function(CommerceProductId) --[[ Line: 10 ]]
	return { commerceProductId = CommerceProductId }
end)