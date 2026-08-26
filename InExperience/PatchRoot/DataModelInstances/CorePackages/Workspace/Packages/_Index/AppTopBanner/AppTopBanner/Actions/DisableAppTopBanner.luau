return require(script:FindFirstAncestor("AppTopBanner").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { isDisabled = p1 }
end)