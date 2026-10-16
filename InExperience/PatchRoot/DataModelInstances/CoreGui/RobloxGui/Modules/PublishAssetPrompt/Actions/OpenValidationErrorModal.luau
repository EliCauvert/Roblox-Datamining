return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ErrorMessage) --[[ Line: 5 ]]
	return { errorMessage = ErrorMessage }
end)