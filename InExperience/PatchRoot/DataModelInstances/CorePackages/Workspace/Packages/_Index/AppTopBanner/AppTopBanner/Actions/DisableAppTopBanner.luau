return require(script:FindFirstAncestor("AppTopBanner").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { isDisabled = p0 }
end)