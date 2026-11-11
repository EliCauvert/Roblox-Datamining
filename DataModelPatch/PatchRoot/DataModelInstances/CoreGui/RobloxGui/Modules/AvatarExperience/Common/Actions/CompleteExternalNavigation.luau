return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(RequestId)
	return { requestId = RequestId }
end)