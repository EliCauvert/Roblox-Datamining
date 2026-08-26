return require(script:FindFirstAncestor("AuthenticationStatus").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { status = p1 }
end)