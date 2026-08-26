return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_INPUT_TYPE", function(p1)
	return { inputType = p1 }
end)