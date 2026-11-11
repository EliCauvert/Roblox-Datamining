return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(SelfPermissions)
	return { payload = { selfPermissions = SelfPermissions } }
end)