return require(script:FindFirstAncestor("AppTabBarRodux").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { isVisible = p1 }
end)