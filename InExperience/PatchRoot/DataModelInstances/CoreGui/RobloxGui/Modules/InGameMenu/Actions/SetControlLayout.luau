return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_CONTROL_LAYOUT", function(p1)
	return { controlLayout = p1 }
end)