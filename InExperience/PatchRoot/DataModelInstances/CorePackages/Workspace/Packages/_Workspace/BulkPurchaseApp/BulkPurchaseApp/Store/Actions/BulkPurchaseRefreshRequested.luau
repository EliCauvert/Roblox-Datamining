return require(script:FindFirstAncestor("BulkPurchaseApp").Parent.Rodux).makeActionCreator("BulkPurchaseRefreshRequested", function(p1)
	return { batchPurchaseAuthToken = p1 }
end)