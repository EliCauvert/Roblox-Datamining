return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Info)
	return { info = Info }
end)