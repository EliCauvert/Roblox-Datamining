return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_INPUT_TYPE", function(InputType)
	return { inputType = InputType }
end)