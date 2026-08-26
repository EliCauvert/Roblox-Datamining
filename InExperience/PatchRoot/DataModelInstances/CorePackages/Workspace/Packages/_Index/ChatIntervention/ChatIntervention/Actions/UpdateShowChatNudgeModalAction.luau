return require(script:FindFirstAncestor("ChatIntervention").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { isShow = p1 }
end)