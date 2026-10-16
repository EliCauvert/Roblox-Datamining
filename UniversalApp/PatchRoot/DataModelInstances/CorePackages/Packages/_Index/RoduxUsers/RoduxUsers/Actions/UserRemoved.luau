return require(script:FindFirstAncestor("RoduxUsers").Parent.Rodux).makeActionCreator(script.Name, function(Id) --[[ Line: 5 ]]
	return { payload = { id = Id } }
end)