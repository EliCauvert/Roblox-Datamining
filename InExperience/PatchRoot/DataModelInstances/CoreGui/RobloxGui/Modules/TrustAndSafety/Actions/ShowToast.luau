return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { toastTitle = p1, toastSubtitle = p2 }
end)