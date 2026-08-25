return require(script:FindFirstAncestor("ServerDrivenUi").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { feedStoreKey = p0 }
end)