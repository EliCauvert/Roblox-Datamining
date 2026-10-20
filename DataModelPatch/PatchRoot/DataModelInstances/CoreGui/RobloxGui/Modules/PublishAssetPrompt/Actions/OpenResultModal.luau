return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ResultType)
	return { resultType = ResultType }
end)