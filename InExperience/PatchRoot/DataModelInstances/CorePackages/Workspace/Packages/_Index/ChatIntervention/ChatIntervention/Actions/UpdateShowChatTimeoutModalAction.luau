return require(script:FindFirstAncestor("ChatIntervention").Parent.Rodux).makeActionCreator(script.Name, function(IsShow)
	return { isShow = IsShow }
end)