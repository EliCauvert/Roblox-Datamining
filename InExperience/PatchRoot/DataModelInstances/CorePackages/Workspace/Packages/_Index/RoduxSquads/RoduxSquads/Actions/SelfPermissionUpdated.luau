return require(script:FindFirstAncestor("RoduxSquads").Parent.Rodux).makeActionCreator(script.Name, function(SelfPermissions) --[[ Line: 6 ]]
	return { payload = { selfPermissions = SelfPermissions } }
end)