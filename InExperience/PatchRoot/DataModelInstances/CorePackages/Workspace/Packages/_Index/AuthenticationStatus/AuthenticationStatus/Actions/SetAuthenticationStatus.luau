return require(script:FindFirstAncestor("AuthenticationStatus").Parent.Rodux).makeActionCreator(script.Name, function(Status) --[[ Line: 5 ]]
	return { status = Status }
end)