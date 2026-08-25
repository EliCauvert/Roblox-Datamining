return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { toastTitle = p0, toastSubtitle = p1 }
end)