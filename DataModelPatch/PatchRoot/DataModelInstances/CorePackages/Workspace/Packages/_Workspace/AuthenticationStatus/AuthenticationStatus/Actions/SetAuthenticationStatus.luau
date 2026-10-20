return require(script:FindFirstAncestor("AuthenticationStatus").Parent.Rodux).makeActionCreator(script.Name, function(Status)
	return { status = Status }
end)