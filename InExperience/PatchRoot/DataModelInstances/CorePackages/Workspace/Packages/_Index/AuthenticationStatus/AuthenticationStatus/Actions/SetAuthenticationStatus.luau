return require(script:FindFirstAncestor("AuthenticationStatus").Parent.Rodux).makeActionCreator(script.Name, function(p0)
	return { status = p0 }
end)