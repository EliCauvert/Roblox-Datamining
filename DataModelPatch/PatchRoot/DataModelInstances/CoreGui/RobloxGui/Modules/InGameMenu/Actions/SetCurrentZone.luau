return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Zone)
	return { zone = Zone }
end)