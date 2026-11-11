return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(LookId)
	return { lookId = LookId }
end)