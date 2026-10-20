return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ErrorMessage)
	return { errorMessage = ErrorMessage }
end)