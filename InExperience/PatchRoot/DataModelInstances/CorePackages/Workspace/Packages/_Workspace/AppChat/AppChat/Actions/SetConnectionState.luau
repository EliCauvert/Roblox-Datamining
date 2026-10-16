return require(script:FindFirstAncestor("AppChat").Parent.Rodux).makeActionCreator(script.Name, function(ConnectionState) --[[ Line: 7 ]]
	return { connectionState = ConnectionState }
end)