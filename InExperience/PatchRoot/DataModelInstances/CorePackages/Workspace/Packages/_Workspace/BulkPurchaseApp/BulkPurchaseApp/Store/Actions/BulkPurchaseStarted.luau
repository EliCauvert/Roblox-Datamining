return require(script:FindFirstAncestor("BulkPurchaseApp").Parent.Rodux).makeActionCreator("BulkPurchaseStarted", function(Balance) --[[ Line: 12 ]]
	return { balance = Balance }
end)