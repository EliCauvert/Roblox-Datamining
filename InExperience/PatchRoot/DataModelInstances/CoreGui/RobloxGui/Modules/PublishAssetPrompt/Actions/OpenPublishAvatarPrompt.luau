return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { promptInfo = { promptType = p1, guid = p2, scopes = p3 } }
end)