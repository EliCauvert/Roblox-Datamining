return require(script:FindFirstAncestor("CommercePurchaseApp").Parent.Rodux).makeActionCreator("CommercePurchaseStarted", function(p0) --[[ line: 10 ]]
	return { commerceProductId = p0 }
end)