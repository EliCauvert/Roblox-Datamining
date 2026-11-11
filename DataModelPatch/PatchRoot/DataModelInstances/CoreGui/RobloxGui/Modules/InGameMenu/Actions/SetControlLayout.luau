return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_CONTROL_LAYOUT", function(ControlLayout)
	return { controlLayout = ControlLayout }
end)