return require(script:FindFirstAncestor("RoduxUsers").Parent.Rodux).makeActionCreator(script.Name, function(Payload) --[[ Line: 5 ]]
	return { payload = Payload }
end)