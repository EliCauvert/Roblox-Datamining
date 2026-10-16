return require(script:FindFirstAncestor("AppTabBarRodux").Parent.Rodux).makeActionCreator(script.Name, function(IsVisible) --[[ Line: 5 ]]
	return { isVisible = IsVisible }
end)