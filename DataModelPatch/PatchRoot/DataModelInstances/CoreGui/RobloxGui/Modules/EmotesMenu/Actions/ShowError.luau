return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ErrorText)
	return { errorText = ErrorText }
end)