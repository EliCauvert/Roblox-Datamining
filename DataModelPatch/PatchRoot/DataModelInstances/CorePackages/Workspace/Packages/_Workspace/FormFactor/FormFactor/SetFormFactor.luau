return require(script:FindFirstAncestor("FormFactor").Parent.Rodux).makeActionCreator(script.Name, function(FormFactor)
	return { formFactor = FormFactor }
end)