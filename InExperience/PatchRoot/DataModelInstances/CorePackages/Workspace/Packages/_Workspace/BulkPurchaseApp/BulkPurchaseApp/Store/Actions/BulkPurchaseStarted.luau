return require(script:FindFirstAncestor("BulkPurchaseApp").Parent.Rodux).makeActionCreator("BulkPurchaseStarted", function(p0) --[[ line: 10 ]]
	return { balance = p0 }
end)