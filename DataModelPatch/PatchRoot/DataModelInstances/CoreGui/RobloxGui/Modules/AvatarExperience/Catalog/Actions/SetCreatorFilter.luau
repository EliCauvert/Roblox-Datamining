return (require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1)
	return { creatorFilter = p1 or "" }
end))