return require(script:FindFirstAncestor("ServerDrivenUi").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { feedStoreKey = p1 }
end)