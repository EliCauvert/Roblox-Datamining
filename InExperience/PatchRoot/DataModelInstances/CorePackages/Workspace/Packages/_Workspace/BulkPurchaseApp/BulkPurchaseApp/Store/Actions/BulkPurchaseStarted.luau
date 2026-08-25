return require(script:FindFirstAncestor("BulkPurchaseApp").Parent.Rodux).makeActionCreator("BulkPurchaseStarted", function(p0)
	return { balance = p0 }
end)