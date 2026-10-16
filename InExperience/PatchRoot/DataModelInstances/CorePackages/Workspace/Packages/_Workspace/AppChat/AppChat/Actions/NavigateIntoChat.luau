return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(p1) --[[ Line: 5 ]]
	return { screen = p1.screen, params = p1.params }
end)