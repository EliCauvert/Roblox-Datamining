return require(script:FindFirstAncestor("AppTabBarRodux").Parent.Rodux).makeActionCreator(script.Name, function(IsVisible)
	return { isVisible = IsVisible }
end)