return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Title, BodyText, DismissCallback)
	return {
		title = Title,
		bodyText = BodyText,
		dismissCallback = DismissCallback
	}
end)