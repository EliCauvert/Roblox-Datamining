return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0, p1, p2)
	return { promptInfo = { promptType = p0, guid = p1, scopes = p2 } }
end)