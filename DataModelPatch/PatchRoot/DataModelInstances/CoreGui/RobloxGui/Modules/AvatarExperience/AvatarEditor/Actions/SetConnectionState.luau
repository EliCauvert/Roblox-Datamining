return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ConnectionState)
	return { connectionState = ConnectionState }
end)