return require(script:FindFirstAncestor("FormFactor").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { formFactor = p1 }
end)