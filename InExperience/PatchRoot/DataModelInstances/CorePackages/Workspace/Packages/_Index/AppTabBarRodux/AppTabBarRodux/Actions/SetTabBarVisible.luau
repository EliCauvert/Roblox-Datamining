return require(script:FindFirstAncestor("AppTabBarRodux").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { isVisible = p0 }
end)