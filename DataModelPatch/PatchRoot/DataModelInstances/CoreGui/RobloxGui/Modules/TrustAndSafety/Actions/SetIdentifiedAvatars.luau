return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(IdentifiedAvatars)
	return { identifiedAvatars = IdentifiedAvatars }
end)