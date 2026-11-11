return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(SelectedAvatars)
	return { selectedAvatars = SelectedAvatars }
end)