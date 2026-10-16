return require(script:FindFirstAncestor("RoduxCall").Parent.Rodux).makeActionCreator(script.Name, function(Call) --[[ Line: 5 ]]
	return { payload = { call = Call } }
end)