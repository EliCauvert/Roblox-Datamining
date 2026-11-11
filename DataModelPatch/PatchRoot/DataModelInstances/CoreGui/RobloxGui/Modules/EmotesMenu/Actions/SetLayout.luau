return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Layout)
	return { layout = Layout }
end)