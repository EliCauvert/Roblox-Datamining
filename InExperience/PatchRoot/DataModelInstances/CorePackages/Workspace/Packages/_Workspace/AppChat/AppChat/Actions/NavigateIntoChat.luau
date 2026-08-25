return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { screen = p0.screen, params = p0.params }
end)