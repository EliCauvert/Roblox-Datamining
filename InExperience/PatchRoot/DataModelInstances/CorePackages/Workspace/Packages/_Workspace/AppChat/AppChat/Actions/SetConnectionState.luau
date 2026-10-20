return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConnectionState)
	return { connectionState = ConnectionState }
end)