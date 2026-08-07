return require(script:FindFirstAncestor("AuthenticationStatus").Parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 5 ]]
	return { status = p0 }
end)