return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(IsVisible)
	return { isVisible = IsVisible }
end)