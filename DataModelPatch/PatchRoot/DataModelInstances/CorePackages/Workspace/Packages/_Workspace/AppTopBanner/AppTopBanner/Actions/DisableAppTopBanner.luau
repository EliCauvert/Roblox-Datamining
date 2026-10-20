return require(script:FindFirstAncestor("AppTopBanner").Parent.Rodux).makeActionCreator(script.Name, function(IsDisabled)
	return { isDisabled = IsDisabled }
end)