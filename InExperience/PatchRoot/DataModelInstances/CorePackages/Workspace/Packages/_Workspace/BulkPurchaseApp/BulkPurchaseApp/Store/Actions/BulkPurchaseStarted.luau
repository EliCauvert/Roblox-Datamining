return require(script:FindFirstAncestor("BulkPurchaseApp").Parent.Rodux).makeActionCreator("BulkPurchaseStarted", function(p1)
	return { balance = p1 }
end)